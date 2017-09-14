class Item::Create < Trailblazer::Operation
  step :add_to_menu
  step Policy::Pundit(ItemPolicy, :create?)
  step Model(Item, :new)
  step Contract::Build(constant: Item::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()

  private

  def add_to_menu(operation, params:, **)
     model = Menu.find_by(id: params[:menu_id])
     operation['model'] = model
     operation['menu_id'] = model && model.id
  end
end
