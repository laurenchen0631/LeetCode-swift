/*************************************************************************************
 Given an array and a value, remove all instances of that value in place and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 The order of elements can be changed. It doesn't matter what you leave beyond the new length.
 
 Example:
 Given input array nums = [3,2,2,3], val = 3
 
 Your function should return length = 2, with the first two elements of nums being 2.
 **************************************************************************************/

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    
    let length = nums.count
    
    var index = 0
    var targetNum = 0
    while index + targetNum < length {
        // when the value doesn't equal to target, put it into the the position
        // [X X 5] -> [X X 5] -> [5 X 5]
        let uncheckedValue = nums[index + targetNum]
        if uncheckedValue != val {
            nums[index] = uncheckedValue
            index += 1
        } else {
            targetNum += 1
        }

    }
    
    return length - targetNum
}

var x = [3,2,2,3,4,3,2,1,3]
removeElement(&x, 3)
x
