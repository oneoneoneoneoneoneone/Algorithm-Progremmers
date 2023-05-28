//
//  ShortestPath.swift
//  Algorithm
//
//  Created by hana on 2023/05/24.
//
///문제: 방향그래프가 주어지면 주어진 시작점에서 다른 모든 정점으로의 최단 경로를 구하라. 단, 모든 간선의 가중치는 10 이하의 자연수
///입력: 첫째 줄에 정점의 개수 V와 간선의 개수 E (1 ≤ V ≤ 20,000, 1 ≤ E ≤ 300,000), 둘째 줄에 시작 정점의 번호 K(1 ≤ K ≤ V), 셋째 줄부터 N개의 줄에 각 간선을 나타내는 세 개의 정수
/// (u, v, w) - u에서 v로 가는 가중치 w인 간선이 존재 (u != v, 0 ≤ w ≤10), 서로 다른 두 정점 사이에 여러 개의 간선이 존재할 수도 있음에 유의
///출력: 첫째 줄부터 V개의 줄에 K 정점 부터 각 정점으로의 최단 경로값 출력
/// K 자신은 0 출력, 경로가 존재하지 않는 경우에 INF 출력
///풀이: queue - 시간초과 (EV), 다익스트라/우선순위큐 - ElogV
///시간복잡도:

import Foundation

func solution_1753(_ v: Int, _ k: Int, _ graph: [[Int]]) -> [Int]{
    var d = [Int](repeating: Int.max, count: v + 1)
    var queue: [Int] = []
    d[k] = 0
    queue.append(k)
    
    while !queue.isEmpty{
        let node = queue.removeFirst()
        
        graph.filter{$0[0] == node}.forEach{
            d[$0[1]] = min(d[$0[1]], d[node] + $0[2])
        }
        queue.append(contentsOf: graph.filter{$0[0] == node}.map{$0[1]}.sorted{abs(node - $0) < abs(node - $1)})
        print(graph.filter{$0[0] == node}.map{$0[1]}.sorted{abs(node - $0) < abs(node - $1)})
    }
    
    return d[1...v].map{$0}
}

let inputVE = readLine()!.split(separator: " ").map{Int(String($0))!}
let inputK = Int(readLine()!)!

var graph: [[Int]] = []
for _ in 0..<inputVE[1]{
    graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

solution_1753(inputVE[0], inputK, graph).forEach{
    print($0 == Int.max ? "INF" : $0)
}

//5, 1, [[5,1,1],[1,2,2],[1,3,3],[2,3,4],[2,4,5],[3,4,6]]
