require 'csv'
require_relative 'csv_manager/file'
require_relative 'csv_manager/sort'
require_relative 'csv_manager/filter'
require_relative 'csv_manager/store'

class CsvManager 
  attr_accessor :csv
  def initialize(file)
    @csv = file
  end

  def csv_create(csv)
	  File.write('db/done.csv', csv.to_csv)
	end

	def run(filter_opt,sort_opt)
    if(filter_opt[0]== 'filter' && sort_opt[0]== 'sort')
      filter_opt[1..].each do |opt|
        field, action, condition = opt
        @csv = Filter.new({
          csv: @csv,
          field: field, 
          action: action,
          condition:condition}).filter
        end 
  
      sort_field = sort_opt[1]
      @csv = Sort.new(@csv).sort(sort_field)
  
      csv_create(@csv)
    else
      puts 'Arguments error'
    end
	end
end


store = Store.new('db/db.csv').store
CsvManager.new(store).run(['filter', ['Age','more',10],['Name','equal','Marge']],['sort','Name'])
# rake csv[data/db.csv,[filter, [age,more,10],[...]],[sort,name]]