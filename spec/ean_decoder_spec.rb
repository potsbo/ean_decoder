require 'spec_helper'

describe EanDecoder do
  it 'has a version number' do
    expect(EanDecoder::VERSION).not_to be nil
  end

  it 'should identify Japan' do
    expect('4534567890123'.country).to eq('jp')
    expect('4934567890123'.country).to eq('jp')
    expect('5534567890123'.country).not_to eq('jp')
    expect('5934567890123'.country).not_to eq('jp')
  end

  it 'should identify North America' do
    expect('0034567890123'.country).to eq('us/ca')
    expect('0134567890123'.country).to eq('us/ca')
    expect('0234567890123'.country).to eq('us/ca')
    expect('0334567890123'.country).to eq('us/ca')
    expect('0434567890123'.country).to eq('us/ca')
    expect('0534567890123'.country).to eq('us/ca')
    expect('0634567890123'.country).to eq('us/ca')
    expect('0734567890123'.country).to eq('us/ca')
    expect('0834567890123'.country).to eq('us/ca')
    expect('0934567890123'.country).to eq('us/ca')
    expect('1034567890123'.country).to eq('us/ca')
    expect('1134567890123'.country).to eq('us/ca')
    expect('1234567890123'.country).to eq('us/ca')
    expect('1334567890123'.country).to eq('us/ca')
    expect('1434567890123'.country).not_to eq('us/ca')
    expect('1534567890123'.country).not_to eq('us/ca')
  end

  it 'should identify two digits code country' do
    expect('7034567890123'.country).to eq('no')
  end

  it 'should identify three digits code country' do
    expect('3804567890123'.country).to eq('bg')
  end

  it 'should return nil for non EAN code' do
    base = '1234567890123'
    rest = base[3...13]
    # In-store numbers
    ('200'..'290').to_a.each do |code|
      expect((code + rest).country).to eq(nil)
    end
    # Periodicals (ISSN)
    expect(('977' + rest).country).to eq(nil)
    # Books (ISBN)
    ['978', '979'].each do |code|
      expect((code + rest).country).to eq(nil)
    end
    # Refund receipts
    expect(('980' + rest).country).to eq(nil)
    #	Common currency coupons
    ['981', '982'].each do |code|
      expect((code + rest).country).to eq(nil)
    end
    # Coupons
    ('990'..'999').to_a.each do |code|
      expect((code + rest).country).to eq(nil)
    end
  end

  it 'should respond to both 7 digits manufacturer codes for JAN' do
    base = '1234567890123'
    rest = base[3...13]
    manu_rest = base[3...7]
    (('450'..'455').to_a + ('490'..'499').to_a).each do |code|
      expect((code + rest).manufacturer_code).to eq(code + manu_rest)
    end
  end

  it 'should respond to both 9 digits manufacturer codes for JAN' do
    base = '1234567890123'
    rest = base[3...13]
    manu_rest = base[3...9]
    ('456'..'459').to_a.each do |code|
      expect((code + rest).manufacturer_code).to eq(code + manu_rest)
    end
  end
end
