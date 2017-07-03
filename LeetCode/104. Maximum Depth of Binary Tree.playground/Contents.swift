/*************************************************************************************
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
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

func maxDepth(_ root: TreeNode?) -> Int {
//    guard let r = root else {
//        return 0
//    }
//    
//    return max(maxDepth(r.left) + 1, maxDepth(r.right) + 1)
    if root == nil {
        return 0
    }
    
    var level = [root!]
    var height = 0
    while level.count > 0 {
        height += 1
        var nextLevel: [TreeNode] = []
        for node in level {
            if let leftChild = node.left {
                nextLevel.append(leftChild)
            }
            if let rightChild = node.right {
                nextLevel.append(rightChild)
            }
        }
        level = nextLevel
    }
    
    return height
}