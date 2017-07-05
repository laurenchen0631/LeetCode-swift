/*************************************************************************************
 Given preorder and inorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree.
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

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
//    var index = 0
//    return buildTree(preorder, index: &index, inorder[0 ..< inorder.endIndex])
    return buildTreeHelper(preorder, inorder, 0, preorder.count - 1, 0, inorder.count - 1)
}

func buildTreeHelper(
    _ preorder: [Int], _ inorder: [Int],
    _ preStart: Int, _ preEnd: Int,
    _ inStart: Int, _ inEnd: Int
) -> TreeNode? {
    if preStart > preEnd || inStart > inEnd {
        return nil
    }
    
    var nodeVal = preorder[preStart]
    var node = TreeNode(nodeVal)
    

    var index = 0
    for i in inStart ... inEnd {
        if inorder[i] == nodeVal {
            index = i
            break
        }
    }

    let numLeftChildren = index - inStart
    node.left = buildTreeHelper(preorder, inorder, preStart + 1, preStart + numLeftChildren, inStart, index - 1)
    node.right = buildTreeHelper(preorder, inorder, preStart + numLeftChildren + 1, preEnd, index + 1, inEnd)
    return node
}
