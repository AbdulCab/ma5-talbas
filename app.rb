def ten_to_n(number, bas)
  if bas.to_f != bas.to_i
    raise "Bas ska vara heltal"
  end

  if 2 > bas || bas > 36
    raise "Bas ska vara mellan 2 och 36"
  end

  bas = bas.to_i
  number = number.to_i

  digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  result = ""

  while number > 0
    rest = number % bas
    result = digits[rest] + result
    number = number / bas
end
  return result
end

#p ten_to_n(123, 7)

def n_to_ten(number, bas)
  digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  
  dec = 0
  power = 1

  index = number.length - 1
  while index >= 0
    char = number[index]
    if char >= digits[bas]
      raise "inga tecken i talet får vara större än basen"
    end

    digit = nil
    i = 0
    while i < bas
      if digits[i] == char
        digit = i
        break
      end
      i += 1
    end

    dec += digit * power
    power *= bas
    index -= 1
  end
  return dec
end

#p n_to_ten("1011", 2)

def n_to_n(number, from_bas, to_bas)
  decimal = n_to_ten(number, from_bas)
  result = ten_to_n(decimal, to_bas)
  return result
end

p n_to_n("A543451", 12, 7)