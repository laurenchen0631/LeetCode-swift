/*************************************************************************************
 Given a sorted array, remove the duplicates in place 
 such that each element appear only once and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 For example,
 Given input array nums = [1,1,2],
 
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. 
 It doesn't matter what you leave beyond the new length.
 **************************************************************************************/

var x = [1,1,2]


func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    guard nums.count > 0 else {
        return 0
    }
    
    var duplicateNum = 0
    var length = nums.count
    for index in 1 ..< length {
        if nums[index] == nums[index - 1] {
            duplicateNum += 1
        }
        else {
            nums[index - duplicateNum] = nums[index]
        }
    }
    
//    var index = 1
//    while index < nums.count {
//        if nums[index] == nums[index - 1] {
//            nums.remove(at: index)
//        } else {
//            index += 1
//        }
//    }
//    
    return length - duplicateNum
}

removeDuplicates(&x)
print(x)