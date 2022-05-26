RSpec.describe 'CSV Filter' do 
  let(:store) {CsvFile.new('db/db.csv').csv}
  it "csv filter works" do 
      @filtred = Filter.new(store).filter('Age','more','30')
    expect(@filtred[0][3].to_i).to be > 30
  end
end