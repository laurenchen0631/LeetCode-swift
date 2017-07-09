/*************************************************************************************
 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

var node: ListNode?

func sortedListToBST(_ head: ListNode?) -> TreeNode? {
    if head == nil {
        return nil
    }
    
    node = head!
    return helper(from: 0, to: getSize(head: head!))
}

func getSize(head: ListNode) -> Int {
    var node = head
    var length = 1
    while node.next != nil {
        length += 1
        node = node.next!
    }
    
    return length
}

func helper(from start: Int, to end: Int) -> TreeNode? {
    if start >= end {
        return nil
    }
    
    let mid = start + (end - start) / 2
    let leftChild = helper(from: start, to: mid)
    let root = TreeNode(node!.val)
    node = node?.next
    
    root.left = leftChild
    root.right = helper(from: mid + 1, to: end)
    
    return root
}


var head = ListNode(1)
head.next = ListNode(2)
head.next!.next = ListNode(3)

var root = sortedListToBST(head)
