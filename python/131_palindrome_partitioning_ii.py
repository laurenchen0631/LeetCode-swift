def minCut(s):
    """
    1. cut[i] is the minimum of cut[j - 1] + 1 (j <= i), if [j, i] is palindrome.
    2. If [j, i] is palindrome, [j + 1, i - 1] is palindrome, and c[j] == c[i].
    """

    cut = []
    palindrome = [[False] * len(s) for _ in range(len(s))]

    for i in range(len(s)):
        min_cut = i
        for j in range(i + 1):
            if s[i] == s[j] and (j + 1 > i - 1 or palindrome[j + 1][i - 1]):
                palindrome[j][i] = True
                min_cut = 0 if j == 0 else min(min_cut, cut[j-1] + 1)
        cut.append(min_cut)

    return cut[-1]

def min_cut(s):
    if is_palindrome(s):
        return 0

    length = len(s)
    for i in range(length):
        if is_palindrome(s[:i]) and is_palindrome(s[i:]):
            return 1

    dp = [-1] * (length + 1)
    for i in range(1, length):
        j = 0
        while i - j >= 0 and i + j < length and s[i-j] == s[i+j]:
            dp[i+j+1] = min(dp[i+j+1], 1 + dp[i-j])
            j += 1

        j = 0
        while i - j - 1 >= 0 and i + j < length and s[i-j-1] == s[i+j]:
            dp[i+j+1] = min(dp[i+j+1], 1 + dp[i-j-1])
            j += 1

    return dp[-1]


def is_palindrome(s):
    return s == s[-1::-1]
