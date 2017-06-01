require 'minitest/autorun'
require './bank_account'
require 'factory_girl'

FactoryGirl.find_definitions

class TestBankAccount < MiniTest::Test
  include FactoryGirl::Sintax::Methods
  def setup
    @account =  build(:bank_account)
  end

  def test_bank_account_is_not_nil
    refute_nil @account
  end

  def test_initial_value_for_bank_account
    # Test que podemos asignar a un valor inicial al crear una cuenta de banco
    assert_equal @account.amount , 200
  end

  def test_account_has_a_withdraw_method
    #Prueba que tengamos una forma de retirar de la cuenta
    assert @account .respond_to?(:withdraw)
  end

  def test_account_has_a_deposit_method
    #Prueba que tengamos una forma de depositar de la cuenta
    assert @account .respond_to?(:deposit)
  end

  def test_deposit_add_money_from_account
    # Al llamar la funcion depositar, agrega el dinero de la cuenta de banco
    @account.deposit(100)
    assert_equal @account.amount , 300
  end

  def test_withdraw_removes_money_from_account
    # Al llamar la funcion retirar, se resta el dinero de la cuenta de banco
    @account.withdraw(100)
    assert_equal @account.amount , 100
  end

  def test_when_discount_not_should_be_minor_to_amount
    # Lanzar una execpcion cuando se quiera retirar mas codigo del que hay
    assert_raises ArgumentError do
      @account.withdraw(250)
    end
  end

  def test_can_assign_a_name_to_bank_account
    @account.name = "Mi cuenta de banco"
    assert_equal  @account.name ,  "Mi cuenta de banco"
  end

  def test_name_should_contain_at_least_to_words
    assert_raises ArgumentError do
      @account.name("johinsdevtest")
    end
  end
end