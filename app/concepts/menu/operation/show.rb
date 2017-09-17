class Menu::Show < Trailblazer::Operation
  step Model(Menu, :find_by)
end
