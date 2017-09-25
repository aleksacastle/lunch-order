module Features
  module UserHelpers
    DEFAULT_PASSWORD = '12345678'.freeze
    DEFAULT_EMAIL = 'real_user@gmail.com'.freeze

    def create_valid_user(email: DEFAULT_EMAIL, password: DEFAULT_PASSWORD)
      valid_creds = {
        email: email,
        password: password,
        confirm_password: password
      }
      Session::Operation::SignUp.call(valid_creds)
    end

    def create_admin
      valid_creds = {
        email: 'admin@gmail.com',
        password: 'complicated_stuf',
        confirm_password: 'complicated_stuf'
      }
      op = Session::Operation::SignUp.call(valid_creds)
      op['model'].update_attribute(:role, 2)
      op['model']
    end

    def login_valid_user(email = DEFAULT_EMAIL, password = DEFAULT_PASSWORD)
      valid_creds = {
        email: email,
        password: password
      }
      Session::Operation::SignIn.call(valid_creds)
    end

    def browser_login(email: DEFAULT_EMAIL, password: DEFAULT_PASSWORD)
      visit sessions_sign_in_form_path
      within '#new_session' do
        fill_in('Email', with: email)
        fill_in('Password', with: password)
        click_button 'Log in'
      end
    end

    def default_user_creds
      {
        email: DEFAULT_EMAIL,
        password: DEFAULT_PASSWORD,
        confirm_password: DEFAULT_PASSWORD
      }
    end

    def update_attributes
      {
        current_password: '12345678',
        password: '87654321',
        confirm_password: '87654321',
        first_name: 'Greg',
        last_name: 'Smith'
      }
    end
  end
end
