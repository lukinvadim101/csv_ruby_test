require 'csv'
require_relative 'csv_manager/file'
require_relative 'csv_manager/sort'
require_relative 'csv_manager/filter'
require_relative 'csv_manager/store'

class CsvManager 

  def csv_create(csv)
	  File.write('db/done.csv', csv.to_csv)
	end

	def run(path: nil, filter: nil, sort: nil)
    if(!path)
      puts 'File Path error'
      return
    end

    store_obj = Store.new(CsvFile.new(path).csv)

    if (filter)
      filter.each { |param| store_obj.filter(param) }
    end

    if(sort)
      store_obj.sort(sort)
    end

    csv_create(store_obj.store)
	end
end


# CsvManager.new().run(path: 'db/db.csv', filter:[['Age','more',10]])
# CsvManager.new().run(path: 'db/db.csv', filter:[['Age','more',10],['Name','equal','Marge']])
# CsvManager.new().run(path: 'db/db.csv', sort:'Id')