/******************************************************************
 Given a linked list, remove the nth node from the end of list and return its head.
 
 For example,
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 ********************************************************************/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */


// 1->2->3->4->5

// 1
//  ->2->3->4->5
//  ->2->3->4->5

// 1->2
//     ->3->4->5
//  ->2->3->4

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    // for find the nth element from the end in "one pass"
    
    var startNode = head
    // trick: 1 ... 0 is not allowed in swift, but for(i=0;i<n;i++) loops don't exist in Swift3 anymore
    if n > 1 {
        // we find the nth of the liinked list from head
        for _ in 1 ... n - 1 {
            startNode = startNode?.next
        }
    }

    // if n is larger than the length of linked list
    if startNode == nil {
        return head
    }
    // if the removed element is head
    else if startNode?.next == nil {
        return head?.next
    }
    
    // when we iterate the linked list from nth element to the tail
    // iterate the same linked list from the first element rather than nth element
    var linkedList = head
    var prevNode: ListNode? = nil
    while startNode?.next != nil {
        startNode = startNode?.next
    
        prevNode = linkedList
        linkedList = linkedList?.next
    }
    
    // when iteration stops, the next element of the unfinished linked list is the nth element from the end
    prevNode?.next = linkedList?.next
    
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
//
//let head: ListNode = ListNode(1)
//var node: ListNode? = head
//for i in 2...5 {
//    node?.next = ListNode(i)
//    node = node?.next
//}
//
//node = head
//while node != nil {
//    print(node!.val)
//    node = node?.next
//}
//
//node = removeNthFromEnd(head, 2)
//while node != nil {
//    print(node!.val)
//    node = node!.next
//}
