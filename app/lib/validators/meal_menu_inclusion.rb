# frozen_string_literal: true

module Validators
  class MealMenuInclusion < ::ActiveModel::Validator
    ERROR_MESSAGE = 'Does not included in menu'

    def validate(record)
      return if record.daily_order.menu.meal_ids.include?(record.meal_id)

      record.errors[:meal_id] << ERROR_MESSAGE
    end
  end
end
