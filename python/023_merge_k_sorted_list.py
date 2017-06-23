import heapq


# can't exist duplicate value
def mergeKList(lists):
    if not lists:
        return []
    dummy_head = ListNode(0)
    heap = [(head.val, head) for head in lists if head]
    heapq.heapify(heap)
    node = dummy_head
    while heap:
        (_, min_node) = heapq.heappop(heap)
        node.next = min_node
        node = node.next
        if min_node.next:
            heapq.heappush
            heapq.heappush(heap, (min_node.next.val, min_node.next))
    return dummy_head.next


class ListNode:
    def __init__(self, x):
        if type(x) is list and len(x) > 0:
            self.__create_from_list(x)
        else:
            self.val = x
            self.next = None

    def __create_from_list(self, arr):
        self.val = arr[0]
        self.next = None
        node = self
        for i in range(1, len(arr)):
            node.next = ListNode(arr[i])
            node = node.next

    def print_list(self):
        node = self
        data = []
        while node:
            data.append(str(node.val))
            node = node.next
        print("->".join(data))


class MinHeap:
    def __init__(self, arr):
        self.__data = arr
        for i in reversed(range(len(arr)//2)):
            self.__sift_down(i)

    def __len__(self):
        return len(self.__data)

    def __sift_up(self, index):
        parent_index = self.__parent(index)
        while index > 0 and self.__data[index].val < self.__data[parent_index].val:
            (self.__data[index], self.__data[parent_index]) = (
                self.__data[parent_index], self.__data[index])
            index = parent_index
            parent_index = self.__parent(index)

    def __sift_down(self, index):
        while True:
            min_index = index
            left_index = self.__left_child(index)
            if (left_index < len(self) and
                    (self.__data[left_index].val < self.__data[min_index].val)):
                min_index = left_index

            right_index = self.__right_child(index)
            if (right_index < len(self) and
                    (self.__data[right_index].val < self.__data[min_index].val)):
                min_index = right_index

            if min_index == index:
                break

            (self.__data[index], self.__data[min_index]) = (
                self.__data[min_index], self.__data[index])
            index = min_index

    def __parent(self, index):
        return (index - 1)//2

    def __left_child(self, index):
        return 2*index + 1

    def __right_child(self, index):
        return 2*index + 2

    def extract_min(self):
        if len(self) == 1:
            return self.__data.pop()
        min_node = self.__data[0]
        self.__data[0] = self.__data.pop()
        self.__sift_down(0)
        return min_node

    def append(self, node):
        self.__data.append(node)
        self.__sift_up(len(self) - 1)


def merge_k_list(lists):
    dummy_head = ListNode(0)
    min_heap = MinHeap([head for head in lists if head])
    node = dummy_head

    while len(min_heap):
        min_node = min_heap.extract_min()
        node.next = min_node
        node = node.next
        if min_node.next:
            min_heap.append(min_node.next)

    return dummy_head.next


a = ListNode([1, 3, 5, 6, 7])
b = ListNode([-2, 1, 4, 9, 20])
c = ListNode([8])
head = mergeKList([a, b, c])
head.print_list()
