class TreeLinkNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
        self.next = None


# @param root, a tree link node
# @return nothing
def connect(root):
    """
    Populate each next pointer to point to its next right node.
    If there is no next right node, the next pointer should be set to NULL.

    Initially, all next pointers are set to NULL.

    Note:

    You may only use constant extra space.
    You may assume that it is a perfect binary tree
    (ie, all leaves are at the same level, and every parent has two children).
    """

    if not root:
        return
    while root.left:
        node = root
        while node:
            node.left.next = node.right
            if node.next:
                node.right.next = node.next.left
            node = node.next
        root = root.left
