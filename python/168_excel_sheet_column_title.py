def convertToTitle(n):
    title = []
    dividend = n
    while dividend > 0:
        dividend -= 1
        title.append(chr(65 + dividend % 26))
        dividend //= 26
    return ''.join(title)[::-1]
