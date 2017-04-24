/*************************************************************************************
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 
 k is a positive integer and is less than or equal to the length of the linked list.
 If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
 
 You may not alter the values in the nodes, only nodes itself may be changed.
 
 Only constant memory is allowed.
 
 For example,
 Given this linked list: 1->2->3->4->5
 
 For k = 2, you should return: 2->1->4->3->5
 
 For k = 3, you should return: 3->2->1->4->5
 **************************************************************************************/

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard k > 1 else {
        return head
    }
    
    let dummyHead = ListNode(0)
    var kTail = head
    var kHead = head
    var prevReversed = dummyHead
    while true {
        
        // choose the first k elements
        for _ in 0 ..< k-1 {
            kTail = kTail?.next
        }
        
        // when exceed the length of list
        guard var reversedHead = kTail else {
            prevReversed.next = kHead
            break
        }
        
        // split the k elements with the remained list
        let reversedTail = kHead!
        kHead = reversedHead.next
        reversedHead.next = nil
        kTail = kHead
        
        // reverse the k elements then hook it to the previous list
        reversedHead = reverse(head: reversedTail)
        prevReversed.next = reversedHead
        prevReversed = reversedTail
    }
    
    return dummyHead.next
}

// 1->2->3->4
// 1
// 2->1
// 3->2->1
// 4->3->2->1
func reverse(head: ListNode) -> ListNode {
    var currentNode = head.next
    var reversedList = head
    
    while currentNode != nil {
        let tmp = currentNode!
        currentNode = currentNode?.next
        
        tmp.next = reversedList
        reversedList = tmp
    }
    head.next = nil
    
    return reversedList
}

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

//let head = ListNode(fromArray: [1,2,3,4])
//head.description

let head = reverseKGroup(ListNode(fromArray: [1,2,3,4]), 2)
head?.description



