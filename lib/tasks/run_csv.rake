require 'csv_manager'
require 'optparse'

desc 'CSV Manager'
task :run, [:path,:filter,:sort] do |t, args|
  options = {}
  opts = OptionParser.new

  opts.on("-p", "--path ARG", String) { |path| options[:path] = path }
  opts.on("-f", "--filter ARG", Array) { |filter| options[:filter] = filter}
  opts.on("-s", "--sort ARG", String) { |sort| options[:sort] = sort}
  args = opts.order!(ARGV) {}
  opts.parse!(args)

  if(!options[:filter].nil?)
    options[:filter] = options[:filter].split('AND')
  end

  CsvManager.new().run(
    path: options[:path],
    filter: options[:filter],
    sort: options[:sort]
  )
end


# rake run -- --path db/db.csv --filter Age,more,8,AND,Gender,equal,Male --sort Name
# rake run -- --path db/db.csv --filter Age,less,15
# rake run -- --path db/db.csv --sort Id
