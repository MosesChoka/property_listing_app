# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    if user.admin?
      can :manage, :all
    elsif user.landlord?
      can :manage, Property, user_id: user.id
      can :read, Property
    else
      can :read, Property, status: "approved"
    end
  end
end
