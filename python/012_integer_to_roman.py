
THOUSANDS = ["", "M", "MM", "MMM"]
HUNDREDS = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
TENS = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
SINGLE = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]


def intToRoman(num):
    return (THOUSANDS[num//1000] + HUNDREDS[(num % 1000)//100] +
            TENS[(num % 100)//10] + SINGLE[num % 10])


print(intToRoman(3999))
