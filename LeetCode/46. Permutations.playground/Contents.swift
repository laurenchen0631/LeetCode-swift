/*************************************************************************************
 Given a collection of distinct numbers, return all possible permutations.
 
 For example,
 [1,2,3] have the following permutations:
 **************************************************************************************/


// Assume we want want to find permuations of [1, 2, 3, 4]
// we hava already know permuations of [1, 2, 3] are 
// ... [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]]
// we can get all permuations of [1,2,3,4] by 
// ... inserting "4" in all possible position of permuations of [1,2,3]
// [ [(4),1,(4),2,(4),3,(4)], [(4),1,(4),3,(4),2,(4)], .... ]
func permute(_ nums: [Int]) -> [[Int]] {
    var permuations: [[Int]] = [[]]
    
    // increase permuations one number by one number
    // [1] -> [[1, 2], [2,1]] -> ....
    for num in nums {
        var tmpPerms: [[Int]] = []
        for perm in permuations {
            for insertPosition in 0 ... perm.count {
                var newPerm = perm
                newPerm.insert(num, at: insertPosition)
                tmpPerms.append(newPerm)
            }
        }
        permuations = tmpPerms
    }
    
    return permuations
}
