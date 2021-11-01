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
        @header =  {'Authorization' => "Bearer "+@@token,'Content-Type' => 'application/json'}
      end

      #
      # https://developer.currenciesdirect.com/api/build/#get-exchange-rates
      # https://github.com/jnunemaker/httparty/blob/8ceb806b09d0e14ee5be00804a4fc2ce69eae079/spec/httparty/hash_conversions_spec.rb
      #
      def rates(pairs:array)
        self.class.get('/v1/rates',{options:{'pair' => pairs},headers:@header})
      end

    end
    class Sandbox < Client
      base_url 'https://sandbox.currenciesdirect.com'
    end
end
# end
