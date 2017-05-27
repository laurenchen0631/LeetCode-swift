/*************************************************************************************
 Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
 
 You may assume the integer do not contain any leading zero, except the number 0 itself.
 
 The digits are stored such that the most significant digit is at the head of the list.
 **************************************************************************************/

func plusOne(_ digits: [Int]) -> [Int] {
    guard digits.count > 0 else {
        return [1]
    }
    
    var nums = digits
    for i in stride(from: nums.count - 1, through: 0, by: -1) {
        if nums[i] < 9 {
            nums[i] += 1
            return nums
        }
        nums[i] = 0
    }
    nums.insert(1, at: 0)
    return nums
}

plusOne([1,3,4,9])
plusOne([9,9])