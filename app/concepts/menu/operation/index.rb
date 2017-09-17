class Menu::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] = ::Menu.all.reverse_order
  end

end
