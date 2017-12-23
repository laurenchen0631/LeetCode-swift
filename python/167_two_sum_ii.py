def twoSum(numbers, target):
    """
    :type numbers: List[int]
    :type target: int
    :rtype: List[int]
    """
    lo = 0
    hi = len(numbers) - 1
    while lo < hi:
        total = numbers[lo] + numbers[hi]
        if total == target:
            return [lo + 1, hi + 1]
        elif total < target:
            lo += 1
        else:
            hi -= 1
    return [-1, -1]
