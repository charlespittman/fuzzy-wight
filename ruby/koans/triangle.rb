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
  a, b, c = [a, b, c].sort

  [a, b, c].each do |x|
    if x < 0
      raise TriangleError, "Lengths cannot be negative."
    elsif x == 0
      raise TriangleError, "Lengths cannot be zero."
    end
  end

  raise TriangleError, "Sum of two sides must be greater than the third." if a + b <= c

  return case [a,b,c].uniq.count
         when 1; :equilateral
         when 2; :isosceles
         when 3; :scalene
         end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
