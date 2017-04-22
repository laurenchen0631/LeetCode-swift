/******************************************************************
 Merge two sorted linked lists and return it as a new list. 
 The new list should be made by splicing together the nodes of the first two lists.
 ********************************************************************/


func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    // create the head of merged list
    if l1 == nil || l2 == nil {
        return l1 ?? l2
    }
    let head = l1!.val < l2!.val ? l1 : l2

    var nodeA = head === l1 ? l1!.next : l1
    var nodeB = head === l2 ? l2!.next : l2
    var currentNode = head
    // go through the two list unitl one of list
    while nodeA != nil && nodeB != nil {
        // put the min one of l1 and l2 to the new list
        if nodeA!.val < nodeB!.val {
            currentNode?.next = nodeA
            nodeA = nodeA!.next
        }
        else {
            currentNode?.next = nodeB
            nodeB = nodeB!.next
        }
        
        
        currentNode = currentNode!.next
    }

    currentNode!.next = nodeA ?? nodeB
    
    return head
}

class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

mergeTwoLists(ListNode(3), ListNode(1))
