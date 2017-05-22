def two_sum(nums, target):
    num_dict = {}
    for (i, num) in enumerate(nums):
        complement = target - num
        if complement in num_dict:
            return [num_dict[complement], i]
        else:
            num_dict[num] = i
    return [-1, -1]


print(two_sum([2, 7, 11, 15], 9))
