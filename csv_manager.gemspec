Gem::Specification.new do |s|
    s.name = 'csv_manager'
    s.version = '0.2.0'
    s.licenses = ['MIT']
    s.summary = 'csv test project'
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
        'spec/lib/csv_manager/csv_file_spec.rb',
        'spec/lib/csv_manager/csv_filter_spec.rb',
        'spec/lib/csv_manager/csv_sort_spec.rb',
    ]
    s.add_dependency 'csv'
end