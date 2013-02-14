# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  matches = 0
  matches += 1 if a == b
  matches += 1 if b == c
  matches
end

p triangle(1,2,3)
p triangle(2,2,3)
p triangle(3,2,3)
p triangle(3,3,3)

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
