def three_sum(nums):
    if len(nums) < 2:
        return []

    nums.sort()
    combinations = []
    i = 0
    while i < len(nums) - 2:
        lo = i + 1
        hi = len(nums) - 1
        complement = -nums[i]
        while lo < hi:
            x = nums[lo]
            y = nums[hi]
            total = x + y
            if total > complement:
                hi -= 1
            elif total < complement:
                lo += 1
            else:
                combinations.append([nums[i], x, y])
                while lo < hi and nums[lo] == x:
                    lo += 1
                while lo < hi and nums[hi] == y:
                    hi -= 1

        i += 1
        while i < len(nums)-2 and nums[i-1] == nums[i]:
            i += 1

    return combinations


def three_sum_v2(nums):
    count = {}
    for num in nums:
        count[num] = count.get(num, 0) + 1
    pos = sorted([x for x in count.keys() if x >= 0])
    neg = sorted([x for x in count.keys() if x < 0], reverse=True)
    combinations = []

    if count.get(0, 0) >= 3:
        combinations.append([0, 0, 0])

    for p in pos:
        for n in neg:
            complement = - (p + n)
            if (complement == p or complement == n) and count[complement] >= 2:
                combinations.append([n, complement, p])
            if complement in count and complement > n and complement < p:
                combinations.append([n, complement, p])
    return combinations


print(three_sum([-1, 0, 1, 2, -1, -4]))
