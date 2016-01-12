class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
    if wiki.private
      user.present? && (user.premium? || user.admin?)
    else
      true
    end
  end

  def update?
    user.present?
  end
end
