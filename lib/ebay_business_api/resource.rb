# frozen_string_literal: true

module EbayBusinessApi
  class Resource < LedgerSync::Resource
    def serialize
      result = {}
      to_h.each_key do |key|
        if to_h[key].is_a?(Array)
          result[key] = to_h[key].map do |v|
            v.try(:serialize) || v
          end
        else
          result[key] = to_h[key].try(:to_h) || to_h[key]
        end
      end
      result
    end
  end
end
