class TreeLinkNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
        self.next = None

def connect(root):
    """
    Follow up for problem "116. Populating Next Right Pointers in Each Node".
    What if the given tree could be any binary tree? Would your previous solution still work?

    Note:
    You may only use constant extra space.
    """

    if not root:
        return

    next_level_start = root
    while next_level_start:
        node = next_level_start
        next_level_start = None
        pre = None
        while node:
            if node.left and node.right:
                node.left.next = node.right
                if pre:
                    pre.next = node.left
                pre = node.right

            elif node.left or node.right:
                child = node.right if node.right else node.left
                if pre:
                    pre.next = child
                pre = child

            if not next_level_start and pre:
                next_level_start = node.left if node.left else node.right

            node = node.next
