class SessionsController < ApplicationController
  before_action only: %i[sign_in_form sign_in] do
    redirect_to root_path if tyrant.signed_in?
  end

  def sign_up_form
    run Session::Operation::SignUp::Present
    render cell(Session::Cell::SignUpForm, @form)
  end

  def sign_up
    run Session::Operation::SignUp, params[:user] do |_op|
      flash[:notice] = 'Please log in now!'
      return redirect_to sessions_sign_in_form_path
    end
    render cell(Session::Cell::SignUpForm, @form)
  end

  def sign_in_form
    run Session::Operation::SignIn::Present
    render cell(Session::Cell::SignInForm, @form)
  end

  def sign_in
    run Session::Operation::SignIn, params[:session] do |op|
      tyrant.sign_in!(op['model'])
      return redirect_to root_path
    end

    render cell(Session::Cell::SignInForm, @form)
  end

  def sign_out
    run Session::Operation::SignOut do |op|
      tyrant.sign_out!
      return redirect_to sessions_sign_in_form_path
    end
  end
end
