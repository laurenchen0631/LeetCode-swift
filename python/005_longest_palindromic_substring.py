def longest_palindromic_substring(s):
    if len(s) < 2:
        return s

    start_index = end_index = 0
    max_length = 1
    for i in range(0, len(s) - 1):
        if i > len(s) - 1 - max_length//2:
            break

        length = max(
                    palindrome_from_center(s, i, i),
                    palindrome_from_center(s, i, i+1)
                )
        if length > max_length:
            start_index = i - (length-1) // 2
            end_index = i + length // 2
            max_length = length

    return s[start_index: end_index+1]


def palindrome_from_center(s, left, right):
    if s[left] != s[right]:
        return 0

    while left - 1 >= 0 and right + 1 < len(s) and s[left-1] == s[right+1]:
        left -= 1
        right += 1

    return right - left + 1


def longest_palindrome(s):
    if not s:
        return 0
    max_length = 1
    start = 0
    for i in range(len(s)):
        if i - max_length >= 1:
            substr = s[i - max_length - 1: i+1]
            if substr == substr[::-1]:
                start = i - max_length - 1
                max_length += 2
                continue
        if i - max_length >= 0:
            substr = s[i - max_length: i+1]
            if substr == substr[::-1]:
                start = i - max_length
                max_length += 1

    return s[start: start + max_length]


print(longest_palindrome("babbb"))
