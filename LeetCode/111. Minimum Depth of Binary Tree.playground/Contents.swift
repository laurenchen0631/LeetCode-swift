/*************************************************************************************
 Given a binary tree, find its minimum depth.
 
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
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

func minDepth(_ root: TreeNode?) -> Int {
    guard let node = root else {
        return 0
    }
    var level = [node]
    var depth = 0
    
    while !level.isEmpty {
        depth += 1
        var nextLevel: [TreeNode] = []
        
        for i in 0 ..< level.count {
            let node = level[i]
            if node.left == nil, node.right == nil {
                return depth
            }
            if let leftChild = node.left {
                nextLevel.append(leftChild)
            }
            if let rightChild = node.right {
                nextLevel.append(rightChild)
            }
        }
        level = nextLevel
    }
    
    return depth
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.right?.right = TreeNode(5)
minDepth(root)