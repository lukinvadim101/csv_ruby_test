class Filter
	def initialize(params)
		@arr = params
	end

  def filter(params)
		@field, action, @condition = params
		CSV::Table.new(public_send("filter_#{action}"), headers: true)
	end 

	def filter_more
		@arr.select{|str| str[@field].to_i > @condition.to_i}
	end

	def filter_less
		@arr.select{|str| str[@field].to_i < @condition.to_i}
	end

	def filter_equal
		@arr.select{|str| str[@field] == @condition}
	end
end