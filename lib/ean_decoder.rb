require "ean_decoder/version"

module EanDecoder
  def country_2dig_popular(code)
    return 'us/ca' if ('00'..'13').to_a.include? code
    return 'fr'    if ('30'..'37').to_a.include? code
    return 'jp'    if ['45','49'].include? code
    return 'it'    if ('80'..'83').to_a.include? code
    return 'at'    if ('90'..'91').to_a.include? code
  end

  def country_3dig_popular(code)
    return 'de' if ('400'..'440').to_a.include? code
    return 'ru' if ('460'..'469').to_a.include? code
    return 'cn' if ('690'..'695').to_a.include? code
    return 'br' if ('789'..'790').to_a.include? code
  end

  def country_2dig_normal(code)
    countries = {
        '50' => 'gb', '54' => 'be/lu', '57' => 'dk', '64' => 'fi',
        '70' => 'no', '73' => 'se', '76' => 'ch', '84' => 'es',
        '87' => 'nl', '93' => 'au', '94' => 'nz',
    }
    countries[code]
  end

  def country_3dig_normal(code)
    countries = {
        '380'	=> 'bg', '383'	=> 'si', '385'	=> 'hr', '387'	=> 'ba',
        '471'	=> 'tw', '474'	=> 'ee', '475'	=> 'lv', '476'	=> 'az',
        '477'	=> 'lt', '478'	=> 'uz', '479'	=> 'lk', '480'	=> 'ph',
        '481'	=> 'by', '482'	=> 'ua', '484'	=> 'md', '485'	=> 'am',
        '486'	=> 'ge', '487'	=> 'kz', '489'	=> 'hk', '520'	=> 'gr',
        '528'	=> 'lb', '529'	=> 'cy', '531'	=> 'mk', '535'	=> 'mt',
        '539'	=> 'ie', '560'	=> 'pt', '569'	=> 'is', '590'	=> 'pl',
        '594'	=> 'ro', '599'	=> 'hu', '608'	=> 'bh 048', '609'	=> 'mu',
        '611'	=> 'ma', '613'	=> 'dz', '616'	=> 'ke', '619'	=> 'tn',
        '621'	=> 'sy', '622'	=> 'eg', '624'	=> 'ly', '625'	=> 'jo',
        '626'	=> 'ir', '627'	=> 'kw', '628'	=> 'sa', '629'	=> 'ae',
        '729'	=> 'il', '740'	=> 'gt', '741'	=> 'sv', '742'	=> 'hn',
        '743'	=> 'ni', '744'	=> 'cr', '745'	=> 'pa', '746'	=> 'do',
        '750'	=> 'mx', '759'	=> 've', '770'	=> 'co', '773'	=> 'uy',
        '775'	=> 'pe', '777'	=> 'bo', '779'	=> 'ar', '780'	=> 'cl',
        '784'	=> 'py', '786'	=> 'ec', '850'	=> 'cu', '858'	=> 'sk',
        '859'	=> 'cz', '860'	=> 'yu', '867'	=> 'kp', '869'	=> 'tr',
        '880'	=> 'kr', '885'	=> 'th', '888'	=> 'sg', '890'	=> 'in',
        '893'	=> 'vn', '899'	=> 'id', '955'	=> 'my', '958'	=> 'mo',
    }
    countries[code]
  end

  def country
    first_two   = self[0..1]
    first_three = self[0..2]
    country_2dig_popular(first_two) || country_3dig_popular(first_three) || country_2dig_normal(first_two) || country_3dig_normal(first_three)
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
