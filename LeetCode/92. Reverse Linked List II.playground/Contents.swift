/*************************************************************************************
 Reverse a linked list from position m to n. Do it in-place and in one-pass.
 
 For example:
 Given 1->2->3->4->5->NULL, m = 2 and n = 4,
 
 return 1->4->3->2->5->NULL.
 
 Note:
 Given m, n satisfy the following condition:
 1 ≤ m ≤ n ≤ length of list.
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

func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    if head == nil || m == n {
        return head
    }
    
    let dummyHead = ListNode(0)
    dummyHead.next = head
    var node: ListNode? = dummyHead
    for _ in 0 ..< m - 1 {
        node = node?.next
    }
    
    let fixedTail = node
    let reversedTail = node!.next
    var reversedHead = reversedTail
    node = node?.next?.next
    for _ in 0 ..< n - m {
        let nextNode = node?.next
        node?.next = reversedHead
        reversedHead = node
        node = nextNode
    }

    reversedTail!.next = node
    fixedTail!.next = reversedHead
    
    return dummyHead.next
}


var list = ListNode(fromArray: [1, 2, 3])
let head = reverseBetween(list, 1, 2)
print(head?.description)
