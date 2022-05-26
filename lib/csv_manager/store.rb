require_relative './filter'

class Store
  attr_accessor :store
  def initialize(array)
    @store = array
  end

  def filter(filter_opt)
    if(filter_opt[0]== 'filter')
      filter_opt[1..].each do |opt|
        field, action, condition = opt
        @store = Filter.new(@store).filter(field, action, condition)
      end 
    end
  end

  def sort(sort_opt)
    if(sort_opt[0]== 'sort')
      sort_field = sort_opt[1]
      @store = Sort.new(@store).sort(sort_field)
    end
  end
end
