RSpec.describe 'CSV Sort' do 
  let(:store) {Store.new(CsvFile.new('db/db.csv').csv)}

  it "csv sort works" do 
    @csv = Sort.new(store).execute('Id')
    expect(@csv[0][0]).to eq ('1')
    expect(@csv[-1][0]).to eq ('5') 
  end
end