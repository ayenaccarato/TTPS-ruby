# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    if user.rol == 'administrador'
      return unless user.rol == 'administrador'  # additional permissions for administrators
      
      can :destroy, User do |us|
        us.id != user.id
      end

      can :manage, :all 

    elsif user.rol == 'personal_bancario'
      return unless user.rol == 'personal_bancario' # additional permissions for personal bancario
      can :read, User do |us|
        us.id == user.id || us.rol == 'cliente'
      end

      can :update, User do |us|
        us.id == user.id
      end

      can :read, Turn do |turn|
        turn.sucursal_id == user.sucursal_id
      end

      can :update, Turn do |turn|
        turno.sucursal_id == user.sucursal_id
      end

      can :read, Sucursal
    
    else
      return unless user.rol == 'cliente' # additional permissions for cliente
      can :read, User do |us|
        us.id == user.id
      end

      can :update, User do |us|
        us.id == user.id
      end

      can :create, Turn

      can :manage, Turn  do |turn|
        turn.user_id == user.id
      end

    end
  end

end
