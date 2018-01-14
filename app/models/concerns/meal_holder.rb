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
      accepts_nested_attributes_for relation, reject_if: :all_blank,
                                              allow_destroy: true
    end
  end
end
