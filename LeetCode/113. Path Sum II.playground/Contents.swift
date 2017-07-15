/*************************************************************************************
 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
-
 For example:
 Given the below binary tree and sum = 22,
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 return
 [
 [5,4,11,2],
 [5,8,4,5]
 ]
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

func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    var tmp: [Int] = []
    var res: [[Int]] = []
    pathSum(root, target: sum, path: tmp, output: &res)
    return res
}

func pathSum(_ root: TreeNode?, target: Int, path tmp: [Int], output res: inout [[Int]]) {
    guard let node = root else {
        return
    }
    
    let path = tmp + [node.val]
    if node.left == nil, node.right == nil {
        if target == node.val {
            res.append(path)
        }
        return
    }
    
    pathSum(node.left, target: target - node.val, path: path, output: &res)
    pathSum(node.right, target: target - node.val, path: path, output: &res)
}

let root = TreeNode(5)
root.left = TreeNode(4)
root.right = TreeNode(1)
root.right?.left = TreeNode(3)

pathSum(root, 9)