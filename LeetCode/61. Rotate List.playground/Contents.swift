/*************************************************************************************
 Given a list, rotate the list to the right by k places, where k is non-negative.
 
 For example:
 Given 1->2->3->4->5->NULL and k = 2,
 return 4->5->1->2->3->NULL.
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

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil else {
        return head
    }
    // k could be greater than list, so we need to modulo k with the length of the list
    let length = count(head: head!)
    let k = k % length
    if k == 0 {
        return head
    }
    
    // find the new head from the tail (shifting k nodes means kth node from the end is new head)
    let newHead = lastKNodes(head: head, k: k)
    
    // connect the list of new head with origin head
    // and break the link to the new head
    var node: ListNode? = newHead
    for _ in 0 ..< length - 1 {
        if node?.next == nil {
            node?.next = head
        }
        node = node?.next
    }
    node?.next = nil
    
    return newHead
}

func count(head: ListNode?) -> Int {
    var node = head
    var length = 0
    while node != nil {
        length += 1
        node = node?.next
    }
    return length
}

func lastKNodes(head: ListNode?, k: Int) -> ListNode {
    var dummyHead: ListNode? = head
    for _ in 0 ..< k - 1 {
        dummyHead = dummyHead?.next
    }
    var newHead = head
    while dummyHead?.next != nil {
        dummyHead = dummyHead?.next
        newHead = newHead?.next
    }
    return newHead!
}

var x = ListNode(fromArray: [1,2,3,4,5])
print(x.description)
var y = rotateRight(x, 7)
print(y?.description)