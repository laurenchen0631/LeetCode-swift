def length_of_longest_substring(s):
    char_dict = {}
    start_index = 0
    max_length = 0

    for end_index in range(len(s)):
        c = s[end_index]
        if c in char_dict and start_index <= char_dict[c]:
            start_index = char_dict[c] + 1
        else:
            max_length = max(max_length, end_index - start_index + 1)
        char_dict[c] = end_index

    return max_length


print(length_of_longest_substring("abcbabb"))
