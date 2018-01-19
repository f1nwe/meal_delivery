json.status 'success'
json.data do
  json.daily_orders do
    json.array! @daily_orders do |daily_order|
      json.id daily_order.id
      json.user daily_order.user, :id, :name
      json.meals do
        json.array! daily_order.meals do |meal|
          json.id meal.id
          json.name meal.name
        end
      end
    end
  end
end
