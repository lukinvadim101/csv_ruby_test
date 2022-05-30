require_relative './filter'

class Store
  attr_accessor :store
  def initialize(array)
    @store = array
  end

  def filter(params)
    @store = Filter.new(@store).filter(params)
  end

  def sort(sort_opt)
    @store = Sort.new(@store).sort(sort_opt)
  end
end
