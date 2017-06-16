def three_sum_closest(nums, target):
    if len(nums) < 4:
        return sum(nums)
    nums.sort()
    min_error = (nums[0] + nums[1] + nums[2]) - target

    for i in range(len(nums) - 2):
        lo = i + 1
        hi = len(nums) - 1
        while lo < hi:
            acc = nums[i] + nums[lo] + nums[hi]

            if acc == target:
                return acc
            elif abs(acc - target) < abs(min_error):
                min_error = acc - target

            if acc > target:
                hi -= 1
            else:
                lo += 1
    return target + min_error


print(three_sum_closest([-1,2,3], 1))
