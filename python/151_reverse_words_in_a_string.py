import re

def reverseWords(s):
    """
    :type s: str
    :rtype: str
    """
    return ' '.join(reversed(re.findall(r'[\w!,+-.?~@#%^&*\'\"]+', s)))

print(reverseWords('the sky is blue!'))

