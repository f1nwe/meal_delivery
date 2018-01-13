# frozen_string_literal: true

module MealHolder
  extend ActiveSupport::Concern

  class_methods do
    def has_many_meals(relation, args = {})
      default_args = {
        class_name: args.fetch(:class_name, relation.to_s.classify),
        inverse_of: :menu,
        dependent: :destroy
      }

      has_many relation, default_args.merge(args)
    end
  end
end
