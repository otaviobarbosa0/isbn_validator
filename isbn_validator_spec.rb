require 'spec_helper'
require 'isbn_validator'

RSpec.describe Validation do 
  describe '.complete_isbn' do
     
    it 'validate the isbn number' do 
      expect(Validation.new('978014300723').complete_isbn).to eq('9780143007234')
    end
    
    it 'validate the isbn number' do 
      expect(Validation.new('978853806647').complete_isbn()).to eq('9788538066477')
    end

    it 'raise error when receive nil instead a string' do 
      expect{Validation.new(nil)}.to raise_error(StandardError)
    end

    it 'raise error when receive letters on the string' do 
      expect{Validation.new('aaaaaaaaaaaa')}.to raise_error(StandardError)
    end

    it 'raise error when receive not only numbers on the string' do 
      expect{Validation.new('-978853803079')}.to raise_error(StandardError)
    end

    it 'raise error when receive special characters on the string' do 
      expect{Validation.new('+())/(!:?;')}.to raise_error(StandardError)
    end

    it 'raise error when receive the wrong amount of numbers on the string' do 
      expect{Validation.new('777777777777777')}.to raise_error(StandardError)
    end

    it 'raise error when receive interger instead of a string' do 
      expect{Validation.new(978014300723)}.to raise_error(StandardError)
    end
  end
end