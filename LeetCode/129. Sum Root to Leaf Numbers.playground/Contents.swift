/*************************************************************************************
 Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
 
 An example is the root-to-leaf path 1->2->3 which represents the number 123.
 
 Find the total sum of all root-to-leaf numbers.
 
 For example,
 
 1
 / \
 2   3
 The root-to-leaf path 1->2 represents the number 12.
 The root-to-leaf path 1->3 represents the number 13.
 
 Return the sum = 12 + 13 = 25.
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



func isLeaf(_ root: TreeNode) -> Bool {
    return root.left == nil && root.right == nil;
}

func dfs(root: TreeNode, path: String, allPaths: inout [Int]) {
    let path = path + String(root.val)
    
    if isLeaf(root) {
        allPaths.append(Int(path)!)
    }
    
    if let leftChild = root.left {
        dfs(root: leftChild, path: path, allPaths: &allPaths)
    }
    if let rightChild = root.right {
        dfs(root: rightChild, path: path, allPaths: &allPaths)
    }
}

func sumNumbers(_ root: TreeNode?) -> Int {
    guard let node = root else {
        return 0
    }
    
    var nums: [Int] = []
    var path = ""
    dfs(root: node, path: path, allPaths: &nums)
    
    return nums.reduce(0, +)
}



let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)

sumNumbers(root)
