class Solution(object):
    def longestValidParentheses(self, s):
        """
        :type s: str
        :rtype: int
        """
        stack = []
        for (i, paren) in enumerate(s):
            if paren == ")":
                if len(stack):
                    PREV_PAREN = s[stack[-1]]
                    if PREV_PAREN == "(":
                        del stack[-1]
                    else:
                        stack.append(i)
                else:
                    stack.append(i)
            else:
                stack.append(i)
        print(stack)

        longest = 0
        if len(stack):
            rightBound = len(s)
            while len(stack):
                leftBound = stack[-1]
                del stack[-1]
                longest = max(longest, rightBound - leftBound - 1)
                rightBound = leftBound
            longest = max(longest, rightBound)
        else:
            longest = len(s)

        return longest
