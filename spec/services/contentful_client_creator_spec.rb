RSpec.describe "Contentful Client Creator" do
  describe 'queries the contentul api' do
    it 'returns error for wrong space' do
      api_call = ContentfulClientCreator.new(space: 'kk2bw5ojx4762', entity_id: '').call
      expect(api_call.data).to eq(nil)
    end
    it 'returns nil for missing entry' do
      api_call = ContentfulClientCreator.new(space: 'kk2bw5ojx476').call
      expect(api_call.data).to eq(nil)
    end
    it 'return error for unexisting entry_id' do
      api_call = ContentfulClientCreator.new(space: 'kk2bw5ojx476', entry_id: '\mA8OgmQsageas').call
      expect(api_call.data).to be(nil)
    end
    it 'returns nil for invalid content_type' do
      api_call = ContentfulClientCreator.new(space: 'kk2bw5ojx476', content_type: 'recipes').call

      expect(api_call.data).to be(nil)
    end
  end

  describe 'ia a success' do
    it 'responds with a valid contentful entity object' do
      api_call = ContentfulClientCreator.new(space: 'kk2bw5ojx476', entry_id: '2E8bc3VcJmA8OgmQsageas').call
      expect(api_call.data).to be_kind_of(Contentful::Entry)
    end
    it 'responds with Array for valid content_type' do
      api_call = ContentfulClientCreator.new(space: 'kk2bw5ojx476', content_type: 'recipe').call
      expect(api_call.data).to be_kind_of(Contentful::Array)
    end

  end

end