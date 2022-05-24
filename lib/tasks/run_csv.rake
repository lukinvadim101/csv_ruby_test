require 'csv_manager'

desc 'CSV Manager test'
  task :csv, [:path] => :environment do |task, args|
    store = CsvFile.new(args[:path]).csv

    case args.extras.size
    when 4
      (a,b,c,d) =  args.extras
      CsvManager.new(store).run(a,b,c,d)
    when 7
      (a,b,c,d,e,f,g) =  args.extras
      CsvManager.new(store).run(a,b,c,d,e,f,g)
    else
      puts "wrong number of arguments"
    end
end

# rake csv[data/db.csv,Age,more,10,Id]
# rake csv[data/db.csv,Age,more,12,Name,equal,Homer,Id]