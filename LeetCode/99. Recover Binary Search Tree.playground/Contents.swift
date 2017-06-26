/*************************************************************************************
 Two elements of a binary search tree (BST) are swapped by mistake.
 
 Recover the tree without changing its structure.
 
 Note:
 A solution using O(n) space is pretty straight forward. Could you devise a constant space solution?
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

func recoverTree(_ root: TreeNode?) {
    var cur: TreeNode? = root
    var prev: TreeNode? = nil
    var first: TreeNode? = nil
    var second: TreeNode? = nil
    
    while let node = cur {
        // for each node, we compare it with prev node as we did in in-order-traversal
        if prev != nil, node.val <= prev!.val {
            if first == nil {
                first = prev
            }
            second = cur
        }
        
        // no left tree, then just visit its right tree
        if node.left == nil {
//            print(node.val)
            prev = node
            cur = node.right
        }
        else {
            // find predecessor
            var predecessor = node.left!
            while let rightChild = predecessor.right, rightChild !== node {
                predecessor = rightChild
            }
            
            //if predecessor has not been visited before, then we create a back edge from rightmost node
            if predecessor.right == nil {
                predecessor.right = node
                cur = node.left
            }
            // if predecessor has been visited before, then we are done with it
            else {
                predecessor.right = nil
//                print(node.val)
                prev = node
                cur = node.right
            }
        }
    }
    
    let tmp = first!.val
    first!.val = second!.val
    second!.val = tmp
}

var root = TreeNode(0)
root.left = TreeNode(1)
recoverTree(root)