/********************************************************************
 Given a linked list, swap every two adjacent nodes and return its head.
 
 For example,
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 
 Your algorithm should use only constant space. 
 You may not modify the values in the list, only nodes itself can be changed.
*********************************************************************/


func swapPairs(_ head: ListNode?) -> ListNode? {
    
    guard head != nil, head?.next != nil else {
        return head
    }
    
    // find a pair of nodes unitl no more node can be paired
    let dummyHead = ListNode(0)
    var currentNode = head
    var pairTail = dummyHead
    while let aNode = currentNode, let bNode = currentNode?.next {
        swap(a: aNode, b: bNode)
        // a->b->c becomes b->a->c
        currentNode = aNode.next
        
        // connect the swap pair to the previous pair
        pairTail.next = bNode
        pairTail = aNode
    }
    
    return dummyHead.next
}

func swap(a: ListNode, b: ListNode) {
    a.next = b.next
    b.next = a
}

class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

