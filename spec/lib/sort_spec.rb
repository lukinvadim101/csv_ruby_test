# frozen_string_literal: true

RSpec.describe 'CSV Sort' do
  let(:store) { Store.new(CsvFile.new('db/db.csv').csv) }


  it 'csv sort works' do
    csv = Sort.new(store).execute('Id')

    expect(csv.first[0]).to eq('1')
    expect(csv[-1][0]).to eq('5')
  end

  it 'sort by name works' do
    csv = Sort.new(store).execute('Name')
    csv_reverse = Sort.new(store).execute('Name').reverse_each

    expect(csv.first[1]).to eq('Bart')
    expect(csv_reverse.first[1]).to eq('Marge')
  end
end
