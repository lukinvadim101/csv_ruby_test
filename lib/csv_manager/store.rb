require_relative './filter'

class Store
  attr_accessor :store
  def initialize(array)
    @store = array
  end

  def filter(field, action, condition)
    @store = Filter.new(@store).filter(field, action, condition)
  end

  def sort(sort_opt)
    @store = Sort.new(@store).sort(sort_opt)
  end
end
