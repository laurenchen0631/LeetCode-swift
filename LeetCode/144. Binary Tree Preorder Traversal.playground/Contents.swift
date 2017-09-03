/*************************************************************************************
 Given a binary tree, return the preorder traversal of its nodes' values.
 
 For example:
 Given binary tree {1,#,2,3},
   1
    \
     2
    /
   3
 return [1,2,3].
 
 Note: Recursive solution is trivial, could you do it iteratively?
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

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    var toVisit = [root]
    var preorder: [Int] = []
    while !toVisit.isEmpty {
        let node = toVisit.popLast()!
        preorder.append(node.val)
        
        if let rightChild = node.right {
            toVisit.append(rightChild)
        }
        if let leftChild = node.left {
            toVisit.append(leftChild)
        }
    }
    
    return preorder
}

let root = TreeNode(1)
root.right = TreeNode(2)
root.right?.left = TreeNode(3)
root.left = TreeNode(4)

preorderTraversal(root)