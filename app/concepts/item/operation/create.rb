class Item::Create < Trailblazer::Operation
  step Policy::Pundit(ItemPolicy, :create?)
  step Model(Item, :new)
  step Contract::Build(constant: Item::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
end
