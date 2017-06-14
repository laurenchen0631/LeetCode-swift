/*************************************************************************************
 Given a linked list and a value x, partition it such that 
    all nodes less than x come before nodes greater than or equal to x.
 
 You should preserve the original relative order of the nodes in each of the two partitions.
 
 For example,
 Given 1->4->3->2->5->2 and x = 3,
 return 1->2->2->4->3->5.
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

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    guard head != nil else {
        return nil
    }
    
    let ltHead = ListNode(0)
    let gtHead = ListNode(0)
    var ltTail = ltHead
    var gtTail = gtHead
    
    var node = head
    while node != nil {
        if node!.val < x {
            ltTail.next = node!
            ltTail = node!
        }
        else {
            gtTail.next = node!
            gtTail = node!
        }
        node = node?.next
    }

    ltTail.next = gtHead.next
    gtTail.next = nil
    return ltHead.next
}

var head = partition(ListNode(fromArray: [1,2]), 3)
print(head?.description)