require 'pry'

class CreditCheck

  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def split_card_number
    @card_number.chars
  end

  def convert_to_integer
    split_card_number.map { |number| number.to_i}
  end

  def double_even_index
    test = convert_to_integer.map.with_index do |item, index|
      if index.even?
        item * 2
       else
         item
      end
    end
  end

  def split_doubles
    numbers = double_even_index.map do |number|
      if number.to_s.length == 2
        number.to_s.scan(/./)
      else
        number.to_s
      end
    end
    .flatten
    numbers.map {|num| num.to_i}
  end

  def sum
    split_doubles.reduce(:+)
  end

  def valid?
    if sum % 10 == 0
      p "The number is valid!"
    else
      p "The number is invalid!"
    end
  end

end

#Valid Credit Card
credit_good = CreditCheck.new("5541808923795240")
credit_good.valid?

#Invalid Credit Card
#credit_bad = CreditCheck.new("5541801923795240")
#credit_bad.valid?



