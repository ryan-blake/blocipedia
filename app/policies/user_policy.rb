class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    current_user == user || user.admin?
  end

  def update?
    user.admin? or not post.published?
  end
end
