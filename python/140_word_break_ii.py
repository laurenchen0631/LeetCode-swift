def word_break(s, wordDict):
    """
    For example, given
        s = "catsanddog",
        dict = ["cat", "cats", "and", "sand", "dog"].

    A solution is ["cats and dog", "cat sand dog"].
    """

    word_dict = set(wordDict)
    memo = {len(s): ['']}

    def sentences(start):
        if start not in memo:
            memo[start] = [
                s[start:j+1] + (tail and ' ' + tail)
                for j in range(start, len(s))
                if s[start:j+1] in word_dict
                for tail in sentences(j+1)
            ]
        return memo[start]

    return sentences(0)

print(word_break('catsanddog', ["cat", "cats", "and", "sand", "dog"]))
