#require './lib/prct09/Matriz.rb'

class VectorDispersa 

  attr_reader :vector

  def initialize(h = {})  
    @vector = Hash.new(0)
    @vector = @vector.merge!(h)
  end

  def [](i)
    @vector[i]
  end 

  def to_s
    @vector.to_s
  end
end  

class MatrizDispersa 

  def initialize(h = {})
    @matriz = Hash.new
    for k in h.keys do
      @matriz[k] = if h[k].is_a? VectorDispersa
                     h[k]
                   else
                     @matriz[k] = VectorDispersa.new(h[k])
                   end
    end
  end

  def [](i)
    @matriz[i]
  end

  def col(j)
    c={}
    for r in @matriz.keys do
      c[r] = @matriz[r].vector[j] if @matriz[r].vector.keys.include? j
    end
    VectorDispersa.new c
  end
end

