/*************************************************************************************
 Given a singly linked list L: L0?L1?…?Ln-1?Ln,
 reorder it to: L0?Ln?L1?Ln-1?L2?Ln-2?…
 
 You must do this in-place without altering the nodes' values.
 
 For example,
 Given {1,2,3,4}, reorder it to {1,4,2,3}.
 **************************************************************************************/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func splitList(head: ListNode) -> ListNode {
    var slow = head
    var fast: ListNode? = head.next
    while fast?.next != nil {
        slow = slow.next!
        fast = fast!.next?.next
    }
    
    let middle = slow.next!
    slow.next = nil
    return middle
}

func reverseList(head: ListNode) -> ListNode {
    var newHead: ListNode? = nil
    var node: ListNode? = head
    while let currentNode = node {
        let nextNode = currentNode.next
        currentNode.next = newHead
        newHead = currentNode
        node = nextNode
    }
    
    return newHead!
}

func mergeList(_ a: ListNode, _ b: ListNode) {
    var pairHead: ListNode? = a
    var pairTail: ListNode? = b
    
    
    while pairHead != nil, pairTail != nil {
        let nextPairHead = pairHead!.next
        let nextPairTail = pairTail!.next

        pairHead!.next = pairTail
        pairTail!.next = nextPairHead
        pairHead = nextPairHead
        pairTail = nextPairTail
    }
}

func reorderList(_ head: ListNode?) {
    if head?.next == nil {
        return
    }
    
    let head = head!
    let middle = reverseList(head: splitList(head: head))
    mergeList(head, middle)
}

//let head = ListNode(0)
//head.next = ListNode(1)
//head.next?.next = ListNode(2)
//head.next?.next?.next = ListNode(3)
//head.next?.next?.next?.next = ListNode(4)
//
//reorderList(head)
//var node: ListNode? = head
//while node != nil {
//    print(node!.val)
//    node = node!.next
//}
