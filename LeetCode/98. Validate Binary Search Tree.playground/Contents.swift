/*************************************************************************************
 Given a binary tree, determine if it is a valid binary search tree (BST).
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 Example 1:
      2
     / \
    1   3
 Binary tree [2,1,3], return true.
 Example 2:
      1
     / \
    2   3
 Binary tree [1,2,3], return false.
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

func isValidBST(_ root: TreeNode?) -> Bool {
    
    // inorder traversal tree
    var inorder: [Int] = []
    inorderTraversal(root: root, output: &inorder)
    
    
    // check the result of inorder traversal is sorted correctly
    if inorder.count < 2 {
        return true
    }
    for i in 1 ..< inorder.count {
        if inorder[i-1] >= inorder[i] {
            return false
        }
    }
    return true
}

func inorderTraversal(root: TreeNode?, output result: inout [Int]) {
    guard let node = root else { return }
    
    inorderTraversal(root: node.left, output: &result)
    result.append(node.val)
    inorderTraversal(root: node.right, output: &result)
}


let root = TreeNode(2)
root.left = TreeNode(1)
root.right = TreeNode(3)
isValidBST(root)
