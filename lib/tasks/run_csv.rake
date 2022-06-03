# frozen_string_literal: true

require 'csv_manager'
require 'optparse'

desc 'CSV Manager'
task :run, [:path, :filter, :sort] do |_t, args|
  options = {}
  opts = OptionParser.new

  opts.on('-p', '--path ARG', String) { |path| options[:path] = path }
  opts.on('-f', '--filter ARG', Array) { |filter| options[:filter] = filter }
  opts.on('-s', '--sort ARG', Array) { |sort| options[:sort] = sort }
  args = opts.order!(ARGV) {}
  opts.parse!(args)

  options[:filter] = options[:filter].split('AND') unless options[:filter].nil?

  CsvManager.new.run(
    path: options[:path],
    filter: options[:filter],
    sort: options[:sort]
  )
end

# rake run -- --path db/db.csv --filter Age,more,8,AND,Gender,equal,Male --sort Name
# rake run -- --path db/db.csv --filter Age,less,15
# rake run -- --path db/db.csv --sort Id
# rake run -- --path db/db.csv --sort Id, reverse
