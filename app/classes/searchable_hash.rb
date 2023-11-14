class SearchableHash
   
  def initialize(initial_hash)
    @initial_hash = initial_hash
  end

  def find(field)
    @initial_hash[field]
  end 

  def find!(field)
    @initial_hash[field].tap do |value|
      raise "Value Not Found For: #{field}" unless value
    end
  end
end 