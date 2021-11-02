require "currenciesdirect/currenciesdirect/version"
require 'httparty'

# module Currenciesdirect
module Currenciesdirect
    class Error < StandardError; end
    # Your code goes here...
    class Client
      include 'httparty'
      base_url 'https://api.currenciesdirect.com'

      def initialize(client_id,client_secret,scope)
        @@token = self.class.post('/auth/oauth/v2/token',{options: {'grant_type' => client_credentials,"client_id" => client_id,"client_secret" => client_secret,"scope" => scope}})
        @headers =  {'Authorization' => "Bearer "+@@token, 'Content-Type' => 'application/json'}
      end

      #
      # https://developer.currenciesdirect.com/api/build/#get-exchange-rates
      # https://github.com/jnunemaker/httparty/blob/8ceb806b09d0e14ee5be00804a4fc2ce69eae079/spec/httparty/hash_conversions_spec.rb
      #
      def rates(pairs:array)
        self.class.get('/v1/rates',{options:{'pair' => pairs},headers:@headers})
      end


      # Fixed Side Sell should be true if your selling a set amount of currency
      def quotes(sell_currency,buy_currency,amount ,customerId,fixed_side_sell = true)
        if fixed_side_sell
          fixed_side = 'SELL'
        else
          fixed_side = 'BUY'
        end
        self.class.post("/v1/customers/#{customerId}/quotes",{body:{'sell_currency' => sell_currency,'buy_currency' => buy_currency,'amount' => amount,'fixed_side' => fixed_side},headers:@headers.merge({'Accept' => 'application/json'})})
      end
    end
    class Sandbox < Client
      base_url 'https://sandbox.currenciesdirect.com'
    end
end
# end
