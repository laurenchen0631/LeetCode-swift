class MinStack:

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.min = None
        self.stack = []

    def push(self, x):
        """
        :type x: int
        :rtype: void
        """
        if not self.stack:
            self.stack.append(0)
            self.min = x
        else:
            # Could be negative if min value needs to change
            self.stack.append(x - self.min)
            if self.min > x:
                self.min = x

    def pop(self):
        """
        :rtype: void
        """
        if not self.stack:
            return None
        value = self.stack.pop()
        if value < 0:
            self.min -= value

    def top(self):
        """
        :rtype: int
        """
        if self.stack[-1] >= 0:
            return self.stack[-1] + self.min
        return self.min

    def getMin(self):
        """
        :rtype: int
        """
        return self.min


# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()
