class Session::Operation
  class SignUp < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: Session::Contract::Create)
    end

    step Nested(Present)
    step :set_default_role
    step Contract::Validate()
    step :invoke_tyrant
    step Contract::Persist()
    step :notify!

    private

    def notify!(options, model:, **)
      options["result.notify"] = Rails.logger.info("New user #{model.email}.")
    end

    def set_default_role(_options, hsh)
      hsh[:model].role = 0
    end

    def invoke_tyrant(options, _hsh)
      contract = options["contract.default"]
      auth = Tyrant::Authenticatable.new(contract.model)
      auth.digest!(contract.password)
      auth.confirmed!
      auth.sync
    end
  end
end
