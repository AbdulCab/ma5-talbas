def ten_to_n(number, bas)
  if 2 > bas || bas > 36
    raise "Bas ska vara mellan 2 och 36"
  end

  bas = bas.to_i
  digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  int_del = number.to_i
  frac_del = number - int_del
  result = ""

  # Convert integer part
  if int_del == 0
    result = "0"
  else
    while int_del > 0
      rest = int_del % bas  # FIXED: Now using int_del instead of number
      result = digits[rest] + result
      int_del = int_del / bas
    end
  end

  # Convert fractional part
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

# Test cases
puts ten_to_n(123.9, 7)   # Expected output: "101.11"
puts ten_to_n(10.6875, 16) # Expected output: "A.B"
puts ten_to_n(27.15625, 8) # Expected output: "33.125"
