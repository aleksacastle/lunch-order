class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def tyrant
   Tyrant::Session.new(request.env['warden'])
  end

  private
  def _run_options(options)
    options.merge( "current_user" => tyrant.current_user )
  end

  helper_method :tyrant
end
