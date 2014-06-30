import unittest
import doublepreceding as dp

class TestDoublePreceding(unittest.TestCase):
    """Tests for double_preceding"""

    def test_example(self):
        """Test the example given in problem"""
        argument = [1, 2, 3]
        expected = [0, 2, 4]
        dp.double_preceding(argument)
        self.assertEqual(expected, argument,
                         "This test is a given.")

    def test_empty(self):
        """Test an empty list"""
        argument = []
        expected = []
        dp.double_preceding(argument)
        self.assertEqual(expected, argument,
                         "The list is empty.")

    def test_single(self):
        """Test a singular list"""
        argument = [4]
        expected = [0]
        dp.double_preceding(argument)
        self.assertEqual(expected, argument,
                         "The list has a single value.")

    def test_identical(self):
        """Test a list with multiple identical values"""
        argument = [1, 1, 1]
        expected = [0, 2, 2]
        dp.double_preceding(argument)
        self.assertEqual(expected, argument,
                         "The list has multiple identical values.")

unittest.main()
