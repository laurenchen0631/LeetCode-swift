"""
A peak element is an element that is greater than its neighbors.

Given an input array where num[i] ≠ num[i+1], find a peak element and return its index.

The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

You may imagine that num[-1] = num[n] = -∞.

For example, in array [1, 2, 3, 1], 3 is a peak element and your function
should return the index number 2.
"""

def findPeakElement(nums):
    """"
        :type nums: List[int]
        :rtype: int
    """
    return helper(nums, 0, len(nums) - 1)

def helper(nums, start, end):
    if start == end:
        return nums[start]
    elif start == end - 1:
        return start if nums[start] > nums[end] else end

    mid = (start + end) // 2
    if nums[mid] > nums[mid -1] and nums[mid] > nums[mid + 1]:
        return mid
    elif nums[mid - 1] > nums[mid] and nums[mid] > nums[mid + 1]:
        return helper(nums, start, mid - 1)
    else:
        return helper(nums, mid + 1, end)

