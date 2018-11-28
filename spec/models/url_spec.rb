describe Url do
	it '#shorten returns shortened url' do
		g = Url.create(url: "http://google.com")
		expect(g.shorten).to eq("http://localhost:9393/#{g.encode_id}")
		g.destroy
	end
end