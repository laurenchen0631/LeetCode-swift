"""
'.' Matches any single character.
'*' Matches zero or more of the preceding element.

The matching should cover the entire input string (not partial).
"""


def matched(s, p):
    regex = []
    for c in p:
        if c == "*":
            regex[-1] += "*"
        else:
            regex.append(c)
    return matched_imp(s, 0, regex, 0)


def matched_imp(s, i, p, j):
    if j == len(p):
        return len(s) == i

    if p[j][-1] != "*":
        if p[j] == "." or (i < len(s) and p[j] == s[i]):
            return matched_imp(s, i+1, p, j+1)
    else:
        if matched_imp(s, i, p, j+1):
            return True
        k = i
        while k < len(s) and (s[k] == p[j][0] or p[j][0] == "."):
            k += 1
            if matched_imp(s, k, p, j+1):
                return True
    return False


# f[i][j]: if s[0..i-1] matches p[0..j-1]
# if p[j - 1] != '*'
#      f[i][j] = f[i - 1][j - 1] && s[i - 1] == p[j - 1]
# if p[j - 1] == '*', denote p[j - 2] with x
#   f[i][j] is true iff any of the following is true
#   1) "x*" repeats 0 time and matches empty: f[i][j - 2]
#   2) "x*" repeats >= 1 times and matches "x*x": s[i - 1] == x && f[i - 1][j]

def matched_dp(s, p):
    if not s and not p:
        return True

    dp = [False] * (len(p) + 1)
    dp[0] = True
    prev = False
    for i in range(len(s) + 1):
        for j in range(1, len(p) + 1):
            tmp = dp[j]
            if p[j - 1] == "*":
                dp[j] = (
                        dp[j-2] or
                        (i > 0 and dp[j] and
                            (s[i-1] == p[j-2] or p[j-2] == ".")))
            else:
                dp[j] = (
                        i > 0 and
                        prev and
                        (s[i-1] == p[j-1] or p[j-1] == "."))
            prev = tmp
        prev = dp[0]
        dp[0] = False
    return dp[-1]


print(matched_dp("a", "ab*"))
print(matched_dp("aaa", "a*"))
print(matched_dp("ab", ".*c"))
print(matched_dp("aa", "a"))
print(matched_dp("", ""))
