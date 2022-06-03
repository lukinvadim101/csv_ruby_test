# frozen_string_literal: true

class Sort
  def initialize(store_obj)
    @store_obj = store_obj
  end

  def execute(params)
    field, reverse = params
    CSV::Table.new(public_send("sort_#{reverse}", field), headers: true)
  end

  def sort_(field)
    @store_obj.store.sort_by { |a| a[field] }
  end

  def sort_reverse(field)
    @store_obj.store.sort_by { |a| a[field] }.reverse
  end
end
