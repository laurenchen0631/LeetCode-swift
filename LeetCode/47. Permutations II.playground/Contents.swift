/*************************************************************************************
 Given a collection of numbers that might contain duplicates, return all possible unique permutations.
 
 For example,
 [1,1,2] have the following unique permutations:
 [
 [1,1,2],
 [1,2,1],
 [2,1,1]
 ]
 **************************************************************************************/

func permuteUnique(_ nums: [Int]) -> [[Int]] {
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
                
                // Assume we have nums [1,1,2,2], and 
                // we want to insert the last "2" into previous permutations [2,1,1], [1,2,1], [1,1,2]
                // [(2), 2, 1, 1], and we stop inserting "2" to next position because we encounter another "2"
                // this duplicate "2" has already been inserted to other position in previos permuations
                // if we continuing inserting new "2" into this duplicate, it will generate duplicates.
                if insertPosition < perm.count, perm[insertPosition] == num {
                    break
                }
            }
        }
        permuations = tmpPerms
    }
    
    return permuations
}

permuteUnique([1,1,2,2])