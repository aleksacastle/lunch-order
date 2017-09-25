class Item::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] = ::Item.all.reverse_order
  end

end
