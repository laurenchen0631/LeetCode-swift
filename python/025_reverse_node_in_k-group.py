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


def reverse_kgroup(head, k):
    if k <= 1:
        return head

    length = get_length(head)
    if length < k:
        return head

    pre = dummy_head = ListNode(0)
    dummy_head.next = head
    group_head = head
    for _ in range(length//k):
        pre.next = reverse(group_head, k)
        pre = group_head
        group_head = pre.next
    return dummy_head.next


def get_length(head):
    length = 0
    node = head
    while node:
        length += 1
        node = node.next
    return length


def reverse(tail, k):
    reversed_head = tail
    node = tail.next
    for _ in range(k - 1):
        next_node = node.next
        node.next = reversed_head
        reversed_head = node
        node = next_node
    tail.next = node

    return reversed_head


x = ListNode([1, 2, 3, 4, 5])
head = reverse_kgroup(x, 0)
head.print_list()
