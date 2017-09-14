class ItemPolicy
  def initialize(user, model)
    @user, @model = user, model
  end

  def create?
    user.admin?
  end

  def delete?
    user.admin?
  end

  def update?
    user.admin?
  end

  protected

  attr_reader :user, :model
end
