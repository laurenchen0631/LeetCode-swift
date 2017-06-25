def remove_duplicates(nums):
    if len(nums) < 2:
        return len(nums)

    duplicate = 0
    for i in range(1, len(nums)):
        if nums[i-1] == nums[i]:
            duplicate += 1
        elif duplicate > 0:
            nums[i - duplicate] = nums[i]
    return len(nums) - duplicate


nums = [1,1,1,1,2,3,3,3,4,4,5,10,10]
print(remove_duplicates(nums))
print(nums)
