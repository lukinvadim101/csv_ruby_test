# frozen_string_literal: true

RSpec.describe 'CSV Sort' do
  let(:store) { Store.new(CsvFile.new('db/db.csv').csv) }

  it 'csv sort by id works' do
    csv = Sort.new(store).execute('Id')
    expect(csv.first[0]).to eq('1')
  end

  it 'reverse sort by name works' do
    csv = Sort.new(store).execute(['Name', 'reverse'])
    expect(csv.first[1]).to eq('Marge')
  end
end
