def findMin(nums):
    """
    Follow up for "Find Minimum in Rotated Sorted Array":
    What if duplicates are allowed?

    Would this affect the run-time complexity? How and why?
    """
    lo = 0
    hi= len(nums) - 1
    while lo < hi:
        mid = (lo + hi) // 2

        if nums[mid] > nums[hi]:
            lo = mid + 1
        elif nums[mid] < nums[hi]:
            hi = mid
        else:
            hi -= 1
    return nums[lo]
