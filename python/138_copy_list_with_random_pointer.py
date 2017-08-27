class RandomListNode(object):
    def __init__(self, x):
        self.label = x
        self.next = None
        self.random = None

def copy_random_list(head):
    """
    A linked list is given such that each node contains an additional random
    pointer which could point to any node in the list or null.
    Return a deep copy of the list.
    """

    if not head:
        return None

    node_dict = {}
    node = head
    while node:
        node_dict[id(node)] = RandomListNode(node.label)
        node = node.next

    node = head
    while node:
        if node.next:
            node_dict[id(node)].next = node_dict[id(node.next)]
        if node.random:
            node_dict[id(node)].random = node_dict[id(node.random)]
        node = node.next*<F19>`
    
    return node_dict[id(head)]
