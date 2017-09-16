/*************************************************************************************
 Sort a linked list using insertion sort.
 **************************************************************************************/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func insertionSortList(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }
    
    let dummyHead = ListNode(0)
    var cur: ListNode? = head
    var pre = dummyHead
    while let node = cur {
        // memorize the next node before the current node is inserted to other place
        let nextNode = node.next
        // find the right place to insert
        while pre.next != nil, pre.next!.val < node.val {
            pre = pre.next!
        }
        node.next = pre.next
        pre.next = node
        pre = dummyHead
        cur = nextNode
    }
    
    return dummyHead.next
}