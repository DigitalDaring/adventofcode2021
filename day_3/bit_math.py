import math
from models import *

def generate_bit_position_values(bit_count):
  bitValues = []
  i = bit_count - 1
  while i >= 0:
    bitValues.append(math.pow(2, i))
    i-=1
  return bitValues

def count_ones_in_positions(numbers, bit_count):
  bitValues = generate_bit_position_values(bit_count)

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

def filter_by_leftmost_bit(numbers_list, bit_to_filter_by, bit_count):
  filtered = filter(lambda suspect: "{0:b}".format(suspect.clipped).zfill(bit_count)[0] == bit_to_filter_by, numbers_list)
  return list(filtered)

def chop_off(suspect_to_chop, amount):
  new_chopped = suspect_to_chop.clipped - amount
  if new_chopped < 0:
    new_chopped = suspect_to_chop.clipped
  return FilteredLine(suspect_to_chop.original, new_chopped)

def chop_list(suspects_list, amount_to_chop):
  result = list(map(lambda suspect: chop_off(suspect, amount_to_chop), suspects_list))
  return result
  