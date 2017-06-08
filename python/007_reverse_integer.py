INT_MAX = 2147483648  # INT is 32 bit sigined number


def reverse(self, x):
    """
    :type x: int
    :rtype: int
    """
    reversed_x = 0
    is_negative = x < 0
    x = abs(x)
    while x > 0:
        digit = x % 10
        x //= 10
        reversed_x = reversed_x * 10 + digit

    if reversed_x >= INT_MAX or reversed_x < -INT_MAX:
        return 0

    return -reversed_x if is_negative else reversed_x
