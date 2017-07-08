/*************************************************************************************
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
        3
       / \
      9  20
        /  \
       15   7
 return its bottom-up level order traversal as:
 [
 [15,7],
 [9,20],
 [3]
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

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    levelOrderBottomHelper(root: root, height: 0, output: &res)
    return res
}

func levelOrderBottomHelper(root: TreeNode?, height level: Int, output res: inout [[Int]]) {
    guard let node = root else {
        return
    }
    
    if level + 1 > res.count {
        res.insert([], at: 0)
    }
    
    levelOrderBottomHelper(root: node.left, height: level + 1, output: &res)
    levelOrderBottomHelper(root: node.right, height: level + 1, output: &res)
    res[res.count - 1 - level].append(node.val)
}

var root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

print(levelOrderBottom(root))