from read_file import get_lines_from_file
from bit_math import *

lines = get_lines_from_file("inputs.txt")
lineCount = len(lines)
numberInputs = list(map(lambda line: int(line, 2), lines))

bit_counts = count_ones_in_positions(numberInputs, 12)
threshold = lineCount / 2

gamma_rate = get_gamma_rate(threshold, bit_counts)

#Python doesn't have unsigned integers for some insane reason
#so compensate by binary AND with max value for this bit length
epsilon_rate = get_epsilon_rate(gamma_rate, 0b111111111111)
print("counts output|", bit_counts)
print("Gamma binary|", "{0:b}".format(gamma_rate))
print("Gamma rate  |", gamma_rate)
print("Epislon rate|", epsilon_rate)

multiplied = gamma_rate * epsilon_rate
print("multiplied", multiplied)