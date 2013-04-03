class InvalidInputError < StandardError;end

class RomanNumeral
  def generate(num)
    num = num.to_i
    raise InvalidInputError unless num > 0 and num < 4000
    return symbol_values[num] if symbol_values.has_key?(num)
    roman = ''
    symbol_values.each do |key, value|
      while (num >= key) do
	num -= key
        roman += value
      end
    end
    roman
  end

  private

  def symbol_values
    { 
      1000 => 'M',
      900  => 'CM',
      500  => 'D', 
      400  => 'CD',
      100  => 'C', 
      90   => 'XC',
      50   => 'L', 
      40   => 'XL',
      10   => 'X', 
      9    => 'IX',
      5    => 'V', 
      4    => 'IV',
      1    => 'I' 
    }
  end
end
