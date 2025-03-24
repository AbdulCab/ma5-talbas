# Omvandla ett tal från bas 10 till en annan bas (2-36)
def ten_to_n(number, bas)
  if 2 > bas || bas > 36
    raise "Bas ska vara mellan 2 och 36"
  end

  digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  int_del = number.to_i
  frac_del = number - int_del
  result = ""

  # Omvandla heltalsdelen
  if int_del == 0
    result = "0"
  else
    while int_del > 0
      rest = int_del % bas
      result = digits[rest] + result
      int_del = int_del / bas
    end
  end

  # Omvandla bråkdelen om den finns
  if frac_del > 0 
    result += "."
    count = 0
    while frac_del > 0 && count < 10
      frac_del *= bas
      digit = frac_del.to_i
      result += digits[digit]
      frac_del -= digit
      count += 1
    end
  end

  return result
end

# Omvandla ett tal från valfri bas till bas 10
def n_to_ten(number, bas)
  if 2 > bas || bas > 36
    raise "Bas ska vara mellan 2 och 36"
  end

  digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  # Dela upp heltals- och bråkdelsdel
  if number.include?(".") # Se om talet innehåller ett decimaltecken
    int_part, frac_part = number.split(".")
  else
    int_part, frac_part = number, "0"
  end

  # Omvandla heltalsdelen
  int_del = 0
  power = 1
  index = int_part.length - 1
  while index >= 0
    char = int_part[index]
    digit = digits.index(char.upcase)  # .upcase för att se till att det är stor bokstav
    int_del += digit * power
    power *= bas
    index -= 1
  end

  # Omvandla bråkdelsdelen
  frac_del = 0.0
  power = 1.0 / bas
  count = 0
  while count < frac_part.length
    char = frac_part[count]
    digit = digits.index(char.upcase)  
    frac_del += digit * power
    power /= bas
    count += 1
  end

  return int_del + frac_del
end

# Omvandla från en bas till en annan
def n_to_n(number)
  puts "Bestäm ursprungliga talbas"
  from_bas = gets.chomp.to_i
  puts "Bestäm beviljad talbas"
  to_bas = gets.chomp.to_i

  decimal = n_to_ten(number, from_bas)  # Först omvandla till decimal (bas 10)
  result = ten_to_n(decimal, to_bas)    # Sedan omvandla till målbasis
  return result
end


p n_to_n("1011.101")
