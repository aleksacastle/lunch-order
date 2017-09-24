require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to have_db_column(:id) }
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:price) }
  it { is_expected.to have_db_column(:avatar) }
  it { is_expected.to have_db_column(:menu_id) }
  
  it { is_expected.to define_enum_for(:category).with(%i[first_course second_course third_course]) }

  it { is_expected.to belong_to(:menu) }
end
