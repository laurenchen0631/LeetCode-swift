def find_ladders(beginWord, endWord, wordList):
    """
    :type beginWord: str
    :type endWord: str
    :type wordList: List[str]
    :rtype: List[List[str]]
    """

    if endWord not in wordList:
        return []

    head_set = {beginWord}
    tail_set = {endWord}

    bfs = {}
    word_list_set = set(wordList)
    helper(word_list_set, head_set, tail_set, bfs, False)

    res = []
    path = [beginWord]
    searchPath(beginWord, endWord, bfs, path, res)

    return res


characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

def helper(words, set_a, set_b, bfs, flip):
    if not set_a:
        return

    if len(set_a) < len(set_b):
        helper(words, set_b, set_a, bfs, not flip)
        return

    words.difference_update(set_a.union(set_b))

    done = False
    transformable_words = set()

    for word in set_a:
        for i in range(len(word)):
            for char in characters:
                transformed = word[:i] + char + word[i+1:]

                key = transformed if flip else word
                val = word if flip else transformed
                transformable_list = bfs.get(key, [])

                if transformed in set_b:
                    done = True
                    transformable_list.append(val)
                    bfs[key] = transformable_list

                if not done and transformed in words:
                    transformable_words.add(transformed)
                    transformable_list.append(val)
                    bfs[key] = transformable_list

    if done:
        return
    helper(words, set_b, transformable_words, bfs, not flip)

def searchPath(start, end, bfs, path, res):
    if start == end:
        res.append(path[:])
        return

    for word in bfs.get(start, []):
        path.append(word)
        searchPath(word, end, bfs, path, res)
        path.pop()


print(find_ladders("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
