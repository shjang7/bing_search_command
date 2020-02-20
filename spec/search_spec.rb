require './lib/search.rb';

describe Search do
  let(:test_term) { 'ceramic' }
  let(:new_search) { Search.new(test_term) }
  let(:hash_keys) { new_search.get_data.keys }

  context '#initialize' do
    it { expect(new_search.search_term).to eql(test_term) }
  end

  context '#get_data' do
    it { expect(hash_keys).to include('objects') }
    it { expect(hash_keys).to include('total') }
    it { expect(hash_keys).to include('page') }
    it { expect(hash_keys).to include('per_page') }
    it { expect(hash_keys).to include('pages') }
    it { expect(hash_keys).to include('stat') }
    it { expect(hash_keys).to include('event_publishing_state') }
  end
end
