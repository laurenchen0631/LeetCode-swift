// : Playground - noun: a place where people can play

import UIKit

/**
 * There are two sorted arrays nums1 and nums2 of size m and n respectively.
 * Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 */

/* The time complexity muse less than O(m+n), which mean we can'y merge two sorted directly. */
func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {

	var nums1Index: Int? = nums1.count > 0 ? nums1.startIndex : nil
	var nums2Index: Int? = nums2.count > 0 ? nums2.startIndex : nil

	func findNext() -> Int {
		var num: Int = 0

		if nums1Index != nil && nums2Index != nil {
			if nums1[nums1Index!] <= nums2[nums2Index!] {
				num = nums1[nums1Index!]
				nums1Index = nums1.count - nums1Index! > 1 ? nums1Index!.advancedBy(1) : nil
			} else {
				num = nums2[nums2Index!]
				nums2Index = nums2.count - nums2Index! > 1 ? nums2Index!.advancedBy(1) : nil
			}
		} else if nums1Index != nil {
			num = nums1[nums1Index!]
			nums1Index = nums1.count - nums1Index! > 1 ? nums1Index!.advancedBy(1) : nil
		} else if nums2Index != nil {
			num = nums2[nums2Index!]
			nums2Index = nums2.count - nums2Index! > 1 ? nums2Index!.advancedBy(1) : nil
		}

		return num
	}

	let totalCount = nums1.count + nums2.count
	let targetNIndex: Int = totalCount % 2 == 0 ? totalCount / 2: (totalCount + 1) / 2

	var num: Int = 0
	for _ in 1 ... targetNIndex {
		num = findNext()
	}

	if totalCount % 2 == 0 {
		return Double(num + findNext()) / 2
	}

	return Double(num)
}

print(findMedianSortedArrays([1, 2, 3], [4, 5, 6]))

