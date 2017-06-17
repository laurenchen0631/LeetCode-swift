def fourSum(nums, target):
    nums.sort()
    combinations = []

    if len(nums) < 4:
        return []
    for i in range(len(nums) - 3):
        if i > 0 and nums[i-1] == nums[i]:
            continue

        # stop find other combinations when smallest number execced target
        if sum(nums[i:i+4]) > target:
            break

        # try next num when greatest number can't execeed target
        if nums[i] + sum(nums[-1:-4:-1]) < target:
            continue

        for j in range(i+1, len(nums) - 2):
            if j > i + 1 and nums[j-1] == nums[j]:
                continue
            if nums[i] + sum(nums[j:j+3]) > target:
                break
            if nums[i] + nums[j] + sum(nums[-1:-3:-1]) < target:
                continue

            lo = j + 1
            hi = len(nums) - 1
            acc_part = nums[i] + nums[j]
            while lo < hi:
                acc = acc_part + nums[lo] + nums[hi]
                if acc < target:
                    lo += 1
                elif acc > target:
                    hi -= 1
                else:
                    combinations.append([nums[i], nums[j], nums[lo], nums[hi]])
                    while lo < hi and nums[lo] == nums[lo + 1]:
                        lo += 1
                    while lo < hi and nums[hi-1] == nums[hi]:
                        hi -= 1
                    lo += 1
                    hi -= 1
    return combinations


def four_sum(nums, target):
    nums.sort()
    combinations = []

    for i in range(len(nums)):
        if i > 0 and nums[i-1] == nums[i]:
            continue
        complement = target - nums[i]
        for three_sum_combinations in three_sum(nums[i+1:], complement):
            combinations.append([nums[i]] + three_sum_combinations)
    return combinations


def three_sum(nums, target):
    combinations = []
    for i in range(len(nums)):
        if i > 0 and nums[i-1] == nums[i]:
            continue

        lo = i + 1
        hi = len(nums) - 1
        while lo < hi:
            acc = nums[i] + nums[lo] + nums[hi]
            if acc < target:
                lo += 1
            elif acc > target:
                hi -= 1
            else:
                combinations.append([nums[i], nums[lo], nums[hi]])
                y = nums[lo]
                while lo < hi and nums[lo] == y:
                    lo += 1
                z = nums[hi]
                while lo < hi and nums[hi] == z:
                    hi -= 1
    return combinations


# -2 -1 0, 0, 1, 2
print(fourSum([1, 0, -1, 0, -2, 2], 0))
