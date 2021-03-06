# frozen_string_literal: true

RSpec.describe 'CSV Store' do
  let(:store) { Store.new(CsvFile.new('db/db.csv').csv) }

  it 'store type at the begining is a csv table' do
    expect(store.store.class).to eq(CSV::Table)
  end

  it 'store filter with one param' do
    store.filter(['Age', 'less', 10])
    expect(store.store[0][1]).to eq('Maggie')
  end

  it 'store filter with two params' do
    store.filter(['Age', 'more', 14])
    store.filter(%w[Gender equal Female])
    expect(store.store[0][1]).to eq('Marge')
  end
end
