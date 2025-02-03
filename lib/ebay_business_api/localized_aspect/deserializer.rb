# frozen_string_literal: true

module EbayBusinessApi
  class LocalizedAspect
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :type, hash_attribute: :type
      attribute :name, hash_attribute: :name
      attribute :value, hash_attribute: :value
    end
  end
end
