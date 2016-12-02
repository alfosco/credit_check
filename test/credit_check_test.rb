require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'

class CreditCheckTest < Minitest::Test

  def test_credit_check_exists
    assert CreditCheck.new("5541808923795240")
  end

  def test_it_splits_card_number
    credit = CreditCheck.new("5541808923795240")
    assert_equal ["5", "5", "4", "1", "8", "0", "8", "9", "2", "3", "7", "9", "5", "2", "4", "0"], credit.split_card_number
  end

  def test_it_converts_string_to_integer
    credit = CreditCheck.new("5541808923795240")
    assert_equal [5, 5, 4, 1, 8, 0, 8, 9, 2, 3, 7, 9, 5, 2, 4, 0], credit.convert_to_integer
  end

  def test_it_doubles_even_indexes
    credit = CreditCheck.new("5541808923795240")
    assert_equal [10, 5, 8, 1, 16, 0, 16, 9, 4, 3, 14, 9, 10, 2, 8, 0], credit.double_even_index
  end

  def test_it_splits_doubles
    credit = CreditCheck.new("5541808923795240")
    assert_equal [1, 0, 5, 8, 1, 1, 6, 0, 1, 6, 9, 4, 3, 1, 4, 9, 1, 0, 2, 8, 0], credit.split_doubles
  end

  def test_it_sums_the_array_items
    credit = CreditCheck.new("5541808923795240")
    assert_equal 70, credit.sum
  end

  def test_credit_card_is_valid
    credit = CreditCheck.new("5541808923795240")
    assert_equal "The number is valid!", credit.valid?
  end

  def test_credit_card_is_invalid
    credit = CreditCheck.new("5541801923795240")
    assert_equal "The number is invalid!", credit.valid?
  end

end
