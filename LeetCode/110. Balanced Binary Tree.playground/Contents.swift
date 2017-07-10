/*************************************************************************************
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as a binary tree 
 in which the depth of the two subtrees of every node never differ by more than 1.
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

let UNBALANCED = -1

func isBalanced(_ root: TreeNode?) -> Bool {
    return getHeight(root) != UNBALANCED
}

func getHeight(_ root: TreeNode?) -> Int {
    
    guard let node = root else {
        return 0
    }
    
    let leftSubtreeHeight = getHeight(node.left)
    if leftSubtreeHeight == UNBALANCED {
        return UNBALANCED
    }
    let rightSubtreeHeight = getHeight(node.right)
    if rightSubtreeHeight == UNBALANCED {
        return UNBALANCED
    }
    
    if abs(leftSubtreeHeight - rightSubtreeHeight) > 1 {
        return UNBALANCED
    }
    return 1 + max(leftSubtreeHeight, rightSubtreeHeight)
}

let root = TreeNode(1)
root.right = TreeNode(2)
root.right?.right = TreeNode(3)
isBalanced(root)