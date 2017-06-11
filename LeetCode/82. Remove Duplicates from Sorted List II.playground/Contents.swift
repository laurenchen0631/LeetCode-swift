/*************************************************************************************
 Given a sorted linked list, delete all nodes that have duplicate numbers, 
 leaving only distinct numbers from the original list.
 
 For example,
 Given 1->2->3->3->4->4->5, return 1->2->5.
 Given 1->1->1->2->3, return 2->3.
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

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    let dummuyHead = ListNode(0)
    dummuyHead.next = head
    var pre = dummuyHead
    var cursor = head
    
    while cursor != nil {
        while cursor!.next != nil && cursor!.val == cursor!.next!.val {
            cursor = cursor!.next
        }
        
        if pre.next === cursor {
            pre = pre.next!
        }
        else {
            pre.next = cursor!.next
        }
        
        cursor = cursor!.next
    }
    
    return dummuyHead.next
}

var list: ListNode = ListNode(fromArray: [1])
var head = deleteDuplicates(list)
print(head?.description)
