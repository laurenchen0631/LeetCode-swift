def convert(s, num_rows):
    if num_rows < 2:
        return s
    rows = [[] for _ in range(num_rows)]
    STEP = 2 * num_rows - 2
    for i in range(num_rows):
        cursor = i
        advance = STEP - 2*i
        if advance == 0:
            advance = STEP
        while cursor < len(s):
            rows[i].append(s[cursor])
            cursor += advance
            advance = STEP - advance
            if advance == 0:
                advance = STEP
        rows[i] = "".join(rows[i])

    return "".join(rows)


print(convert("PAYPALISHIRING", 3))
