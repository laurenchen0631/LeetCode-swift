/******************************************************************
 Given an array S of n integers, are there elements a, b, c, and d in S 
 such that a + b + c + d = target? 
 Find all unique quadruplets in the array which gives the sum of target.
 
 For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.
 
 A solution set is:
 [
 [-1,  0, 0, 1],
 [-2, -1, 1, 2],
 [-2,  0, 0, 2]
 ]
 ********************************************************************/


func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let sortedNums = nums.sorted()
    let length = nums.count
    
    var combinations: [[Int]] = []
    var i = 0
    while i < length - 3 {
        let x = sortedNums[i]
        let complement = target - x
        let combinationToComplement = threeSum(
            nums: sortedNums.dropFirst(i + 1),
            equalsTo: complement
        )
        
        for threeSumCombination in combinationToComplement {
            combinations.append([x] + threeSumCombination)
        }
        
        while (i < length - 3 && sortedNums[i + 1] == x) {
            i = i + 1
        }
        i = i + 1
    }
    
    return combinations
}

func threeSum(nums: ArraySlice<Int>, equalsTo target: Int) -> [[Int]] {
    let sortedNums = Array(nums)
    let length = nums.count
    
    var combinations: [[Int]] = []
    var i = 0
    while i < length - 2 {
        let x = sortedNums[i]
        let complement = target - x
        
        var front = i + 1
        var back = length - 1
        while front < back {
            let y = sortedNums[front]
            let z = sortedNums[back]
            
            if y + z < complement {
                front = front + 1
            }
            else if y + z > complement {
                back = back - 1
            }
            else {
                combinations.append([x, y, z])
                
                while front < back && sortedNums[front] == y {
                    front = front + 1
                }
                while front < back && sortedNums[back] == z {
                    back = back - 1
                }
            }
        }
        
        while (i < length - 2 && sortedNums[i + 1] == x) {
            i = i + 1
        }
        i = i + 1
    }
    
    return combinations
}



    
