class Sort 
	def initialize(csv_table)
		@sorted = csv_table
	end

	def csv_sort(field = 'Id')
		@sorted = @sorted.sort_by {|a| a[field]}
		return CSV::Table.new(@sorted, headers: true)
	end
end