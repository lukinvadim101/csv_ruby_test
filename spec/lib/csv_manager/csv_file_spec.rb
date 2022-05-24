RSpec.describe 'CSV File' do 
  it 'upload is a csv' do
    expect(File.extname("data/db.csv")).to eq ('.csv')
  end
end