import unittest
import find_min_max as fmm

class TestFindMinMax(unittest.TestCase):
    """Tests for find_min_max"""


    def test_empty(self):
        """Test an empty list"""
        argument = []
        expected = []
        fmm.find_min_max(argument)
        self.assertEqual(expected, argument,
                         "The list is empty.")

    def test_single(self):
        """Test a singular list"""
        argument = [4]
        expected =[4]
        fmm.find_min_max(argument)
        self.assertEqual(expected, argument,
                         "The list has a single value.")

    def test_triple_ascending(self):
        """Test the example given in problem"""
        argument = fmm.find_min_max([-5, 0, 3, 12])
        expected = -5, 12

        self.assertEqual(expected, argument,
                         "This test is a given.")

    # def test_identical(self):
    #     """Test a list with multiple identical values"""
    #     argument = [1, 1, 1]
    #     expected = [0, 2, 2]
    #     fmm .find_min_max(argument)
    #     self.assertEqual(expected, argument,
    #                      "The list has multiple identical values.")

unittest.main()
