def compareVersion(version1, version2):
    """
    :type version1: str
    :type version2: str
    :rtype: int
    """
    i = 0
    j = 0
    base_zero = ord('0')

    while i < len(version1) or j < len(version2):
        num1 = 0
        while i < len(version1) and version1[i] != '.':
            num1 = num1 * 10 + ord(version1[i]) - base_zero
            i += 1
        num2 = 0
        while j < len(version2) and version2[j] != '.':
            num2 = num2 * 10 + ord(version2[j]) - base_zero
            j += 1

        if num1 > num2:
            return 1
        elif num2 > num1:
            return -1

        i += 1
        j += 1
    return 0

print(compareVersion('1.2', '1.1.2'))
print(compareVersion('1.1.2', '1.1.2'))
print(compareVersion('1.1', '1'))
