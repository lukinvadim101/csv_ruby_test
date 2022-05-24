class Sort 
	def initialize(csv_table)
		@sorted = csv_table
	end

	def sort(field = 'Id')
		CSV::Table.new(@sorted.sort_by {|a| a[field]}, headers: true)
	end
end