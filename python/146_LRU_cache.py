class Node:
    def __init__(self, key, value):
        self.__key = key
        self.value = value
        self.__pre = None
        self.__next = None

    @property
    def key(self):
        return self.__key

    @property
    def pre(self):
        return self.__pre

    @pre.setter
    def pre(self, node):
        if type(node) is Node:
            self.__pre = node
    
    @property
    def next(self):
        return self.__next

    @next.setter
    def next(self, node):
        if type(node) is Node:
            self.__next = node
            

class LRUCache:
    """
    Design and implement a data structure for Least Recently Used (LRU) cache.
    It should support the following operations: get and put.

    get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
    put(key, value) - Set or insert the value if the key is not already present.
        When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

    Follow up:
    Could you do both operations in O(1) time complexity?
    """

    def __init__(self, capacity):
        """
        :type capacity: int
        """
        self.__capacity = capacity
        self.__hash_map = {}
        self.__head = Node(0, 0)
        self.__tail = Node(0, 0)
        self.__head.next = self.__tail
        self.__head.pre = None
        self.__tail.pre = self.__head
        self.__tail.next = None

        self.__size = 0

    def __delete_node(self, node):
        node.pre.next = node.next
        node.next.pre = node.pre

    def __add_node_front(self, node):
        node.next = self.__head.next
        node.next.pre = node
        node.pre = self.__head
        self.__head.next = node
        

    def get(self, key):
        """
        :type key: int
        :rtype: int
        """
        if key in self.__hash_map:
            node = self.__hash_map.get(key)
            result = node.value
            self.__delete_node(node)
            self.__add_node_front(node)
            return result

        return -1
        

    def put(self, key, value):
        """
        :type key: int
        :type value: int
        :rtype: void
        """
        if key in self.__hash_map:
            node = self.__hash_map.get(key)
            node.value = value
            self.__delete_node(node)
            self.__add_node_front(node)
        else:
            node = Node(key, value)
            self.__hash_map[key] = node
            if self.__size < self.__capacity:
                self.__size += 1
                self.__add_node_front(node)
            else:
                last_node = self.__tail.pre
                del self.__hash_map[last_node.key]
                self.__delete_node(last_node)
                self.__add_node_front(node)
