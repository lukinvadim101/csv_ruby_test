require 'csv_manager'

RSpec.describe 'CSV Sort' do 
  let(:store) {CsvFile.new('data/db.csv').csv}

  it "csv sort" do 
    @csv = Sort.new(store).sort('Id')
    expect(@csv[0][0]).to eq ('1')
    expect(@csv[-1][0]).to eq ('5') 
  end
end