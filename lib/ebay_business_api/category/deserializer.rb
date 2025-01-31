module EbayBusinessApi
  class Category
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :category_id, hash_attribute: :categoryId
      attribute :category_name, hash_attribute: :categoryName
    end
  end
end
