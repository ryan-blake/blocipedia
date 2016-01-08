class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
   Wiki.user == current_user || user.admin?
  end

  def update?
    user.admin? or not post.published?
  end
end
