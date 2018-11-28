describe Url do
	it "#id_to_base32 can convert its id to base 32 and set it as the value of id_base32" do
		facebook = Url.create(url: "http://facebook.com")
		base32 = facebook.id.to_s(32)
		facebook.id_to_base32
		expect(facebook.id_base32).to eq(base32)
		facebook.destroy
	end 

	it "#shorten returns a shorten url" do
		google = Url.create(url: "http://google.com")
		base32 = google.id.to_s(32)
		expect(google.shorten).to eq("http://localhost/#{base32}")
		google.destroy
	end
end