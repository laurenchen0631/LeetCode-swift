/*************************************************************************************
 Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 If the target is not found in the array, return [-1, -1].
 
 For example,
 Given [5, 7, 7, 8, 8, 10] and target value 8,
 return [3, 4].
 **************************************************************************************/

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    
    let NOT_FOUND = [-1, -1]
    guard !nums.isEmpty else {
        return NOT_FOUND
    }
    
    // if all elements is same -- [1,1,1,1,1] -- no need for searching
    if nums.first == nums.last {
        if nums.first! == target {
            return [0, nums.count - 1]
        }
        else {
            return NOT_FOUND
        }
    }
    
    let startIndex = binarySearch(from: nums, target: target, which: .first)
    // if no any start exists, stop procedure
    if startIndex == -1 {
        return NOT_FOUND
    }
    let endIndex = binarySearch(from: nums, target: target, which: .last)
    
    return [startIndex, endIndex]
}

enum SearchType {
    case first
    case last
}

func binarySearch(from arr: [Int], target val: Int, which type: SearchType) -> Int {
    var low = 0
    var high = arr.count - 1
    
    var targetIndex = -1
    while low <= high {
        let midIndex = low + (high - low) / 2
        
        
        if arr[midIndex] == val {
            targetIndex = midIndex
            // when find the target, continues to search the left part to make sure find the first value
            if type == .first {
                high = midIndex - 1
            }
            // when find the target, continues to search the right part to make sure find the last value
            else {
                low = midIndex + 1
            }
        }
        else if val < arr[midIndex] {
            high = midIndex - 1
        }
        else {
            low = midIndex + 1
        }
    }
    
    return targetIndex
}

binarySearch(from: [1,2,3,3,3,3,4,5,6,8], target: 3, which: .last)
