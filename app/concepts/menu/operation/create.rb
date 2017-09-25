class Menu::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    # step Policy::Pundit(MenuPolicy, :create?)
    step Model(Menu, :new)
    step Contract::Build(constant: Menu::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate( key: :menu)
  step Contract::Persist()
  step :notify!

  def notify!(options, model:, **)
    options["result.notify"] = Rails.logger.info("New menu for #{model.weekday}.")
  end

end
