module  Item::Contract
  class Create < Reform::Form
    property :category
    property :price
    property :name

    validates :name, :category, :price, presence: true
  end
end
