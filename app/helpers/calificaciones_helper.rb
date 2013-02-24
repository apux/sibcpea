module CalificacionesHelper

  def convierte_numero_a_palabras numero
    return if numero.blank?
    numeros = numero.to_s.split('.')

    str = convierte_entero_a_palabras numeros[0].to_i
    if numeros.size > 1
      str += " punto "
      str += convierte_entero_a_palabras numeros[1].to_i
    end

    str
  end

  ######################
  private
  ######################

  def convierte_entero_a_palabras numero
    case numero
    when 0 : "cero"
    when 1 : "uno"
    when 2 : "dos"
    when 3 : "tres"
    when 4 : "cuatro"
    when 5 : "cinco"
    when 6 : "seis"
    when 7 : "siete"
    when 8 : "ocho"
    when 9 : "nueve"
    when 10 : "diez"
    when 11 : "once"
    when 12 : "doce"
    when 13 : "trece"
    when 14 : "catorce"
    when 15 : "quince"
    when 20 : "veinte"
    else
      decena = numero / 10
      unidad = numero % 10
      case decena
      when 1 : "dieci" + convierte_a_palabras(numero % 2)
      when 2 : "veinti" + convierte_a_palabras(numero % 2)
      when 3 : "treinta" + unidad > 0 ? " y " + convierte_a_palabras(numero % 2) : ""
      when 4 : "cuarenta" + unidad > 0 ? " y " + convierte_a_palabras(numero % 2) : ""
      when 5 : "cincuenta" + unidad > 0 ? " y " + convierte_a_palabras(numero % 2) : ""
      when 6 : "sesenta" + unidad > 0 ? " y " + convierte_a_palabras(numero % 2) : ""
      when 7 : "setenta" + unidad > 0 ? " y " + convierte_a_palabras(numero % 2) : ""
      when 8 : "ochenta" + unidad > 0 ? " y " + convierte_a_palabras(numero % 2) : ""
      when 9 : "noventa" + unidad > 0 ? " y " + convierte_a_palabras(numero % 2) : ""
      end
    end
  end


end
