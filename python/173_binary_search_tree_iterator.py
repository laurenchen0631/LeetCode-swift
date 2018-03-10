# Definition for a  binary tree node
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class BSTIterator:
    """
    next() and hasNext() should run in average O(1) time and uses O(h) memory,
    where h is the height of the tree.
    """
    def __init__(self, root):
        """
        :type root: TreeNode
        """
        _root = root
        self.__stack = []
        while _root:
            self.__stack.append(_root)
            _root = _root.left
        
    
    def hasNext(self):
        """
        :rtype: bool
        """
        return len(self.__stack) > 0

        

    def next(self):
        """
        Calling next() will return the next smallest number in the BST.
        :rtype: int
        """
        node = self.__stack.pop()
        root = node.right
        while root:
            self.__stack.append(root)
            root = root.left
        return node.val
        

# Your BSTIterator will be called like this:
# i, v = BSTIterator(root), []
# while i.hasNext(): v.append(i.next())
