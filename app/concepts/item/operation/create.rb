class Item::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation

    step Model(Item, :new)
    step :add_to_menu!
    # step Policy::Pundit(ItemPolicy, :create?)
    step Contract::Build(constant: Item::Contract::Create)

    private

    def add_to_menu!(options, model:, params:, **)
      # raise model.inspect
        model.menu = Menu.find_by(id: params[:menu_id])
      #  model.menu_id = Menu.find_by(id: params[:menu_id])
    end
  end

  step Nested(Present)
  step Contract::Validate()
  step Contract::Persist()
end
