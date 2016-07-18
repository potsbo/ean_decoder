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

  it 'should respond to both 7 digits manufacturer codes' do
    base = '1234567890123'
    rest = base[3...13]
    manu_rest = base[3...7]
    (('450'..'455').to_a + ('490'..'499').to_a).each do |code|
      expect((code + rest).manufacturer_code).to eq(code + manu_rest)
    end
  end

  it 'should respond to both 9 digits manufacturer codes' do
    base = '1234567890123'
    rest = base[3...13]
    manu_rest = base[3...9]
    ('456'..'459').to_a.each do |code|
      expect((code + rest).manufacturer_code).to eq(code + manu_rest)
    end
  end
end
