class Session::Operation
  class SignIn < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: Session::Contract::New)
    end

    step Nested(Present)
    step Contract::Validate()
    step :assign_user_from_contract

    def assign_user_from_contract(params)
      params['model'] = params['contract.default'].user
    end
  end
end
