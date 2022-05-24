require 'csv_manager'

desc 'CSV Manager test'
  task :csv, [:path,:filter,:sort] => :environment do |task, args|
    store = Store.new(args[:path]).store

    CsvManager.new(store).run(args[:filter],args[:sort])
end

# rake csv[data/db.csv,Age,more,10,Id]
# rake csv[data/db.csv,Age,more,12,Name,equal,Homer,Id]

# rake csv['db/db.csv', ['filter', ['Age','more',10],['Name','equal','Marge']],['sort','Name']]