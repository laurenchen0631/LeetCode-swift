/*************************************************************************************
 Sort a linked list in O(n log n) time using constant space complexity.
 **************************************************************************************/

class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(fromArray array: [Int]) {
        if array.count == 0 {
            self.val = 0
            self.next = nil
        }
        self.val = array.first!
        var currentNode = self
        
        for value in array.dropFirst() {
            let node = ListNode(value)
            currentNode.next = node
            currentNode = currentNode.next!
        }
    }
    
    public var description: String {
        var currentNode: ListNode? = self
        var desc = ""
        
        while currentNode != nil {
            desc += "\(currentNode!.val)"
            currentNode = currentNode!.next
            if currentNode != nil {
                desc += "->"
            }
        }
        
        return desc
    }
}

func splitList(head: ListNode) -> (ListNode, ListNode) {
    // p1 move 1 step every time, p2 move 2 step every time, pre record node before p1
    var p1 = head
    var p2: ListNode? = head
    var pre = head
    while p2 != nil, p2!.next != nil {
        pre = p1
        p1 = p1.next!
        p2 = p2?.next?.next
    }
    pre.next = nil
    
    return (head, p1)
}

func merge(_ listLeft: ListNode?, _ listRight: ListNode?) -> ListNode {
    guard let leftNode = listLeft else {
        return listRight!
    }
    guard let rightNode = listRight else {
        return listLeft!
    }
    
    if leftNode.val < rightNode.val {
        leftNode.next = merge(leftNode.next, rightNode)
        return leftNode
    }
    else {
        rightNode.next = merge(leftNode, rightNode.next)
        return rightNode
    }
}

func sortList(_ head: ListNode?) -> ListNode? {
    guard let node = head, node.next != nil else {
        return head
    }
    
    // splite list from middle
    let (listA, listB) = splitList(head: node)
    var sortedListLeft = sortList(listA)
    var sortedListRight = sortList(listB)
    
    return merge(sortedListLeft, sortedListRight)
}

let head = ListNode(fromArray: [5,4])
let node = sortList(head)
node?.description