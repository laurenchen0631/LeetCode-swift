characters = [
    "a", "b", "c", "d", "e", "f", "g",
    "h", "i", "j", "k", "l", "m", "n",
    "o", "p", "q", "r", "s", "t", "u",
    "v", "w", "x", "y", "z"]

def ladderLength(beginWord, endWord, wordList):
    """
    :type beginWord: str
    :type endWord: str
    :type wordList: List[str]
    :rtype: int
    """
    if endWord not in wordList:
        return 0

    wordList = set(wordList)
    begin_set = {beginWord}
    end_set = {endWord}
    visited = set()
    path_length = 1

    while begin_set and end_set:
        if len(begin_set) > len(end_set):
            begin_set, end_set = end_set, begin_set

        children = set()
        for word in begin_set:
            for i in range(len(word)):
                for alphabet in characters:
                    transformed = word[:i] + alphabet + word[i+1:]
                    if transformed in end_set:
                        return path_length + 1

                    if transformed in wordList and transformed not in visited:
                        children.add(transformed)
                        visited.add(transformed)
        begin_set = children
        path_length += 1

    return 0

print(ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
