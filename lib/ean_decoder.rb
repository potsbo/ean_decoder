require "ean_decoder/version"

module EanDecoder
  def country
    'jp' if ['45','49'].include? self[0..1]
  end

  def manufacturer_code
    return unless country == 'jp'
    digs = ('456'..'459').to_a.include?(self[0...3]) ? 9 : 7
    self[0...digs]
  end
end

class String
  include EanDecoder
end
