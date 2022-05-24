require 'csv_manager'

RSpec.describe 'CSV Filter' do 
  let(:store) {CsvFile.new('data/db.csv').csv}

  it "csv sort" do 
    @csv = Filter.new({
      csv: store,
      field: 'Age', 
      action: 'more',
      condition:'30'}).filter

    expect(@csv[0][3].to_i).to be > 30
  end
end