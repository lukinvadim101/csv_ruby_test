RSpec.describe 'CSV Filter' do 
  let(:store) {Store.new(CsvFile.new('db/db.csv').csv)}

  it "filter class works" do 
    filtred = Filter.new(store).execute(['Age','more','30'])
    expect(filtred[0][3].to_i).to be > 30
  end

  it "filtred.lenght != init.length" do 
    init_table_size = store.store
    filtred_table_size =  Filter.new(store).execute(['Id','more','4'])
    expect(init_table_size.length).to be > filtred_table_size.length
  end
end