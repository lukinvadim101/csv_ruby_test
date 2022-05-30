Gem::Specification.new do |s|
    s.name = 'csv_manager'
    s.version = '0.5.0'
    s.licenses = ['MIT']
    s.summary = 'csv project'
    s.authors = ['Vadim Lukin']
    s.files = [
        'LICENSE',
        'README.rdoc',
        'Rakefile',
        'csv_manager.gemspec',
        'lib/csv_manager.rb',
        'lib/csv_manager/filter.rb',
        'lib/csv_manager/sort.rb',
        'lib/csv_manager/file.rb',
        'lib/csv_manager/store.rb',
        'lib/tasks/run_csv.rake',
        'db/db.csv',
        'spec/csv_manager_spec.rb',
        'spec/lib/file_spec.rb',
        'spec/lib/filter_spec.rb',
        'spec/lib/sort_spec.rb',
        'spec/lib/store_spec.rb',
    ]
    s.add_dependency 'csv'
end