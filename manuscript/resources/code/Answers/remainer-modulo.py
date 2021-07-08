#!/usr/bin/env python3

def getRemainder(a, b):
  if (a * b) > 0:
    q = a // b
  else:
    q = (a // b) + 1

  return (a - b * q)


def getModulo(a, b):
  q = a // b
  return (a - b * q)

# expected 7
print(getRemainder(19,-12))

# expected -1
print(getRemainder(-21,4))


# expected -5
print(getModulo(19,-12))

# expected 3
print(getModulo(-21,4))
