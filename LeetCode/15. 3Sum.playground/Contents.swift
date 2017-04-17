/******************************************************************
 Given an array S of n integers, are there elements a, b, c in S 
 such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note: The solution set must not contain duplicate triplets.
 
 For example, given array S = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
*********************************************************************/

func threeSum(_ nums: [Int]) -> [[Int]] {
    // sort input array
    let sortedNums = nums.sorted()
    let length = sortedNums.count
    
    // make sure the length of input is 3 at least
    if length < 2 {
        return []
    }
    
    var combinations: [[Int]] = []
    // fix the first number 'x' from index 0 to nums.length - 3
    var i = 0
    while (i < length - 2) {
        
        let x = sortedNums[i]
        let complement = -x
        
        // try possible combination of second number 'y' and third number 'z'
        var front = i + 1
        var back = length - 1
        while front < back {
            let sum = sortedNums[front] + sortedNums[back]
            if sum < complement {
                front = front + 1
            }
            else if sum > complement {
                back = back - 1
            }
            // if number the sum of three numbers equal to 0
            else {
                // record this combination to output
                let y = sortedNums[front]
                let z = sortedNums[back]
                combinations.append([x, y, z])
                
                // before we try the next combination
                // skip the same number has been in output
                while (front < back && sortedNums[front] == y) {
                    front = front + 1
                }
                while (front < back && sortedNums[back] == z) {
                    back = back - 1
                }
            }
            
           
        }
        
        // skip the same number of the first number has been in output
        while (i + 1 < length && sortedNums[i+1] == x) {
            i = i + 1
        }
        i = i + 1
        
    }
    
    
    return combinations
}

threeSum([-1, 0, 1, 2, -1, -4])


