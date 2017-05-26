def is_number(s):
    s = s.strip()
    hasNum = False
    hasPoint = False
    hasNumAfterPoint = False
    hasExponent = False
    hasNumAfterExponent = False

    for (index, x) in enumerate(s):
        if ord("0") <= ord(x) <= ord("9"):
            if hasExponent:
                hasNumAfterExponent = True
            elif hasPoint:
                hasNumAfterPoint = True
            else:
                hasNum = True

        elif x.lower() == "e":
            if hasExponent:
                return False
            elif not hasNum and not hasNumAfterPoint:
                return False
            hasExponent = True

        elif x == ".":
            if hasPoint or hasExponent:
                return False
            hasPoint = True

        elif x == "+" or x == "-":
            if index == 0 or s[index-1].lower() == "e":
                continue
            return False

        else:
            return False

    return (
            hasNumAfterExponent or
            (not hasExponent and (hasNum or hasNumAfterPoint))
            )


print(is_number("2e0"))
print(is_number("+1.31e12"))
print(is_number("-1e-1"))
print(is_number("e3"))
print(is_number("2e"))
