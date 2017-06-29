def remove_element(nums, val):
    numTarget = 0
    for i in range(len(nums)):
        if nums[i] == val:
            numTarget += 1
        else:
            nums[i - numTarget] = nums[i]
    return len(nums) - numTarget
