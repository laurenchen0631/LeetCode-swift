DIGIT_TO_LETTERS = [
    "",
    "",
    "abc",
    "def",
    "ghi",
    "jkl",
    "mno",
    "pqrs",
    "tuv",
    "wxyz"
]


def letter_combinations(digits):
    if not digits:
        return []

    combinations = [""]
    for c in digits:
        digit = ord(c) - ord("0")
        tmp = []
        for letter in DIGIT_TO_LETTERS[digit]:
            for comb in combinations:
                tmp.append(comb + letter)
        combinations = tmp
    return combinations


print(letter_combinations("23"))
