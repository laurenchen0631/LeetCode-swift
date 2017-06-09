def is_palindrome(x):
    """
    :type x: int
    :rtype: bool
    """
    if x < 0 or (x != 0 and x % 10 == 0):
        return False
    reversed_half = 0
    while x > reversed_half:
        reversed_half = reversed_half * 10 + x % 10
        x //= 10

    if x == 0:
        return False
    return ((reversed_half == x) or (reversed_half//10 == x))


print(is_palindrome(12321))
print(is_palindrome(2))
print(is_palindrome(1221))
