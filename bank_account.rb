class BankAccount
  attr_accessor :amount, :name

  def initialize
  end

  #Sobreescribimos el accesor name
  def name=(name)
    raise ArgumentError.new('El nombre deberia conteniar al menos dos palabras') unless name =~ /\w+\s+\w+.*$/
    @name = name
  end

  def withdraw amount
    raise ArgumentError.new('Fondos insuficientes') if @amount < amount
    @amount -= amount
  end

  def deposit amount
    @amount += amount
  end
end