require 'rails_helper'

RSpec.describe 'SessionIntegration', type: :feature do
  context 'Sign up' do
    before(:example) do
      visit sessions_sign_up_form_path
    end

    scenario 'User signs up' do
      expect do
        within('#new_user') do
          fill_in('Email', with: scot.fetch(:email))
          fill_in('Password', with: scot.fetch(:password))
          fill_in('Confirm password', with: scot.fetch(:password))
          click_button('Sign Up')
        end
      end.to change { User.count }.by 1
    end

    scenario 'User does not provide data' do
      within('#new_user') do
        click_button('Sign Up')
      end
      expect(page).to have_content('can\'t be blank')
    end
  end

  context 'Log in' do
    before(:example) do
      Session::Operation::SignUp.call(scot
        .merge(confirm_password: scot.fetch(:password)))
      visit sessions_sign_in_form_path
    end

    scenario 'User logs in' do
      fill_and_submit_login_form
      expect(page).to have_content("Hi, #{scot.fetch(:email)}")
    end

    scenario 'User passes wrong password' do
      within('#new_session') do
        fill_in('Email', with: scot.fetch(:email))
        fill_in('Password', with: 'random')
        click_button('Log in')
      end
      expect(page).to have_content('wrong credentials.')
    end

    scenario 'User passes blank fields' do
      within('#new_session') do
        click_button('Log in')
      end
      expect(page).to have_content('can\'t be blank')
    end

    scenario 'User logs out' do
      fill_and_submit_login_form
      expect(page).to have_link('Sign out')
      click_link('Sign out')
      expect(page).to have_current_path(sessions_sign_in_form_path)
    end
  end

  def scot
    { email: 'scot.mitchal@gmail.com', password: '12345678' }
  end

  def fill_and_submit_login_form
    within('#new_session') do
      fill_in('Email', with: scot.fetch(:email))
      fill_in('Password', with: scot.fetch(:password))
      click_button('Log in')
    end
  end
end
