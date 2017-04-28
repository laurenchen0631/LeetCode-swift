/*************************************************************************************
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
 
 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
 
 The replacement must be in-place, do not allocate extra memory.
 
 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 **************************************************************************************/

func nextPermutation(_ nums: inout [Int]) {
    
    let length = nums.count
    guard length > 1 else {
        return
    }
    
    // find the minimum permutation part, eg. 5 3 2 3 1, min part is 2,3,1 -> 3,1,2 (due to 2 < 3)
    var permutationIndex = length - 1
    while permutationIndex > 0 {
        if nums[permutationIndex - 1] < nums[permutationIndex] {
            break
        }
        permutationIndex -= 1
    }
    
    // permutaionIndex is 0, which means nums is like 5,4,3,2,1 should become 1,2,3,4,5
    if permutationIndex == 0 {
        reverse(&nums, fromIndex: permutationIndex, toIndex: length - 1)
        return
    }
    
    // find what is the next permutation of the part
    // 2,3,1 -> 3,1,2
    // 2,4,3,1 -> 3,1,2,4
    // find the the next greater number than head of minimum permutation part, and swap them
    
    var nextHeadIndex = length - 1
    while nextHeadIndex > permutationIndex {
        if nums[nextHeadIndex] > nums[permutationIndex - 1] {
            break
        }
        nextHeadIndex -= 1
    }
    swap(&nums[permutationIndex - 1], &nums[nextHeadIndex])
    
    // then reverse the rest part
    reverse(&nums, fromIndex: permutationIndex, toIndex: length - 1)
    
}

func reverse(_ nums: inout [Int], fromIndex start: Int, toIndex end: Int) {
    for i in 0 ..< (end - start + 1) / 2 {
        swap(&nums[start + i], &nums[end - i])
    }
}

var x = [1, 1]
nextPermutation(&x)
print(x)
