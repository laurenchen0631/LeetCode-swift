def findSubstring(s, words):
    """
    :type s: str
    :type words: List[str]
    :rtype: List[int]
    """
    STR_LENGTH = len(s)
    NUM_WORDS = len(words)
    if STR_LENGTH == 0 or NUM_WORDS == 0:
        return []

    substring_indexes = []
    WORD_LENGTH = len(words[0])
    WORD_DICT = {}
    for word in words:
        WORD_DICT[word] = WORD_DICT.get(word, 0) + 1

    for i in range(WORD_LENGTH):
        left = i
        count = 0
        seen = {}
        j = i
        for j in range(i, STR_LENGTH - WORD_LENGTH + 1, WORD_LENGTH):
            CHECKED_WORD = s[j:j+WORD_LENGTH]
            if WORD_DICT.get(CHECKED_WORD):
                seen[CHECKED_WORD] = seen.get(CHECKED_WORD, 0) + 1
                count += 1
                if seen[CHECKED_WORD] > WORD_DICT[CHECKED_WORD]:
                    while seen[CHECKED_WORD] > WORD_DICT[CHECKED_WORD]:
                        LEFT_WORD = s[left:left+WORD_LENGTH]
                        seen[LEFT_WORD] -= 1
                        left += WORD_LENGTH
                        count -= 1
                if count == NUM_WORDS:
                    substring_indexes.append(left)
                    LEFT_WORD = s[left:left+WORD_LENGTH]
                    seen[LEFT_WORD] -= 1
                    left += WORD_LENGTH
                    count -= 1
            else:
                seen = {}
                count = 0
                left = j + WORD_LENGTH

    return substring_indexes


# print(findSubstring("barfoothefoobarman", ["foo", "bar"]))
# print(findSubstring("a", ["a"]))
print(findSubstring("barfoofoobarthefoobarman", ["bar", "foo", "the"]))
