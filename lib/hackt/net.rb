module HackT
  class HackTNet
    require 'net/http'
    require 'json'
    class << self

      def Get(uri, params, prevent_errors = true)
        uri = URI(HackT::URL + uri)
        uri.query = URI.encode_www_form(params)
        response = Net::HTTP.get_response(uri)

        if response.is_a?(Net::HTTPSuccess)
          JSON.parse(response.body)
        else
          raise HackT::HackTError, "Not OK: #{response.inspect}" unless prevent_errors
        end
      rescue
        raise HackT::HackTError, "Not OK: #{response.inspect}" unless prevent_errors
      end

      def Post(uri, params, prevent_errors = true)
        uri = URI(HackT::URL + uri)
        response = Net::HTTP.post_form(uri, params)
        if response.is_a?(Net::HTTPSuccess)
          JSON.parse(response.body)
        else
          raise "Not OK: #{response.inspect}" unless prevent_errors
        end
      rescue
        raise HackT::HackTError, "Not OK: #{response.inspect}" unless prevent_errors
      end

      def Do(http)
        yield HTTP
      end

      def HTTP
        uri = URI(HackT::URL)
        Net::HTTP.start(uri.host, uri.port) do |http|
          http
        end
      end
    end
  end
end