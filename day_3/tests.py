import unittest
from bit_math import *
from read_file import get_lines_from_file

class Tests(unittest.TestCase):

  def setUp(self):
    lines = get_lines_from_file('test_inputs.txt')
    self.numberInputs = list(map(lambda line: int(line, 2), lines))

  def test_numbers_load(self):
    self.assertEqual(self.numberInputs[0], 4)

  def test_count_1s(self):
    counts = count_ones_in_positions(self.numberInputs, 5)
    self.assertEqual(counts[0], 7)
    self.assertEqual(counts[1], 5)
    self.assertEqual(counts[2], 8)
    self.assertEqual(counts[3], 7)
    self.assertEqual(counts[4], 5)

  def test_get_gamma_rate(self):
    counts = count_ones_in_positions(self.numberInputs, 5)
    gamma_rate = get_gamma_rate(len(self.numberInputs) / 2, counts)
    self.assertEqual(gamma_rate, 22)

  def test_get_epsilon_rate(self):
    epsilon_rate = get_epsilon_rate(22, 0b11111)
    self.assertEqual(epsilon_rate, 9)

  def test_get_big_epsilon_rate(self):
    epsilon_rate = get_epsilon_rate(2981, 0b111111111111)
    self.assertEqual(epsilon_rate, 1114)