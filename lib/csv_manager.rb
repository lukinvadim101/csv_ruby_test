require 'csv'
require_relative 'csv_manager/file'
require_relative 'csv_manager/sort'
require_relative 'csv_manager/filter'

class CsvManager 
  attr_accessor :csv
  def initialize(file)
    @csv = file
  end

  def csv_create(csv)
	  File.write('data/done.csv', csv.to_csv)
	end

	def run(*args)
    if (args.size-1) % 3 == 0
      agrs_num = args.size

      while agrs_num != 1
      filter_field, filter_action, filter_condition = args

      @csv = Filter.new({
        csv: @csv,
        field: filter_field, 
        action: filter_action,
        condition:filter_condition}).filter

        args = args[3..]
        agrs_num = args.size
      end
      sort_field = args[0]
    else
      puts "wrong number of arguments"
    end
  
    @csv = Sort.new(@csv).sort(sort_field)
    csv_create(@csv)
	end
end


# store = CsvFile.new('data/db.csv').csv
# CsvManager.new(store).run('Age','more','10','Age','equal','30','Id')
