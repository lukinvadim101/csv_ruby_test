class Store
  attr_accessor :store
  def initialize(file_path)
    @store = ::CSV.read(file_path, :headers => :true )
  end

  # def filter(params)
  #   params.each_ do |param|
  #     filter_handler.filter_more(store, param)
  #   end
  # end


  # def filter_handler
  #   @filter_handler ||= Filter.new()
  #   puts @filter_handler
  # end
  
end
