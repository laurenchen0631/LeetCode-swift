def trailing_zeroes(n):
    """
    Given an integer n, return the number of trailing zeroes in n!.
    :type n: int
    :rtype: int
    """
    return 0 if n == 0 else (n // 5) + trailing_zeroes(n // 5)

print(trailing_zeroes(25))
