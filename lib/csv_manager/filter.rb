# frozen_string_literal: true

class Filter
  def initialize(store_obj)
    @store_obj = store_obj
  end

  def execute(params)
    field, action, condition = params
    CSV::Table.new(public_send("filter_#{action}", field, condition), headers: true)
  end

  def filter_more(field, condition)
    @store_obj.store.select { |row| row[field].to_i > condition.to_i }
  end

  def filter_less(field, condition)
    @store_obj.store.select { |row| row[field].to_i < condition.to_i }
  end

  def filter_equal(field, condition)
    @store_obj.store.select { |row| row[field] == condition.to_s }
  end
end
