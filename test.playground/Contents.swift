import UIKit

var str = "Hello, playground"

func isWeird(n: Int) -> Void {
    if n % 2 == 1 {
        print("Weird")
    } else if (n % 2 == 0) && (2 <= n && n <= 5) {
        print("Not Weird")
    } else if (n % 2 == 0) && (6 <= n && n <= 20) {
        print ("Weird")
    } else if (n % 2 == 0) && (n > 20) {
        print ("Not Weird")
    }
}

//isWeird(n: 3)

func isWeird2(n: Int) -> Void {
    if (n % 2 == 1) {
        print ("Weird")
    } else {
        switch n {
        case 2...5, 20...100:
            print("Not Weird")
        case 6...20:
            print("Weird")
        default:
            print("The given argument is not bound by the constraint")
        }
    }
}

//isWeird2(n: 24)
//isWeird2(n: 3)
//isWeird2(n: 5)
//    switch n {
//    case let x where x % 2 == 1:
//        print("Weird")
//    case let x where (x % 2 == 0) && (x in 2...5):
//        print("Not Weird")
//    case let x where (x % 2 == 0) && 6...20:
//        print ("Weird")
//    case let x where (x % 2 == 0) && x > 20:
//        print("Not Weird")
//    }
//}

//print(Int.random(in: 1...100))


func uniqueMorseRepresentations(_ words: [String]) -> Int {
    let morseCode = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

    var morseSet = Set<String>()
    
    for word in words {
        var morseWord = ""
        for c in word {
            let num = Int(c.unicodeScalars.first!.value) - 97
            morseWord += morseCode[num]
        }
        morseSet.insert(morseWord)
    }
    
    return morseSet.count
}

func uniqueMorseRepresentations1(_ words: [String]) -> Int {
    let morse = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    var result = Set<String>()
    for word in words {
        var curr = ""
        for c in word {
            let num = Int(c.unicodeScalars.first!.value) - 97
            curr += morse[num]
        }
        result.insert(curr)
    }
    return result.count
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


//    Input: [1,null,2,3]
//    1
//     \
//      2
//     /
//    3
//
//    Output: [1,2,3]

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    var stack = [TreeNode]()
    var result = [Int]()
    
    stack.append(root)
    while !stack.isEmpty {
        let node = stack.removeLast()
        result.append(node.val)
        if let rightNode = node.right {
            stack.append(rightNode)
        }
        if let leftNode = node.left {
            stack.append(leftNode)
        }
    }
    return result
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    var stack = [TreeNode]()
    var result = [Int]()
    var current = root
    
    stack.append(root)
    while !stack.isEmpty {
        
        let node = stack.removeLast()
        current = stack.removeLast()
        
        if let leftNode = node.left {
            stack.append(leftNode)
        } else {
            result.append(node.val)
        }
        
        if let rightNode = current.right {
            stack.append(rightNode)
        } else {
            result.append(node.val)
        }
        
    }
    return result
    
//    // use a stack
//    var stack = [TreeNode]()
//    var ans = [Int]()
//    var node = root
//    while node != nil || !stack.isEmpty {
//        // go to left
//        while node != nil {
//            stack.append(node!)
//            node = node!.left
//        }
//        // now node == nil, pop from stack, get the inorder
//        node = stack.removeLast()
//        ans.append(node!.val)
//        node = node!.right
//    }
//    return ans
}




func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    
    for element in A {
        let flipped = element.reversed().map { 1 - $0 } // flip bits
        result.append(flipped)
    }
    return result
}

// flipAndInvertImage([[1,1,0],[1,0,1],[0,0,0]])

//    Input: [[1,1,0],[1,0,1],[0,0,0]]
//    Output: [[1,0,0],[0,1,0],[1,1,1]]

//    Input: [[1,2,3],[4,5,6],[7,8,9]]
//    Output: [[1,4,7],[2,5,8],[3,6,9]]

//    Input: [[1,2,3],[4,5,6]]
//    Output: [[1,4],[2,5],[3,6]]


//func naiveHash(_ string: String) -> Int {
//    let unicodeScalars = string.unicodeScalars.map { Int($0.value) }
//    return unicodeScalars.reduce(0, +)
//}
//
//naiveHash("abc")
//
//
////  sourced from https://gist.github.com/kharrison/2355182ac03b481921073c5cf6d77a73#file-country-swift-L31
//func djb2Hash(_ string: String) -> Int {
//    let unicodeScalars = string.unicodeScalars.map { $0.value }
//    return unicodeScalars.reduce(5381) {
//        ($0 << 5) &+ $0 &+ Int($1)
//    }
//}
//
//djb2Hash("abc") // outputs 193485963
//djb2Hash("bca") // outputs 193487083
//djb2Hash("firstName") % 2
//djb2Hash("lastName") % 2

//let x = hashTable["lastName"]


//public struct HashTable<Key: Hashable, Value> {
//    private typealias Element = (key: Key, value: Value)
//    private typealias Bucket = [Element]
//    private var buckets: [Bucket]
//
//    private(set) public var count = 0
//    public var isEmpty: Bool {
//        return count == 0
//    }
//
//    public init(capacity: Int) {
//        assert(capacity > 0)
//        buckets = Array<Bucket>(repeating: [], count: capacity)
//    }
//
//    private func index(for key: Key) -> Int {
//        return abs(key.hashValue) % buckets.count
//    }
//
//    // 1
//    public subscript(key: Key) -> Value? {
//        get {
//            return value(for: key)
//        }
//    }
//
//    // 2
//    public func value(for key: Key) -> Value? {
//        let index = self.index(for: key)
//        return buckets[index].first { $0.key == key }?.value
//    }
//}



//func findTheDifference(_ s: String, _ t: String) -> Character {
//    for char in t {
//        if !s.contains(char) {
//            return char
//        }
//    }
//}

//findTheDifference("abcd", "abcde")

let s = "abcd"
print(s)


let baseUrl = "https://helloworld.com"
let url = baseUrl + "/496959_YZsRBY7MB7h6NFekPAHticVS5rNpkof0rtH5uJEBOEI.jpg"
print(url)


print(arc4random())
print(arc4random_uniform(4))
let number = Int.random(in: 0 ..< 2)
print(number)

let words = ["", "hello", "", "world"]
print(words.compactMap { $0 })
print(words.filter { $0 != ""})

print(words.isEmpty)

