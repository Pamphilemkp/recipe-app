class Ability
  include CanCan::Ability

  def initialize(user)
    # return unless user.present?
    # can :read, :all
    # return unless user.admin?
    # can :manage, :all
    can :read, :all
    can :manage, Recipe, user_id: user.id
    can :manage, Food
    can :manage, Recipefood
  end
end
