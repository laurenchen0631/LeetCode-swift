// : Playground - noun: a place where people can play

import UIKit

/**
 * Reverse digits of an integer.
 * Example1: x = 123, return 321
 * Example2: x = -123, return -321
 */

func reverse(x: Int) -> Int {

	var num = 0;
	var x = x
	while (x != 0) {
		num = num * 10 + x % 10;
		x = x / 10;
	}

	return num;
}

reverse(x: 1534236469)
reverse(x: -123)
