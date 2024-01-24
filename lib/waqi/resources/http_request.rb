module Waqi
    class Resource
        module HttpRequest
            def get(url, params: {}, headers: {})
                begin
                    response = @connection.get(default_url(url), params, headers)
                rescue Faraday::Error => e
                    e.response[:status]
                    e.response[:body]
                end

                response.body
            end

            def default_url(url)
                url+"?token=#{@api_key}"
            end
        end
    end
end