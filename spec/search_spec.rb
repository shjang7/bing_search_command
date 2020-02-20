require 'rest-client';
require './lib/search.rb';

describe Search do
  let(:base_url) { 'https://www.bing.com/' }
  let(:test_term) { 'ceramic' }
  let(:new_search) { Search.new(test_term) }

  context '#initialize' do
    it { expect(new_search.search_term).to eql(test_term) }
    it { expect(new_search.uri).to eql("#{base_url}search?q=#{test_term}") }
  end

  context '#data' do
    it { expect(new_search.data.code).to eq(200) }
    it { expect(new_search.data).to be_kind_of(RestClient::Response) }
  end
end
