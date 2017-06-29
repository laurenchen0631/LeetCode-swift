/*************************************************************************************
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
        1
       / \
      2   2
     / \ / \
    3  4 4  3
 But the following [1,2,2,null,3,null,3] is not:
         1
        / \
       2   2
        \   \
         3   3
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

func isSymmetric(_ root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }
    
    return isSymmetric(root!.left, root!.right)
}

func isSymmetric(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil, q == nil {
        return true
    }
    else if p == nil || q == nil {
        return false
    }
    else if p!.val != q!.val {
        return false
    }
    else {
        return isSymmetric(p!.left, q!.right) && isSymmetric(p!.right, q!.left)
    }
}