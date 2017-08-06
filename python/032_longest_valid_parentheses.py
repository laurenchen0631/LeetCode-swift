def longest_valid_parentheses(s):
    """
    Given a string containing just the characters '(' and ')',
    find the length of the longest valid (well-formed) parentheses substring.

    ")()())", where the longest valid parentheses substring is "()()", which has length = 4.
    """
    stack = []
    max_length = 0
    for (index, char) in enumerate(s):
        if char == ")":
            if not stack or s[stack[-1]] != "(":
                stack.append(index)
            else:
                stack.pop()
                max_length = max(
                    max_length,
                    index - (stack[-1] if stack else -1))
        else:
            stack.append(index)
    return max_length

print(longest_valid_parentheses(")()())"))
