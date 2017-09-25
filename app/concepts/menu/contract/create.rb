module  Menu::Contract
  class Create < Reform::Form
    property :weekday

    validates :weekday, presence: true
  end
end
