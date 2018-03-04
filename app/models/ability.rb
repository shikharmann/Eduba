class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?  # permissions for logged in users (they can manage their posts)
      if user.ADMIN?  # additional permissions for administrators
        can :manage, :all
        # can :manage, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
      elsif user.CUSTOMER?
        can :read, [Course, Document, Subtopic, Topic]
      else #VISITOR or other cases
        can :read, [Course, Subtopic, Topic]
      end
    end
    can :read, [Course, Subtopic, Topic]
  end
end
