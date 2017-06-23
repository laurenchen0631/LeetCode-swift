/*************************************************************************************
 Given a binary tree, return the inorder traversal of its nodes' values.
 
 For example:
 Given binary tree
    1
   / \
  X   2
     /
    3
 
 return [1,3,2].
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

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    
    var inorder: [Int] = []
    var stack: [TreeNode] = []
    var currentNode = root
    while !stack.isEmpty || currentNode != nil {
        if let node = currentNode {
            stack.append(node)
            currentNode = node.left
        }
        else {
            let node = stack.popLast()!
            inorder.append(node.val)
            currentNode = node.right
        }
    }
    
    return inorder
}