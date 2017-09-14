class User::Operation
  # collection of users
  class Index < Trailblazer::Operation
    step Policy::Pundit(UserPolicy, :index?)
    step :model!

    private

    def model!(operation, current_user: nil, **)
      operation['model'] = ::User.all.excluding_user(current_user)
    end
  end
end
