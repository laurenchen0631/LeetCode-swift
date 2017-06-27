/*************************************************************************************
 Given two binary trees, write a function to check if they are equal or not.
 
 Two binary trees are considered equal if they are structurally identical and the nodes have the same value.
 **************************************************************************************/

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    }
    else if p?.val != q?.val {
        return false
    }
    else {
        return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
    }
}