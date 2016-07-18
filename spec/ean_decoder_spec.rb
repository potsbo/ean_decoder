require 'spec_helper'

describe EanDecoder do
  it 'has a version number' do
    expect(EanDecoder::VERSION).not_to be nil
  end

  it 'should identify Japan' do
    expect('1234567890123'.country).to eq('jp')
  end
end
