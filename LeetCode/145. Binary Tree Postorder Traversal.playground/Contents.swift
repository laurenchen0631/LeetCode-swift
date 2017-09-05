/*************************************************************************************
 Given a binary tree, return the postorder traversal of its nodes' values.
 
 For example:
 Given binary tree {1,#,2,3},
   1
    \
     2
    /
   3
 return [3,2,1].
 
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


func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    var stack: [TreeNode] = [root]
    var postorder: [Int] = []
    while !stack.isEmpty {
        let node = stack.popLast()!
        
        if node.left == nil, node.right == nil {
            postorder.append(node.val)
            continue
        }
        
        stack.append(TreeNode(node.val))
        if let rightChild = node.right {
            stack.append(rightChild)
        }
        if let leftChild = node.left {
            stack.append(leftChild)
        }
    }
    
    return postorder
}

let root = TreeNode(1)
root.right = TreeNode(2)
root.right?.left = TreeNode(3)
// root.left = TreeNode(4)
postorderTraversal(root)