# frozen_string_literal: true

class Store
  attr_accessor :store

  def initialize(array)
    @store = array
  end

  def filter_handler
    @filter ||= Filter.new(self)
  end

  def sort_handler
    @sort ||= Sort.new(self)
  end

  def filter(params)
    self.store = filter_handler.execute(params)
  end

  def sort(field)
    self.store = sort_handler.execute(field)
  end
end
