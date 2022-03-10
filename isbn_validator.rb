require 'rspec/expectations'
extend RSpec::Matchers

class Validation

  def initialize(isbn13)
    @isbn13 = isbn13

    raise StandardError.new "Invalid input, length must be 12 or 13 characters long" unless @isbn13.match(/^[0-9]{12,13}$/)
    
    if @isbn13.length == 13
      @isbn13 = @isbn13.chop
    end
  end
  
  def complete_isbn
     
    # Take each digit, from left to right and multiply them alternatively by 1 and 3
    @sum = 0
    @isbn13.each_char.with_index do |num, idx|
      if ((idx) % 2 == 0)
        @sum = @sum + num.to_i
      else
        @sum = @sum + (num.to_i)*3
      end
    end

    #Take mod 10 of the summed figure
    mod = @sum%10
    
    #Subtract 10 and if the end number is 10, make it 0
    final_number = 10 - mod

    if final_number == 10
      return @isbn13 + "0"
    else
      return @isbn13 + final_number.to_s
    end
  end 
end
