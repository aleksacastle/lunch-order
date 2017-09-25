class Item::Show < Trailblazer::Operation
  step Model(Item, :find_by)
end
