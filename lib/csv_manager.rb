# frozen_string_literal: true

require 'csv'
require_relative 'csv_manager/file'
require_relative 'csv_manager/sort'
require_relative 'csv_manager/filter'
require_relative 'csv_manager/store'

class CsvManager
  def csv_create(csv)
    File.write('db/done.csv', csv.to_csv)
  end

  def run(path:nil, filter: nil, sort: nil)
    raise("The path to the file is required!") if path.nil? 
    store_obj = Store.new(CsvFile.new(path).csv)

    filter&.each { |param| store_obj.filter(param) }
    store_obj.sort(sort) if sort
    csv_create(store_obj.store)
  end

end

# CsvManager.new().run(path: 'db/db.csv', filter:[['Age','more',10]], sort: ['Id', 'reverse'])
# CsvManager.new().run(path: 'db/db.csv', filter:[['Age','more',10]], sort: ['Id'])
# CsvManager.new().run(path: 'db/db.csv', filter:[['Age','more',10],['Name','equal','Marge']])
# CsvManager.new.run(path: 'db/db.csv', sort: 'Id')
# CsvManager.new.run
