class Filter
	def initialize(csv_table)
		@filtred = csv_table
	end

	def filter_more_than(field = 'Id', condition)
		@filtred =  @filtred.select{|str| str[field].to_i > condition.to_i}
		return  CSV::Table.new(@filtred, headers: true)
	end

	def filter_less_than(field = 'Id', condition)
		@filtred =  @filtred.select{|str| str[field].to_i < condition.to_i}
		return  CSV::Table.new(@filtred, headers: true)
	end

	def filter_equal(field = 'Id', condition)
		@filtred =  @filtred.select{|str| str[field] == condition}
		return  CSV::Table.new(@filtred, headers: true)
	end
end