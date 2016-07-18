require "ean_decoder/version"

module EanDecoder
  def country
    'jp'
  end
end

class String
  include EanDecoder
end
