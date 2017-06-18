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


def remove_nth_from_end(head, n):
    if n <= 0 or not head:
        return

    fakeHead = head
    for i in range(n):
        fakeHead = fakeHead.next

    dummyHead = ListNode(0)
    dummyHead.next = head
    node = dummyHead
    while fakeHead:
        fakeHead = fakeHead.next
        node = node.next
    node.next = node.next.next
    return dummyHead.next


head = ListNode([1])
remove_nth_from_end(head, 1)
