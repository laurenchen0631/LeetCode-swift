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


def merge(l1, l2):
    dummy_head = ListNode(0)
    node = dummy_head
    while l1 and l2:
        if l1.val < l2.val:
            node.next = l1
            l1 = l1.next
        else:
            node.next = l2
            l2 = l2.next
        node = node.next
    node.next = l1 if l1 else l2
    return dummy_head.next


a = ListNode([1,3,5,6])
b = ListNode([2,4,6,8])
head = merge(a,b)
head.print_list()
