module ArJsonSerialize
  module Serializer
    extend self

    def load(s)
      if s.present?
        result = ::MultiJson.load(s)
        case result
        when ::Hash
          ::Hashie::Mash.new(result)
        when ::Array
          result.map do |item|
            if item.is_a?(::Hash)
              ::Hashie::Mash.new(item)
            else
              item
            end
          end
        else
          result
        end
      else
        ''
      end
    end

    def dump(s)
      ::MultiJson.dump(s)
    end
  end
end