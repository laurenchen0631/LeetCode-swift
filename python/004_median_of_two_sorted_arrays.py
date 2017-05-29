def get_kth_element_imp(l1, l1_lo, l2, l2_lo, k):
    m = len(l1) - l1_lo
    n = len(l2) - l2_lo

    if m == 0:
        return l2[l2_lo + k - 1]
    elif n == 0:
        return l1[l1_lo + k - 1]
    elif k == 1:
        return min(l1[l1_lo], l2[l2_lo])

    # i, j is one-based index
    i = min(m, k // 2)
    j = min(n, k // 2)

    # choose the list that have smaller num, and search its rest part
    if l1[l1_lo + i - 1] > l2[l2_lo + j - 1]:
        return get_kth_element_imp(l1, l1_lo, l2, l2_lo+j, k-j)
    else:
        return get_kth_element_imp(l1, l1_lo + i, l2, l2_lo, k-i)


def get_kth_element(l1, l2, k):
    return get_kth_element_imp(l1, 0, l2, 0, k)


def findMedianSortedArrays(nums1, nums2):
    median_left = (len(nums1) + len(nums2) + 1) // 2
    median_right = (len(nums1) + len(nums2) + 2) // 2
    return (
            get_kth_element(nums1, nums2, median_left)
            + get_kth_element(nums1, nums2, median_right)
        ) / 2


print(findMedianSortedArrays([1,3], [2]))
