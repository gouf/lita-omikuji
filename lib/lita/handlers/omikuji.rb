require 'faraday'
module Lita
  module Handlers
    class Omikuji < Handler
      route(/omikuji/i, :omikuji)

      def omikuji(response)
        omikuji_list = %w(
          大吉 吉 中吉 小吉
          半吉 末吉 末小吉
          平凶 小凶 半凶
          末凶 凶 大凶
        ).freeze
        response.reply(omikuji_list.sample)
      end
    end

    Lita.register_handler(Omikuji)
  end
end
