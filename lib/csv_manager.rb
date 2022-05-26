require 'csv'
require_relative 'csv_manager/file'
require_relative 'csv_manager/sort'
require_relative 'csv_manager/filter'
require_relative 'csv_manager/store'

class CsvManager 

  def csv_create(csv)
	  File.write('db/done.csv', csv.to_csv)
	end

	def run(path, filter_opt, sort_opt)
    db = CsvFile.new(path).csv
    store = Store.new(db)
    store.filter(filter_opt)
    store.sort(sort_opt)
    csv_create(store.store)
	end
end


# CsvManager.new().run('db/db.csv', ['filter', ['Age','more',10],['Name','equal','Marge']],['sort','Name'])