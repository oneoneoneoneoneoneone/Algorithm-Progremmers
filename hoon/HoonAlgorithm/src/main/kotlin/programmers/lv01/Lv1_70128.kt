package main.kotlin.programmers.lv01

/**
 *
 * https://school.programmers.co.kr/learn/courses/30/lessons/70128
 *
 * 문제 설명
 * 길이가 같은 두 1차원 정수 배열 a, b가 매개변수로 주어집니다.
 * a와 b의 내적을 return 하도록 solution 함수를 완성해주세요.
 *
 * 이때, a와 b의 내적은 a[0]*b[0] + a[1]*b[1] + ... + a[n-1]*b[n-1] 입니다. (n은 a, b의 길이)
 *
 * 제한사항
 * a, b의 길이는 1 이상 1,000 이하입니다.
 * a, b의 모든 수는 -1,000 이상 1,000 이하입니다.
 * 입출력 예
 * a	        b	            result
 * [1,2,3,4]	[-3,-1,0,2]	    3
 * [-1,0,1]	    [1,0,-1]	    -2
 *
 * 입출력 예 설명
 * 입출력 예 #1
 * a와 b의 내적은 1*(-3) + 2*(-1) + 3*0 + 4*2 = 3 입니다.
 *
 * 입출력 예 #2
 * a와 b의 내적은 (-1)*1 + 0*0 + 1*(-1) = -2 입니다.
 */

fun main() {
    solution(intArrayOf(1,2,3,4), intArrayOf(-3,-1,0,2))
}

private fun solution(a: IntArray, b: IntArray): Int {
    var answer: Int = 0
    for (i in a.indices) {
        answer += a[i] * b[i]
    }
    return answer
}