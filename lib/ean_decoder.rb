require "ean_decoder/version"

module EanDecoder
  def country
    'jp' if ['45','49'].include? self[0..1]
  end

  def manufacturer_code
    return unless country == 'jp'
    digs = case self[0...3]
             when '456','457','458','459' then 9
             else 7
           end
    self[0...digs]
  end
end

class String
  include EanDecoder
end
