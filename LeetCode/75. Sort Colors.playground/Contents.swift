/*************************************************************************************
 Given an array with n objects colored red, white or blue, 
 sort them so that objects of the same color are adjacent, with the colors in the order red, white and blue.
 
 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
 
 Note:
 You are not suppose to use the library's sort function for this problem.
 **************************************************************************************/


func sortColors(_ nums: inout [Int]) {
    var lt = 0
    var i = 0
    var gt = nums.count - 1
    
    while i <= gt {
        let color = nums[i]
        if color == 0 {
            swap(&nums, i: i, j: lt)
            lt += 1
            i += 1
        }
        else if color == 2 {
            swap(&nums, i: i, j: gt)
            gt -= 1
        }
        else {
            i += 1
        }
    }
}

func swap(_ nums: inout [Int], i: Int, j: Int) {
    let tmp = nums[i]
    nums[i] = nums[j]
    nums[j] = tmp
}


var x = [1,1,2,0,0,0,2]
sortColors(&x)