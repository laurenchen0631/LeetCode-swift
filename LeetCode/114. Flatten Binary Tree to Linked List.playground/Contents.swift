/*************************************************************************************
 Given a binary tree, flatten it to a linked list in-place.
 
 For example,
 Given
 
     1
    / \
   2   5
  / \   \
 3   4   6
 The flattened tree should look like:
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
 
 Hints:
 If you notice carefully in the flattened tree, each node's right child points to the next node of a pre-order traversal.
 
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

func flatten(_ root: TreeNode?) {
    var cur = root
    while let node = cur {
        if node.left != nil {
            var predecessor = node.left!
            while let rightChild = predecessor.right {
                predecessor = rightChild
            }
            predecessor.right = node.right
            node.right = node.left
            node.left = nil
        }
        cur = node.right
    }
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(5)

root.left?.left = TreeNode(3)
root.left?.right = TreeNode(4)
root.right?.right = TreeNode(6)

flatten(root)

var cur: TreeNode? = root
while let node = cur {
    print(node.val)
    cur = node.right
}