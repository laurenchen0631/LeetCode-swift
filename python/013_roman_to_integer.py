ROMAN = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
}

def romanToInt(s):
    sum = 0
    for i in range(len(s) - 1):
        num = ROMAN[s[i]]
        if num < ROMAN[s[i+1]]:
            sum -= num
        else:
            sum += num

    sum += ROMAN[s[-1]]

    return sum

