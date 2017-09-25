module  Item::Contract
  class Create < Reform::Form
    property :category
    property :price
    property :name
    property :menu

    validates :name, :category, :price, :menu, presence: true
  end
end
