# frozen_string_literal: true
require './lib/search.rb';

describe Search do
  let(:term) { 'ceramic' }
  let(:uri) { "https://www.bing.com/search?q=#{term}" }
  let(:search) { lambda { |type| Search.new(term, type) }}
  let(:all_search) { search['all'] }

  context '#initialize' do
    it { expect(all_search.search_term).to eql(term) }
  end

  context '#uri' do
    it { expect(all_search.uri).to eql(uri) }
  end

  context '#data' do
    it { expect(all_search.data.code).to eq(200) }
    it { expect(all_search.data).to be_kind_of(RestClient::Response) }
  end

  context '#type_of_search' do
    it { expect(search['all'].type_of_search).to eq('') }
    it { expect(search['images'].type_of_search).to eq('images/') }
    it { expect(search['videos'].type_of_search).to eq('videos/') }
  end
end
