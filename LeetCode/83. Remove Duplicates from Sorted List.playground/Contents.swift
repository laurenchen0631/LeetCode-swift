/*************************************************************************************
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 For example,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.
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
//    if head == nil {
//        return head
//    }
//    
//    var node = head
//    while node != nil {
//        var cursor = node?.next
//        while cursor != nil && cursor?.val == node?.val {
//            cursor = cursor?.next
//        }
//        node?.next = cursor
//        node = node?.next
//    }
//    
//    return head
    
     if head == nil || head?.next == nil {
         return head
     }
    
     var pre = head!
     var cursor = head!.next
     while cursor != nil {
         if pre.val != cursor!.val {
             pre.next = cursor
             pre = pre.next!
         }
         cursor = cursor?.next
     }
     pre.next = nil
    
     return head
}

var list = ListNode(fromArray: [3])
var head = deleteDuplicates(list)
print(head?.description)
