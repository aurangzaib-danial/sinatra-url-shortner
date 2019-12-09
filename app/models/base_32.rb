class Base32

  def self.encode_id(id)
		id.to_s(32)
	end

  def self.decode_id(encoded)
		encoded.to_i(32)
  end
  
end