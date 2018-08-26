def sum_to(n)
  return nil if n < 0
  return 0 if n == 0

  n + sum_to(n - 1)
end

def add_numbers(arr)
  return 0 if arr.empty?
  arr.pop + add_numbers(arr)
end

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1

  (num - 1) * gamma_fnc(num - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors[0] == favorite

  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
  return "" if string.empty?
  string[-1] + reverse(string[0..-2])
end
