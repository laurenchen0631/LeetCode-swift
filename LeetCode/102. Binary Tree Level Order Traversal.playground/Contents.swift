/*************************************************************************************
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
        3
       / \
      9  20
     /  \
     15   7
 return its level order traversal as:
 [
    [3],
    [9,20],
    [15,7]
 ]
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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var level = [root!]
    var res: [[Int]] = []
    while !level.isEmpty {
        var nextLevel: [TreeNode] = []
        var group: [Int] = []
        for node in level {
            group.append(node.val)
            if node.left != nil {
                nextLevel.append(node.left!)
            }
            if node.right != nil {
                nextLevel.append(node.right!)
            }
        }
        res.append(group)
        level = nextLevel
    }
    return res
}

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.left?.left = TreeNode(15)
root.left?.right = TreeNode(7)
levelOrder(root)
