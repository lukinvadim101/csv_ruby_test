require 'csv_manager'

RSpec.describe 'CSV Manager' do 
  it 'final file exist' do
    CsvManager.new().run('db/db.csv', ['Age','more',10],'Name')
    expect(File).to exist('db/done.csv')
  end
end