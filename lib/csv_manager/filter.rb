class Filter
	def initialize(params)
		@params = params
	end

  def filter
		CSV::Table.new(public_send("filter_#{@params[:action]}"), headers: true)
	end 

	def filter_more
		@params[:csv].select{|str| str[@params[:field]].to_i > @params[:condition].to_i}
	end

	def filter_less
		@params[:csv].select{|str| str[@params[:field]].to_i < @params[:condition].to_i}
	end

	def filter_equal
		@params[:csv].select{|str| str[@params[:field]] == @params[:condition]}
	end
end