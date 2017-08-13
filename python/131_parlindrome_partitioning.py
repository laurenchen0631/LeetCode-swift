def partition(s):
    """
    :type s: str
    :rtype: List[List[str]]
    """
    res = []
    if not s:
        return s

    dfs(s, 0, [], res)
    return res

def dfs(s, start, path, res):
    if start == len(s):
        res.append(path[:])
        return

    for index in range(start, len(s)):
        substr = s[start:index+1]
        if is_partition(substr):
            path.append(substr)
            dfs(s, index + 1, path, res)
            path.pop()

def is_partition(s):
    return s == s[-1::-1]

print(partition("aab"))
