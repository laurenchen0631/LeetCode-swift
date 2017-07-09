/*************************************************************************************
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 **************************************************************************************/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return sortedArrayToBST(nums, start: 0, end: nums.count)
}

func sortedArrayToBST(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
    if start >= end {
        return nil
    }
    
    let mid = start + (end - start) / 2
    let root = TreeNode(nums[mid])
    root.left = sortedArrayToBST(nums, start: start, end: mid)
    root.right = sortedArrayToBST(nums, start: mid+1, end: end)
    return root
}

sortedArrayToBST([1,2])
