require 'csv_manager'

RSpec.describe 'CSV Manager' do 
  context'CSV class while operations' do 
    let(:file) {CsvFile.new('data/db.csv').csv}
    let(:manager){CsvManager.new(file)}

     it "upload csv" do 
        expect(manager.csv.class).to eq (CSV::Table) 
     end
     
     it "csv filter" do 
      fill = Filter.new(manager.csv)
      @csv = fill.filter_more_than('Age',"30")
      expect(@csv.class).to eq (CSV::Table) 
     end

     it 'csv sort' do
      sort = Sort.new(manager.csv)
      @csv = sort.csv_sort('Id')
      expect(@csv.class).to eq (CSV::Table) 
     end

     it 'final file exist' do
      manager.run('Age','>','3','Id')
      expect(File).to exist('data/done.csv')
    end

  end 
end