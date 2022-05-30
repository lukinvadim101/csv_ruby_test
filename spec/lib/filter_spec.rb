RSpec.describe 'CSV Filter' do 
  let(:store) {CsvFile.new('db/db.csv').csv}

  it "one param filter works" do 
      filtred = Filter.new(store).filter(['Age','more','30'])
      expect(filtred[0][3].to_i).to be > 30
  end

  it "two param filter works" do 
    filtred1 = Filter.new(store).filter(['Age','more','12'])
    filtred2 = Filter.new(filtred1).filter(['Name','equal','Homer'])
    expect(filtred2[0][1]).to be == 'Homer'
  end

  it "filtred.lenght != init.length" do 
    init_table_size = CSV::Table.new(store, headers: true)
    filtred_table_size =  CSV::Table.new(Filter.new(store).filter(['Id','more','4']), headers: true)
    expect(init_table_size.length).to be > filtred_table_size.length
  end
end