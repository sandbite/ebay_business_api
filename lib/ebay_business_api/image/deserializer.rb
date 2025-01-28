module EbayBusinessApi
  class Image
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :image_url, hash_attribute: :imageUrl
    end
  end
end
