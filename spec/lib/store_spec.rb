RSpec.describe 'CSV Store' do 
  let(:db) {CsvFile.new('db/db.csv').csv}
  let(:store){Store.new(db)}

  it "store type at the begining is a csv table" do 
    expect(store.store.class).to eq (CSV::Table) 
  end
end