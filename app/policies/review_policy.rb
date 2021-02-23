class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def create?
      true
    end
  end
end
