/*************************************************************************************
 Given inorder and postorder traversal of a tree, construct the binary tree.
 
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

//       3
//      / \
//     9  20
//        / \
//       15  7
// inorder: [9, 3, 15, 20, 7]
// postorder: [9, 15, 7, 20, 3]
func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    return buildTree(inorder, 0, inorder.count - 1, postorder, 0, postorder.count - 1)
}

func buildTree(
    _ inorder: [Int], _ inorderStart: Int, _ inorderEnd: Int,
    _ postorder: [Int], _ postorderStart: Int, _ postorderEnd: Int
) -> TreeNode? {
    
    if postorderStart > postorderEnd {
        return nil
    }
    
    let val = postorder[postorderEnd];
    let node = TreeNode(val)
    var index: Int = 0
    for i in inorderStart ... inorderEnd {
        if inorder[i] == val {
            index = i
            break
        }
    }
    
    let numLeftChildren = index - inorderStart;
    node.left = buildTree(inorder, inorderStart, index - 1, postorder, postorderStart, postorderStart + numLeftChildren - 1)
    node.right = buildTree(inorder, index + 1, inorderEnd, postorder, postorderStart + numLeftChildren, postorderEnd - 1)
    return node
}

let root = buildTree([2, 1], [2, 1])
root?.val
root?.right?.val
root?.left?.val
root?.left?.left?.val
root?.left?.right?.val