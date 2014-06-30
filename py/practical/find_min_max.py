def find_min_max(values):
    """(list) -> (min, max)

    Print the minimum and maximum value from values.

    """

    min = None
    max = None
    for value in values:
        if max is None or value > max:
            max = value
        if min is None or value < min:
            min = value

    return min, max
    # print('The minimum value is {0}'.format(min))
    # print('The maximum value is {0}'.format(max))

if __name__ == '__main__':
    print(find_min_max([3, 13, -50]))
