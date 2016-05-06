// : Playground - noun: a place where people can play

import UIKit

/**
 * You are given two linked lists representing two non-negative numbers.
 * The digits are stored in reverse order and each of their nodes
 * contain a single digit.
 * Add the two numbers and return it as a linked list.

 * Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 * Output: 7 -> 0 -> 8
 */

public class ListNode {
	public var val: Int
	public var next: ListNode?
	init (_ val: Int) {
		self.val = val
		self.next = nil
	}
}
//print(30 % 7)

func addTwoNumbers(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
	return addTwoNumber(l1, l2, false)
}

func addTwoNumber(l1: ListNode?, _ l2: ListNode?, _ carry: Bool) -> ListNode? {

	if l1 == nil && l2 == nil {
		return carry ? ListNode(1) : nil
	}

	let value1 = l1 != nil ? l1!.val : 0
	let value2 = l2 != nil ? l2!.val : 0

	let sum = value1 + value2 + (carry ? 1 : 0)
	let head: ListNode = ListNode(sum % 10)
	head.next = addTwoNumber(l1!.next, l2!.next, sum >= 10)

	return head
}

let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)

let x = addTwoNumbers(l1, l2)
x?.next?.next?.val
