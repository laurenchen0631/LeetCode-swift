// : Playground - noun: a place where people can play

import UIKit

/**
 * Given an array of integers, return indices of the two numbers
 * such that they add up to a specific target.

 * You may assume that each input would have exactly one solution.

 * Example:
 * Given nums = [2, 7, 11, 15], target = 9,

 * Because nums[0] + nums[1] = 2 + 7 = 9,
 * return [0, 1].
 */

/* Solution1 brutal force: O(N^2), O(1) */
func twoSum(nums: [Int], _ target: Int) -> [Int] {
	var firstIndex: Int = 0
	var secondIndex: Int = 1
	let totalCount: Int = (nums.count * (nums.count - 1)) / 2

	for _ in 0 ..< totalCount {
		if (nums[firstIndex] + nums[secondIndex] == target) {
			break
		}

		if (secondIndex == nums.count - 1) {
			firstIndex += 1
			secondIndex = firstIndex + 1
		} else {
			secondIndex += 1
		}
	}

	return [firstIndex, secondIndex]
}
twoSum([2, 7, 11, 15], 22)

/* Solution2 one-pass hash table: O(N) O(N) */
func twoSum2(nums: [Int], _ target: Int) -> [Int] {
	var complementMap: [Int: Int] = [:] // complement: Index
	var firstIndex: Int = 0
	var secondIndex: Int = 1

	for (i, num) in nums.enumerate() {
		let complement = target - num

		if let index = complementMap[complement] {
			firstIndex = index
			secondIndex = i
			break
		} else {
			complementMap.updateValue(i, forKey: num)
		}
	}

	return [firstIndex, secondIndex]

}
twoSum2([2, 7, 11, 15], 22)