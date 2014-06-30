import unittest

def average(values):
    """(list of numbers) -> number

    Return the average of the numbers in values.  Some items in values
    are None, and they ar not counted toward the average.

    >>> average([20,30])
    25.0
    >>> average([None, 20, 30])

    """

    count = 0 # The number of values seen so far.
    total = 0 # The sum of the values seen so far.
    for value in values:
        if value is not None:
            total += value
            count += 1

    if count == 0:
        return None
    else:
        return total / count

class TestAverage(unittest.TestCase):
    """Tests for average."""

    def test_empty(self):
        """Test an empty list."""
        argument = average([])
        expected = None
        self.assertEqual(expected, argument, "The list is empty.")

    def test_one_item(self):
        """Test a list with one item."""
        argument = average([5])
        expected = 5
        self.assertEqual(expected, argument, "The list has one item.")

    def test_one_none(self):
        """Test a list with one 'None'."""
        argument = average([None])
        expected = None
        self.assertEqual(expected, argument, "The list has one 'None'.")

    def test_normal(self):
        """Test a list with multiple numbers."""
        argument = average([1, 2, 3])
        expected = 2
        self.assertEqual(expected, argument, "The list has multiple numbers.")

    def test_normal_with_none(self):
        """Test a list with multiple numbers and one 'None'."""
        argument = average([1, 2, 3, None])
        expected = 2
        self.assertEqual(expected, argument, "The list has multiple numbers and one 'None'.")

unittest.main()
