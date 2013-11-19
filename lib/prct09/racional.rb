class Fraccion
  include Comparable  
  attr_accessor  :numerador, :denominador
    
  def initialize(numerador, denominador)
   @numerador, @denominador = numerador, denominador
  end
 
  def to_s #muestra la fraccion
  "#{@numerador}/#{@denominador}"
  end

  def to_f  #convierte la fraccion en numero de punto flotante
   @numerador.to_f / @denominador.to_f
  end

  def reducir(numerador, denominador)  # Devuelve el maximo comun divisor
    x = numerador.abs
    y = denominador.abs
    min = 1
    z = 1
    while (z <= x) and (z <= y) do
      if ((x % z) == 0) and ((y % z) == 0) then
        min = z
      end
      z += 1
    end
    return min
  end

  def simplificar   # Simplifica la fraccion a su minima expresion
    a = @numerador/reducir(@numerador, @denominador)
    b = @denominador/reducir(@numerador, @denominador)
    @numerador, @denominador = a, b
    return self
  end
  
  def abs # Realiza el valor absoluto del operador que se le pase fracción
    x = @numerador.abs
    y = @denominador.abs
    return Fraccion.new(x,y).to_s
  end

  def reciproco # Devuelve la fracción recíproca
    x= @denominador
    y= @numerador
    return Fraccion.new(x,y).to_s
  end

  def == (frac) #Devuelve true si las fracciones son iguales, y false si no
    if @numerador == frac.numerador and @denominador == frac.denominador
      return true
    else
      return false
    end
  end

  def -@ #Devuelve la fracción opuesta 
    if (@numerador < 0 and @denominador > 0) then
      x = @numerador *(-1)
      y = @denominador
    end
    
    if (@denominador < 0 and @numerador > 0) then
      x = @numerador 
      y = @denominador *(-1)  
    end
     
    if (@numerador > 0 and @denominador > 0 ) or (@numerador < 0 and @denominador < 0)then
      x = @numerador *(-1)
      y = @denominador *(-1)
    end
    return Fraccion.new(x,y)
  end

  def + (frac) #Devuelve la suma de las fracciones
    if (@denominador == frac.denominador) # Si denominadores iguales sumamos numeradores y mismo denominador
      x = @numerador += frac.numerador
      y = @denominador
    else
      y = @denominador * frac.denominador
      x = ((y/@denominador) * @numerador) + ((y/frac.denominador) * frac.numerador)
    end
    return Fraccion.new(x,y).simplificar
  end

  def - (frac) #Devuelve la resta de las fracciones
    if (@denominador == frac.denominador) #Si denominadores iguales los restamos y denominador dejamos igual
      x = @numerador -= frac.numerador
      y = @denominador
    else
      y = @denominador * frac.denominador
      x = ((y/@denominador) * @numerador) - ((y/frac.denominador) * frac.numerador)
    end
    return Fraccion.new(x,y).simplificar
  end

  def *(frac) #Devuelve la multiplicacion de las fraciones
    numerador = @numerador * frac.numerador
    denominador = @denominador * frac.denominador
    return Fraccion.new(numerador,denominador).simplificar
  end

  def /(frac) #Devuelve la división de las fracciones
    numerador = @numerador * frac.denominador
    denominador = @denominador * frac.numerador
    return Fraccion.new(numerador, denominador).simplificar
  end
=begin
  def < (frac) #Si la fraccion es menor que la otra, devuelve true, sino false
    if self.to_f < frac.to_f
      return true
    else
      return false
    end
  end

  def > (frac) #Si la fraccion es mayor que la otra devuelve true, sino false
    if self.to_f > frac.to_f
      return true
    else
      return false
    end
  end

  def <= (frac) #Si la fraccion es menor o igual a la otra devuelve true, sino false
    if (self.to_f) <= (frac.to_f) then
      true
    else
      false
    end	
  end
 
  def >= (frac) #Si la fraccion es mayor o igual que la otra, devuelve true, sino false
    if (self.to_f) >= (frac.to_f) then
      true
    else
      false
    end
  end 
=end
  #Comparacion
  def <=>(frac)
    @numerador/@denominador <=> frac.numerador/frac.denominador
  end  
 
  
end
  
