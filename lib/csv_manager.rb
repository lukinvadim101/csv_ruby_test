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

    while filter_opt.size >= 3
      field, action, condition = filter_opt
      store.filter(field, action, condition)
      filter_opt = filter_opt[3...]
    end

    store.sort(sort_opt)
    
    csv_create(store.store)
	end
end

# CsvManager.new().run('db/db.csv', ['Age','more',10,'Name','equal','Marge'],'Name')