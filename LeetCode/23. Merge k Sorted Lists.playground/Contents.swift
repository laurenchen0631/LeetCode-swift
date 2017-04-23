/******************************************************************
 Merge k sorted linked lists and return it as one sorted list. 
 Analyze and describe its complexity.
 ********************************************************************/

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count != 0 else {
        return nil
    }
    
    // store the lists into priority queue
    // the lower value has the higher priority
    var priorityQueue = SimplePriorityQueue(fromLists: lists)

    // then dequeue and store the node into a merge list until queue is empty
    let dummyHead: ListNode = ListNode(0)
    var currentNode = dummyHead
    while !priorityQueue.isEmpty {
        let minNode = priorityQueue.dequeue()
        currentNode.next = minNode
        currentNode = currentNode.next!
        
        // if the node is not the tail of that list
        // store the next element of that list to the queue
        if let nextNode = minNode.next {
            priorityQueue.enqueue(node: nextNode)
        }
    }
    
    return dummyHead.next
}

class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

struct SimplePriorityQueue {
    private var heap: Heap = Heap()
    
    init(fromLists lists: [ListNode?]) {
        for list in lists {
            if let node = list {
                enqueue(node: node)
            }
        }
    }
    
    public mutating func enqueue(node: ListNode) {
        heap.insert(node: node)
    }
    
    public mutating func dequeue() -> ListNode {
        return heap.remove()!
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
}

struct Heap {
    private var elements: [ListNode] = []
    
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    @inline(__always) private func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    @inline(__always) private func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }

    @inline(__always) private func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    public mutating func insert(node: ListNode) {
        elements.append(node)
        shiftUp()
    }
    
    public mutating func remove() -> ListNode? {
        if elements.isEmpty {
            return nil
        } else if elements.count == 1 {
            return elements.removeLast()
        } else {
            // Use the last node to replace the first one, then fix the heap by
            // shifting this new first node into its proper position.
            let node = elements[0]
            elements[0] = elements.removeLast()
            shiftDown()
            
            return node
        }
    }
    
    private mutating func shiftUp() {
        var childIndex = elements.count - 1
        let child = elements[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && child < elements[parentIndex] {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        elements[childIndex] = child
    }
    
    private mutating func shiftDown() {
        shiftDown(0, heapSize: elements.count)
    }
    
    private mutating func shiftDown(_ index: Int, heapSize: Int) {
        var parentIndex = index
        
        while true {
            let leftChildIndex = self.leftChildIndex(ofIndex: parentIndex)
            let rightChildIndex = leftChildIndex + 1
            
            // Figure out which comes first if we order them by the sort function:
            // the parent, the left child, or the right child. If the parent comes
            // first, we're done. If not, that element is out-of-place and we make
            // it "float down" the tree until the heap property is restored.
            var first = parentIndex
            if leftChildIndex < heapSize && elements[leftChildIndex] < elements[first] {
                first = leftChildIndex
            }
            if rightChildIndex < heapSize && elements[rightChildIndex] < elements[first] {
                first = rightChildIndex
            }
            if first == parentIndex {
                break
            }
            
            swap(&elements[parentIndex], &elements[first])
            parentIndex = first
        }
    }
}

extension ListNode {
    static func < (a: ListNode, b: ListNode) -> Bool {
        return a.val < b.val
    }
}