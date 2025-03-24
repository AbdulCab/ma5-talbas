def ten_to_n(number, bas)
  if 2 > bas || bas > 36
    raise "Bas ska vara mellan 2 och 36"
  end

  bas = bas.to_i

  digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  if bas == 10
    return number
  else
    int_del = number.to_i
    frac_del = number - int_del
    result = ""

    if int_del == 0
      result = "0"
    else
      while int_del > 0
        rest = int_del % bas
        result = digits[rest] + result
        int_del = int_del / bas
      end
    end
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
end

p ten_to_n(123.9, 7)

def n_to_ten(number, bas)
  digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  if number.include?(".")
    int_part, frac_part = number.split(".")
  else
    int_part, frac_part = number, "0"
  end
  
  int_res = 0
  power = 1
  index = int_part.length - 1

  frac_res = 0.0
  power = 1.0 / bas
  count = 0

  while count < frac_part.length
    char = frac_part[count]


    digit = digits[char]
    i = 0
    while i < bas
      if digits[i] == char
        digit = i
        break
      end
      i += 1
    end
    frac_res += digit * power
    power /= bas
    count += 1
  end

  return int_res + frac_res
end 



def n_to_n(number)
  puts "Bestäm talets bas"
  from_bas = gets.chomp.to_i
  puts "Bestäm blivande bas"
  to_bas = gets.chomp.to_i
  decimal = n_to_ten(number, from_bas)
  result = ten_to_n(decimal, to_bas)
  return result
end
p n_to_n("Z")