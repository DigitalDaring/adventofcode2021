import math

def count_ones_in_positions(numbers, bit_count):
  bitValues = []
  i = bit_count - 1
  while i >= 0:
    bitValues.append(math.pow(2, i))
    i-=1

  counts = [0] * bit_count

  for idx, val in enumerate(bitValues):
    for num in numbers:
      counts[idx] += num & int(val) != 0

  return counts

def get_gamma_rate(threshold, bit_counts):
  gamma_string =  "".join(list(map(lambda pos: str(int(pos > threshold)), bit_counts)))
  return int(gamma_string, 2)

def get_epsilon_rate(gamma_rate, bit_accuracy):
  epsilon_rate = ~gamma_rate & bit_accuracy
  return epsilon_rate