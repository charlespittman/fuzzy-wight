class Point
  attr_reader :x, :y  # Define reader methods for our instance variables

  # Initialize our class variables in the class definition itself
  @@n = 0         # How many points have been created
  @@totalX = 0    # The sum of all X coordinates
  @@totalY = 0    # The sum of all Y coordinates

  def initialize(x, y)
    @x, @y = x, y
  end

  def self.new(x,y)   # Class method to create new Point objects
    @n += 1           # Keep track of how many Points have been created
    @totalX += x      # Add these coordinates to the totals
    @totalY += y

    super             # Invoke the real definition of new to create a Point
  end

  # A class method to report the data we collected
  def self.report
    # Here we use the class variables in a class method
    puts "Number of points created: #@@n"
    puts "Average X coordinate: #{@@totalX.to_f/@@n}"
    puts "Average Y coordinate: #{@@totalY.to_f/@@n}"
  end
  ORIGIN = Point.new(0,0)
  UNIT_X = Point.new(1,0)
  UNIT_Y = Point.new(0,1)

  def to_s            # Return a String that represents this point
    "(#@x,#@y)"       # Just interpolate the instance variables into a string
  end

  def +(other)        # Define + to do vector addition
    Point.new(@x + other.x, @y + other.y)
  end

  def -@              # Define unary minus to negate both coordinates
    Point.new(-@x, -@y)
  end

  def *(scalar)       # Define * to perform scalar multiplication
    Point.new(@x*scalar, @y*scalar)
  end

  # If we try passing a Point to the * method of an Integer, it will call
  # this method on the Point and then will try to multiply the elements of
  # the array.  Instead of doing type conversion, we switch the order of
  # the operands, so that we invoke the * method defined above.
  def coerce(other)
    [self, other]
  end

  # Define [] method to allow a Point to look like an array or
  # a hash with keys :x and :y
  def [](index)
    case index
    when 0, -2; @x    # Index 0 (or -2) is the X coordinate
    when 1, -1; @y    # Index 1 (or -1) is the Y coordinate
    when :x, "x"; @x  # Hash keys as symbol or string for X
    when :y, "y"; @y  # Hash keys as symbol or string for Y
    else nil          # Arrays and hashes just return nil on bad indexes
    end
  end

  # This iterator passes the X coordinate to the associated block, and then
  # passes the Y coordinate, and then returns.  It allows us to enumerate
  # a point as if it were an array with two elements.  This each method is
  # required by the Enumerable module.
  def each
    yield @x
    yield @y
  end

  def ==(o)               # Is self == o?
    if o.is_a? Point      # If o is a Point object
      @x==o.x && @y==o.y  # then compare the fields.
    else                  # If o is not a Point
      false               # then, by definition, self != o.
    end
  end

  def eql?(o)
    if o.instance_of? Point
      @x.eql?(o.x) && @y.eql?(o.y)
    else
      false
    end
  end

  def hash
    code = 17
    code = 37*code + @x.hash
    code = 37*code + @y.hash
    # Add lines like this for each significant instance variable
    code  # Return resulting code
  end

  include Comparable  # Mix in methods from the Comparable module.

  # Define an ordering for points based on their distance from the origin.
  # This method is required by the Comparable module.
  def <=>(other)
    return nil unless other.instance_of? Point
    @x**2 + @y**2 <=> other.x**2 + other.y**2
  end

  class << self
    attr_accessor :n, :totalX, :totalY

    def sum(*points)
      x = y = 0
      points.each {|p| x += p.x; y += p.y}
      Point.new(x,y)
    end
  end
end

class Point3D < Point
  def initialize(x,y,z)
    # Pass our first two arguments along to the superclass initialize method
    super(x,y)
    # And deal with the third argument ourself
    @z = z
  end
end

include Enumerable
p = Point.new(1,2)
q = Point.new(p.x*2, p.y*3)
puts p
puts q
puts p.all? {|x| x==0}
