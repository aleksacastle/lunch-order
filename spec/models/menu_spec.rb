require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { is_expected.to have_db_column(:id) }
  it { is_expected.to have_db_column(:weekday) }
  it { is_expected.to have_db_column(:created_at) }
  it { is_expected.to have_many(:items) }
end
