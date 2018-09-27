class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.present?
      can :manage, Order, user_id: user.id
      can :manage, OrderDetail
      if user.role?
        can :manage, :all
      end
    end
  end
end
