#Practica 8 LPP
#Sergio Oramas y Yeray Hernández#

class Matriz

  attr_reader :fil, :col, :matriz
    
  def initialize(fil, col, matriz) #Metodo que inicializa la clase
    @fil = fil
    @col = col
    @matriz = Array.new(matriz)
  end
      
  def filas #Metodo para obtener las filas
    @fil
  end
        
  def colum # Metodo para obtener las columnas
    @col
  end
        
  def to_s # Metodo que convierte la matriz en un string
    temp = ""
    @fil.times do |i|
      @col.times do |j|
        temp << "#{matriz[i][j]} "
      end
      temp << "\n"
    end
    temp
  end

  def +(other) # Metodo que suma 2 matrices
    raise ArgumentError, 'Las matrices no tienen el mismo tamano, no se pueden sumar' unless ((@fil == other.fil) || (@col == other.col))
    mat = Array.new(0)
      for i in 0...filas do
        fila = Array.new(0)
        for j in 0...colum do
          fila << matriz[i][j] + other.matriz[i][j]
        end
        mat << fila
      end
    Matriz.new(@fil, @col, mat)
  end

  def -(other) # Metodo que resta 2 matrices
    raise ArgumentError, 'Las matrices no tienen el mismo tamano, no se pueden restar' unless ((@fil == other.fil) || (@col == other.col))  
    mat = Array.new(0)
    for i in 0...filas do
      fila = Array.new(0)
      for j in 0...colum do
        fila << matriz[i][j] - other.matriz[i][j]
      end
       mat << fila
    end
    Matriz.new(@fil, @col, mat)
  end

  def *(other) # Metodo que multiplica 2 matrice
    raise ArgumentError, 'Las matrices no se pueden multplicar' unless ((@fil == other.col) || (@col == other.fil))  
    mat = Array.new(0)
    for i in 0...fil do
      fila = Array.new(0)
      for j in 0...other.col do
        aux = 0
        for k in 0...col do
          aux += matriz[i][k] * other.matriz[k][j]
        end
        fila << aux
      end
      mat << fila
    end
    Matriz.new(@fil, other.col, mat)
  end

  def mult (other) # Metodo para multiplicar una matriz por un numero
    mat = Array.new(0)
    for i in 0...filas do
      fila = Array.new(0)
      for j in 0...colum do
        fila << matriz[i][j] * other
      end
      mat << fila
    end
    Matriz.new(@fil, @col, mat)
  end
end
