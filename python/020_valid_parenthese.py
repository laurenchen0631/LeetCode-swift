def is_valid(s):
    stack = []
    parenthese = {")": "(", "]": "[", "}": "{"}

    for c in s:
        if c in parenthese:
            if len(stack) == 0:
                return False
            pair = stack.pop()
            if pair != parenthese[c]:
                return False
        else:
            stack.append(c)

    return len(stack) == 0


print(is_valid("()[]{}"))
print(is_valid("([)]"))
print(is_valid("]]]]"))
