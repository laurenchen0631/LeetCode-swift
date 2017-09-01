class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

def detect_cycle(head):
    """
    Given a linked list, return the node where the cycle begins.
    If there is no cycle, return null.
    Note: Do not modify the linked list.

    Follow up:
    Can you solve it without using extra space?
    """

    slow = head
    fast = head
    has_cycle = False

    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast:
            has_cycle = True
            break

    if not has_cycle:
        return None

    slow = head
    while slow != fast:
        slow = slow.next
        fast = fast.next

    return slow

head = ListNode(0)
head.next = ListNode(1)
head.next.next = ListNode(2)
head.next.next.next = ListNode(3)
head.next.next.next.next = head.next
node = detect_cycle(head)
print(node.val)
