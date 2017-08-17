from collections import deque

class UndirectedGraphNode:
    def __init__(self, x):
        self.label = x
        self.neighbors = []

def clone_graph(self, node):
    if not node:
        return None

    root = UndirectedGraphNode(node.label)
    visted = {root.label: root}

    to_visit = deque([node])

    while to_visit:
        front_node = deque.popleft()
        for neighbor in front_node.neighbors:
            if neighbor not in visted:
                visted[neighbor.label] = neighbor
                to_visit.append(neighbor)
            visted[front_node].neighbors.append(visted[neighbor])
    return root
