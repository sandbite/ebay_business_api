module EbayBusinessApi
  class Image
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :image_url, hash_attribute: :imageUrl
      attribute :width, hash_attribute: :width
      attribute :height, hash_attribute: :height
    end
  end
end
