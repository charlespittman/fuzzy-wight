def make_list(n):
  i = 0
  numbers = []

  while i < n:
    numbers.append(i)
    i = i + 1

  return numbers

for x in make_list(3):
  print x
