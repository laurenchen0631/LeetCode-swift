def titleToNumber(s):
    number = 0
    for index in range(len(s)):
        number += (26 ** index) * (ord(s[len(s) - 1 - index]) - 64)
    return number

print(titleToNumber('A'))
print(titleToNumber('BB'))
print(titleToNumber('AB'))
