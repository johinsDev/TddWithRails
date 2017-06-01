require 'minitest/autorun'
require './calculator'

class CalculatorTest < MiniTest::Test

  def setup
    @calculator = Calculator.new 2 , 4
  end

  def test_sum_adds_both_number
    assert_equal 6, @calculator.sum ,"La suma no dio el resultado esperado"
  end

  def test_divide_return_float
    assert_instance_of Float , @calculator.divide, "La division no arroja un decimal"
  end

  def test_divide_return_divide
    assert_equal 0.5, @calculator.divide, "La division no dio el resultado esperado"
  end

  def test_divide_get_if_zero
    assert_raises ZeroDivisionError do
      @calculator.y = 0
      @calculator.divide
    end
  end

  def test_calculator_should_mult
    assert_respond_to @calculator , "multiply"
  end

  def test_multiply_should_work
    skip "No se ha implementado"
  end

end