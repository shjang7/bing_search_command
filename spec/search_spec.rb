require File.expand_path('./lib/search.rb')

describe Search do
  let(:test_term) { 'ceramic' }
  let(:new_search) { Search.new(test_term) }

  context 'Input search term' do
    it 'reads a search term variable' do
      expect(new_search.search_term).to eql(test_term)
    end
  end
end
