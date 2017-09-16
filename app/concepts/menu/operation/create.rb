class Menu::Create < Trailblazer::Operation
  step Policy::Pundit(MenuPolicy, :create?)
  step Model(Menu, :new)
  step :add_item!
  step Contract::Build(constant: Menu::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()

  private
  def add_item
  end
end
