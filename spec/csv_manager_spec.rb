require 'csv_manager'

RSpec.describe 'CSV Manager' do 
  it 'final file exist' do
    CsvManager.new().run(path:'db/db.csv', sort:'Id')
    expect(File).to exist('db/done.csv')
  end
end