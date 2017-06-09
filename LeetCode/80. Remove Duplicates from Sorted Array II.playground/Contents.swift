/*************************************************************************************
 Follow up for "Remove Duplicates":
 What if duplicates are allowed at most twice?
 
 For example,
 Given sorted array nums = [1,1,1,2,2,3],
 
 Your function should return length = 5, 
 with the first five elements of nums being 1, 1, 2, 2 and 3.
 It doesn't matter what you leave beyond the new length.
 **************************************************************************************/

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 2 else {
        return nums.count
    }
    
    var duplicateTwice = false
    var index = 0
    for j in 1 ..< nums.count {
        if nums[index] < nums[j] {
            duplicateTwice = false
        }
        else {
            if duplicateTwice {
                continue
            }
            duplicateTwice = true
        }
        
        index += 1
        nums[index] = nums[j]
    }
//    var processingIndex = 2
//    for i in 2 ..< nums.count {
//        if nums[processingIndex - 2] < nums[i] {
//            nums[processingIndex] = nums[i]
//            processingIndex += 1
//        }
//    }
    
    return index + 1
}

var x = [1,1,1,2,2,2,2,3,3,3,4,4,6]
removeDuplicates(&x)
print(x)