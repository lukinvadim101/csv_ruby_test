RSpec.describe 'CSV File' do 
  it 'upload is a csv' do
    expect(File.extname("db/db.csv")).to eq ('.csv')
  end
end