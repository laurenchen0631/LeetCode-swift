def has_cycle(head):
    slow = head
    fast = head

    # fast runner move 2 steps at one time while slow runner move 1 step,
    # if traverse to a null, there must be no loop
    while fast and fast.next:
        slow = head.next
        fast = fast.next.next
        if slow == fast:
            return True
    return False
