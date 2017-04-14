/******************************************************************
 Given an array of integers, return indices of the two numbers
 such that they add up to a specific target.

 You may assume that each input would have exactly one solution.

 Example:
 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
********************************************************************/

/*
 brutal force -- time: O(N^2), space: O(1)
 check every combination of nums[m]+nums[n], m < n
 until find the fisrt combination which equals to target
 if no any combination is matched, return null
*/
func twoSumByIndex(from nums: [Int], equalsTo target: Int) -> [Int]? {
	
	// go through every combination of (m, n)
	for m in 0 ..< nums.count - 1 {
		for n in (m + 1) ..< nums.count {
			// check whether nums[m]+nums[n] equals to target
			// if true, return the result [m ,n]
			if nums[m] + nums[n] == target {
				return [m, n]
			}
			// if false, try the next combination
		}
	}

	
	return nil;
}

twoSumByIndex(from: [2, 7, 11, 15], equalsTo: 22)

//
//func twoSum(nums: [Int], target: Int) -> [Int] {
//	var firstIndex: Int = 0
//	var secondIndex: Int = 1
//	let totalCount: Int = (nums.count * (nums.count - 1)) / 2
//
//	for _ in 0 ..< totalCount {
//		if (nums[firstIndex] + nums[secondIndex] == target) {
//			break
//		}
//
//		if (secondIndex == nums.count - 1) {
//			firstIndex += 1
//			secondIndex = firstIndex + 1
//		} else {
//			secondIndex += 1
//		}
//	}
//
//	return [firstIndex, secondIndex]
//}
//twoSum(nums: [2, 7, 11, 15], target: 22)
//

///* Solution2 one-pass hash table: O(N) O(N) */
func twoSum(nums: [Int], target: Int) -> [Int] {
	var complementMap: [Int: Int] = [:] // complement: Index
	var firstIndex: Int = 0
	var secondIndex: Int = 1

	for (i, num) in nums.enumerated() {
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
twoSum(nums: [2, 7, 11, 15], target: 22)
