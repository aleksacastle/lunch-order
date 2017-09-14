require "rails_helper"
require_relative "../../../app/concepts/session/operation/sign_up"

RSpec.describe Session::Operation::SignUp, type: :controller do
  context 'valid data provided' do
    before(:example) do
      @op = create_valid_user
    end

    let(:model) { @op['model'] }

    let(:valid_creds) do
      default_user_creds
    end

    it 'creates a user with appropriate data' do
      expect(model).to be_persisted
      expect(model.email).to eq(valid_creds.fetch(:email))
      expect(Tyrant::Authenticatable.new(model).digest)
        .to eq('12345678')
    end
  end

  context 'empty hash provided' do
    let(:operation) { Session::Operation::SignUp.call({}) }
    let(:model) { operation['model'] }

    it 'returns falsey result and provides validation errors' do
      expect(operation).to be_failure
      expect(model).not_to be_persisted

      expect(operation['contract.default'].errors.messages)
        .to include(:email, :password)
    end
  end
end
