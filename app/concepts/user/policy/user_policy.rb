# pundit policy object
class UserPolicy
  def initialize(user, model)
    @user = user || NoUser.new
    @model = model
  end

  def create?
    user.admin?
  end

  def update?
    return true if user.admin?
    user.id == model.id
  end

  def destroy?
    user.admin?
  end

  def show?
    user.user? || user.admin?
  end

  def index?
    user.admin?
  end

  protected

  attr_reader :user, :model
end
