module Statium
  module Opta
    module Resource
      class CommonResource
        def common_url_options(lang = 'en')
          common_url_options = {
            _fmt: 'json',
            _lcl: lang
          }
          common_url_options
        end

        def build_uri(resource_name, auth_key, path_suffix, query_options)
          uri = URI::HTTPS.build(
          host: 'api.performfeeds.com',
          path: "/soccerdata/#{resource_name}/#{auth_key}#{path_suffix}"
          )
          uri.query = URI.encode_www_form(query_options)
          uri
        end
      end
    end
  end
end
