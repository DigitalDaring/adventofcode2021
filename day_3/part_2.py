from read_file import get_lines_from_file
from bit_math import *
from models import *

def log_a_suspect(suspect, original_bit_length, bit_length):
  friendly_original = "{0:b}".format(suspect.original).zfill(original_bit_length)
  friendly_clipped = "{0:b}".format(suspect.clipped).zfill(bit_length)
  print(friendly_original, friendly_clipped)


max_bit_count = 12

lines = get_lines_from_file("inputs.txt")
line_count = len(lines)
numberInputs = list(map(lambda line: int(line, 2), lines))
bit_counts = count_ones_in_positions(numberInputs, max_bit_count)
suspects_list = list(map(lambda num: FilteredLine(num, num), numberInputs))
bit_values = generate_bit_position_values(max_bit_count)

idx = 0
while len(suspects_list) > 1:

  threshold = len(suspects_list) / 2
  most_common_bit_here = int(bit_counts[0] >= threshold)
  to_chop_off = int(bit_values[idx])
  chop_bit_count = max_bit_count - idx - 1
  suspects_list = filter_by_leftmost_bit(suspects_list, "{0}".format(most_common_bit_here), max_bit_count - idx)
  suspects_list = chop_list(suspects_list, to_chop_off)
  
  numberInputs = list(map(lambda suspect: suspect.clipped, suspects_list))
  bit_counts = count_ones_in_positions(numberInputs, chop_bit_count)
  idx += 1

oxy_gen_rating = suspects_list[0].original


# It's super lazy to just rerun this with a changed threshold check,
# but honestly I hate python and it's lack of uints and I want this night to end...so here ya go, universe
numberInputs = list(map(lambda line: int(line, 2), lines))
bit_counts = count_ones_in_positions(numberInputs, max_bit_count)
suspects_list = list(map(lambda num: FilteredLine(num, num), numberInputs))
bit_values = generate_bit_position_values(max_bit_count)
idx = 0
while len(suspects_list) > 1:
  threshold = len(suspects_list) / 2
  least_common_bit_here = int(bit_counts[0] < threshold)
  to_chop_off = int(bit_values[idx])
  chop_bit_count = max_bit_count - idx - 1
  suspects_list = filter_by_leftmost_bit(suspects_list, "{0}".format(least_common_bit_here), max_bit_count - idx)
  suspects_list = chop_list(suspects_list, to_chop_off)
  
  numberInputs = list(map(lambda suspect: suspect.clipped, suspects_list))
  bit_counts = count_ones_in_positions(numberInputs, chop_bit_count)

  print("=========")
  for suspect in suspects_list:
    log_a_suspect(suspect, max_bit_count, chop_bit_count)

  idx += 1

carbon_diox_rating = suspects_list[0].original
  
print("O2 Generator Rating:", oxy_gen_rating)  
print("CO2 Generator Rating:", carbon_diox_rating)
print("life support: ", oxy_gen_rating * carbon_diox_rating)
  

