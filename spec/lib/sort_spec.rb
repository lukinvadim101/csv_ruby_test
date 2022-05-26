RSpec.describe 'CSV Sort' do 
  let(:array) {CsvFile.new('db/db.csv').csv}
  it "csv sort works" do 
    @csv = Sort.new(array).sort('Id')
    expect(@csv[0][0]).to eq ('1')
    expect(@csv[-1][0]).to eq ('5') 
  end
end