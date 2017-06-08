INT_MAX = 2147483648


def atoi(s):
    if len(s) == 0:
        return 0

    # make string left justified
    s = s.lstrip()

    # takes an optional initial plus or minus sign
    negative = s[0] == "-"
    start = 0
    if s[0] == "-" or s[0] == "+":
        start += 1

    num = 0
    for i in range(start, len(s)):
        if not s[i].isdigit():
            break
        digit = ord(s[i]) - ord("0")
        num = num * 10 + digit

    if negative:
        num = -num

    if num >= INT_MAX:
        return INT_MAX - 1
    elif num < -INT_MAX:
        return -INT_MAX
    return num


print(atoi("32141"))
print(atoi("32ad"))
print(atoi("   32ad"))
print(atoi("   -32ad  dsada"))
print(atoi("+32ad  dsada"))
print(atoi("a32ad  dsada"))
