/*************************************************************************************
 Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1...n.
 
 For example,
 Given n = 3, your program should return all 5 unique BST's shown below.
 
     1         3     3      2      1
      \       /     /      / \      \
       3     2     1      1   3      2
      /     /       \                 \
     2     1         2                 3
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

func generateTrees(_ n: Int) -> [TreeNode?] {
    guard n > 0 else {
        return []
    }
    
    func generate(from start: Int, to end: Int) -> [TreeNode?] {
//        print(start, end)
        if start == end - 1 {
            return [TreeNode(start)]
        }
        else if end <= start {
            return [nil]
        }
        
        var trees: [TreeNode] = []
        for root in start ..< end {
            for left in generate(from: start, to: root) {
                for right in generate(from: root+1, to: end) {
                    let rootNode = TreeNode(root)
                    rootNode.left = left
                    rootNode.right = right
                    trees.append(rootNode)
                }
            }
        }
        return trees
    }
    
    return generate(from: 1, to: n+1)
}

print(generateTrees(1))