# frozen_string_literal: true

class Sort
  def initialize(store_obj)
    @store_obj = store_obj
  end

  def execute(field)
    CSV::Table.new(@store_obj.store.sort_by { |a| a[field] }, headers: true)
  end
end
