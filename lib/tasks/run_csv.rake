require 'csv_manager'
require 'optparse'

desc 'Method'
task :run, [:path,:filter,:sort] do |t, args|
  options = {}
  opts = OptionParser.new

  opts.on("-p", "--path ARG", String) { |path| options[:path] = path }
  opts.on("-f", "--filter ARG", Array) { |filter| options[:filter] = filter}
  opts.on("-s", "--sort ARG", String) { |sort| options[:sort] = sort}
  args = opts.order!(ARGV) {}
  opts.parse!(args)

  CsvManager.new().run(options[:path],options[:filter],options[:sort])
end

# rake run -- --path db/db.csv --filter 'Age','more',10,'Name','equal','Marge' --sort Name
