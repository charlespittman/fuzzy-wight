class Country:

    def __init__(self, name, population, area):
        """ (Country, str, int, int)

        A new Country named name with population people and area area.

        >>> canada = Country('Canada', 34482779, 9984670)
        >>> canada.name
        'Canada'
        >>> canada.population
        34482779
        >>> canada.area
        9984670
        """

        self.name = name
        self.population = population
        self.area = area

if __name__ == '__main__':
    import doctest
    doctest.testmod()
