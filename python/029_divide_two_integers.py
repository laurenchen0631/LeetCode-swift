INT_MAX = 2**31 - 1
INT_MIN = -2**31


def divid(dividend, divisor):
    is_negative = (dividend < 0) ^ (divisor < 0)
    dividend = abs(dividend)
    divisor = abs(divisor)
    res = 0

    while dividend >= divisor:
        multiples = 1
        dvs = divisor
        while dividend >= dvs:
            dividend -= dvs
            res += multiples
            dvs <<= 1
            multiples <<= 1

    if is_negative:
        res = -res
    return min(max(INT_MIN, res), INT_MAX)


print(divid(100, 3))
