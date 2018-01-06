def majorityElement(nums):
    """
    Given an array of size n, find the majority element.
    The majority element is the element that appears more than ⌊ n/2 ⌋ times.

    :type nums: List[int]
    :rtype: int
    """
    # majority_threshold = len(nums) // 2
    # counter = {}
    # for num in nums:
    #     counter[num] = (counter.get(num, 0) + 1)
    #     if counter[num] > majority_threshold:
    #         return num
    # return nums[0]

    majority = None
    majority_threshold = len(nums) // 2
    count = 0
    for num in nums:
        if count == 0:
            majority = num
            count += 1
        elif majority != num:
            count -= 1
        else:
            count += 1
    return majority

print(majorityElement([1]))
