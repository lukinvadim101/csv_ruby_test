require 'csv'
require_relative 'csv_manager/sort'
require_relative 'csv_manager/filter'

class CsvFile
  attr_accessor :csv
  def initialize(file)
		@csv = CSV.read(file, :headers => :true )
  end
end


class CsvManager 
  attr_accessor :csv
  def initialize(file)
    @csv = file
  end

  def csv_create
	  File.write('data/done.csv', @csv.to_csv)
	end

	def run(filter_field,filter_sign,filter_value,sort_field)

    case filter_sign
      when '>'
        @csv = Filter.new(@csv).filter_more_than(filter_field, filter_value)
      when '<'
        @csv = Filter.new(@csv).filter_less_than(filter_field, filter_value)
      when '='
        @csv = Filter.new(@csv).filter_equal(filter_field, filter_value)
      else
        puts "inncorrect filter sign"
    end
  
    @csv = Sort.new(@csv).csv_sort(sort_field)
    csv_create()
	end
end


file = CsvFile.new('data/db.csv').csv
manager = CsvManager.new(file)
# manager.run('Age','>','3','Id')
