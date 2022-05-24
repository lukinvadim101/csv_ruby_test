require 'csv_manager'

RSpec.describe 'CSV Manager' do 
  let(:store) {CsvFile.new('data/db.csv').csv}
  let(:manager){CsvManager.new(store)}

  it "store type at the begining is a csv table" do 
    expect(manager.csv.class).to eq (CSV::Table) 
  end

  it 'final file exist' do
    CsvManager.new(store).run('Age','more','10','Age','equal','30','Id')
    expect(File).to exist('data/done.csv')
  end
end