/*************************************************************************************
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
        3
       / \
      9  20
     /  \
    15   7
 return its zigzag level order traversal as:
 [
 [3],
 [20,9],
 [15,7]
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


enum Direction: Int {
    case left = -1
    case right = 1
}

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var level = [root!]
    var res: [[Int]] = []
    var direction: Direction = .right
    while !level.isEmpty {
        var nextLevel: [TreeNode] = []
        var group: [Int] = Array(repeating: -1, count: level.count)
        for i in 0 ..< level.count {
            let node = level[i]
            if direction == .right {
                group[i] = node.val
            }
            else { 
                group[level.count - 1 - i] = node.val
            }
            
            if node.left != nil {
                nextLevel.append(node.left!)
            }
            if node.right != nil {
                nextLevel.append(node.right!)
            }
        }

        res.append(group)
        level = nextLevel
        direction = Direction(rawValue: -direction.rawValue)!
    }
    return res
}

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.left?.left = TreeNode(15)
root.left?.right = TreeNode(7)
zigzagLevelOrder(root)
