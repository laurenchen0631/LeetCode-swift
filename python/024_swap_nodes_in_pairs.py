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


def swap_pairs(head):
    if not head or head.next is None:
        return head

    dummy_head = ListNode(0)
    dummy_head.next = head
    pre = dummy_head

    while pre.next and pre.next.next:
        a = pre.next
        b = a.next
        pre.next, a.next, b.next = b, b.next, a
        pre = a
    return dummy_head.next


head = swap_pairs(ListNode([1,2]))
head.print_list()
