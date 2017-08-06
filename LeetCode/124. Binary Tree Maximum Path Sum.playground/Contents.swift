/*************************************************************************************
 Given a binary tree, find the maximum path sum.
 
 For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.
 
 For example:
 Given the below binary tree,
 
   1
  / \
 2   3
 Return 6.
 **************************************************************************************/

//     1
//    / \
//   2   3
//  / \
// 1   4
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

func maxPathSum(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    var pathSum = root!.valz
    dfsMaxPath(root: root, pathSum: &pathSum)
    return pathSum
}

func dfsMaxPath(root: TreeNode?, pathSum: inout Int) -> Int {
    guard let root = root else {
        return 0
    }
    
    let leftPathSum = max(dfsMaxPath(root: root.left, pathSum: &pathSum), 0)
    let rightPathSum = max(dfsMaxPath(root: root.right, pathSum: &pathSum), 0)
    
    pathSum = max(pathSum, leftPathSum + rightPathSum + root.val)
    
    return root.val + max(leftPathSum, rightPathSum)
}

let root = TreeNode(-3)
//root.left = TreeNode(2)
//root.left?.left = TreeNode(1)
//root.left?.right = TreeNode(4)
//root.right = TreeNode(3)

maxPathSum(root)
