"""Validate that a given square is valid.

Checks that this is either a simple square (``0`` or ``1``), or
a split square (a list of 4 items, each being a simple square or
a split square).

A simple square is valid::

    >>> validate(0)
    True

A split square of four simple filled squares is valid::

    >>> validate([1, 1, 1, 1])
    True

We can nest split and simple squares::

    >>> validate([1, 0, [1, [0, 0, 0, 0], 1, [1, 1, 1, 1]], 1])
    True

    >>> validate([1, [1, 0, 1, [0, [0, 0, 0, 0], 1, 1]], [1, 0, 1, 0], 1])
    True

Simple squares must be either 0 (empty) or 1 (filled)::

    >>> validate(2)
    False

Split squares must contain exactly four parts::

    >>> validate([1, 1, 1, 1, 1])
    False

    >>> validate([1, 0, [1, [0, 0, 0, 0, 1], 1, [1, 1, 1, 1]], 1])
    False

    >>> validate([1, [1, 0, 1, [0, [0, 0, 0], 1, 1]], [1, 0, 1, 0], 1])
    False

"""


def validate(s):
    """Validate that a given square is valid.."""
    if isinstance(s, int):
        if s == 0 or s == 1:
            return True
        else:
            return False
    elif isinstance(s, list):
        valid = len(s) == 4
        for each in s:
            valid = valid and validate(each)
        return valid












    # if isinstance(s, int):
    #     if s in [0, 1]:
    #         return True
    #     else:
    #         return False
    # elif isinstance(s, list):
    #     valid = len(s) == 4
    #     for each in s:
    #         valid = valid and validate(each)
    #     return valid
    

# if __name__ == "__main__":
#     import doctest
#     if doctest.testmod().failed == 0:
#         print "\n*** ALL TESTS PASS; THAT'S SUPER-VALID WORK!\n"