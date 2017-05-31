class ListNode:
    def __init__(self, x):
        if type(x) is list and len(x) > 0:
            self.__create_from_list(x)
        else:
            self.val = x
            self.next = None

    def __create_from_list(self, arr):
        self.val = arr[0]
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


def add_two_numbers(l1, l2):
    carry = False
    dummyHead = ListNode(0)
    node = dummyHead
    while l1 or l2 or carry:
        sum = (
            (l1.val if l1 else 0)
            + (l2.val if l2 else 0)
            + (1 if carry else 0))
        carry = sum >= 10
        node.next = ListNode(sum % 10)
        node = node.next
        l1 = l1.next if l1 else l1
        l2 = l2.next if l2 else l2
    return dummyHead.next
