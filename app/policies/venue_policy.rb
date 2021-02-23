class VenuePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      true
    end

    def new?
    end
    
    def create?
      return true
    end
  end
end
