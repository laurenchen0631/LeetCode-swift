class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

def getIntersectionNode(self, headA, headB):
    """
    :type head1, head1: ListNode
    :rtype: ListNode
    """
    if not headA or not headB:
        return None

    pA = headA
    pB = headB

    while pA != pB:
        pA = headB if not pA else pA.next
        pB = headA if not pB else pB.next

    return pA
