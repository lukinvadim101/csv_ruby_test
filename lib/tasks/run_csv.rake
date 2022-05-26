require 'csv_manager'

desc 'CSV Manager test'
  task :csv, [:path,:filter,:sort] => :environment do |task, args|
    CsvManager.new().run(args[:path],args[:filter],args[:sort])
end

# rake csv['db/db.csv', ['filter', ['Age','more',10],['Name','equal','Marge']],['sort','Name']]