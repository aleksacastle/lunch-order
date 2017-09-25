require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to define_enum_for(:role).with(%i[user admin]) }
  it { is_expected.to have_db_column(:auth_meta_data) }
  it { is_expected.to have_db_column(:email) }
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:role) }
end
