def fractionToDecimal(numerator, denominator):
    """
        :type numerator: int
        :type denominator: int
        :rtype: str
    """
    if numerator == 0:
        return '0'
 
    abs_numerator = abs(numerator)
    abs_denominator = abs(denominator)
    intergal = abs_numerator // abs_denominator
    remainder = abs_numerator % abs_denominator
    if remainder == 0:
        return str(int(numerator / denominator))
    res = ['-'] if (numerator < 0) ^ (denominator < 0) else []
    res.append(str(intergal))
    res.append('.')

    """
    for the decimal parts to recur, the remainders should recur.
    So we need to maintain the remainders we have seen
    Once we see a repeated remainder,
    we know that we have reached the end of the recurring parts and should
    enclose it with a )
    """
    remainder *= 10
    record = {}
    while remainder:
        quotient = remainder // abs_denominator
        if remainder in record:
            res.insert(record.get(remainder), '(')
            res.append(')')
            break
        record[remainder] = len(res)
        res.append(str(quotient))
        remainder = (remainder % abs_denominator) * 10

    return ''.join(res)


print(fractionToDecimal(0, 7))
print(fractionToDecimal(1, -7))
print(fractionToDecimal(33, 64))
print(fractionToDecimal(9, 28))
print(fractionToDecimal(-50, 8))
