def get_lines_from_file(filename):
  lines = []
  with open(filename, 'r') as f:
    lines = f.readlines()

  return lines