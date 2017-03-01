//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
 * 数组(Arrays)
 * 1st, March, 2017
 * 特点： 有序存储同一类型的多个值
 * 可以创建混合数据类型的数组，即类型为Any。但如果已经创建Int类型的数组，则无法向数组内添加其他类型的数据
 */
// 0 数组初始化
// 0.1)创建空数组
var someInts = [Int]()
// 0.2)带默认值的数组
var threeInts = Array(count: 3, repeatedValue: 0)
// 0.3)数组字面量构造数组
var shoppingList = ["Eggs", "Apples"]
// 0.4) 两个数组组合创建一个数组
var mixArray = threeInts + someInts


// 1) 获取数组的个数
print("someInts has \(someInts.count) item")
// 2) 判断数组是否为空
if someInts.isEmpty {
    print("empty Ints")
} else {
    print("have Ints")
}
// 3 数组增删改查操作
// 3.1) 增加元素
someInts.append(1)
someInts += [2, 3, 4, 5]
someInts.insert(100, atIndex: 3) // index不能超过数组长度(ps: 书中写的是count-1).也就是不可越界插值，插入时差到后面
// 3.2) 删除元素
someInts.removeAtIndex(0)
someInts.removeLast()
// 3.3) 改值
someInts[0] = 0 // 改单个元素值
someInts[1...3] = [12] // 等号右边多于左边的范围，仍然会添加. 也就是在原来的区域内添加等号右边的元素。注意取不到右边，也就是替换第一个与第二个
print(someInts)
// 3.4) 取数组某个元素值
var firstItem = someInts[0] // 下标法

// 4) 数组遍历
for item in shoppingList {// 遍历数组值
    print(item)
}
for (index, value) in shoppingList.enumerate() {// 遍历索引和值
    print("index:\(index), value:\(value)")
}
/**
 * 集合(Sets)
 * 1st, March, 2017
 * 特点：无序, 同个元素只出现一次, 集合中的元素必须是可哈希化(a.hashValue)的
 * Swift中的所有基本类型都是可哈希化的,可以作为集合的值与字典的键值，这里涉及到Swift中的Hashable协议。
 */
// 0集合初始化
// 0.1) 构造器语法创建
var letters = Set<Character>()
letters = ["b"]
// 0.2) 数组字面量创建集合
var Genres: Set<String> = ["Rock", "Classical", "Funk"]
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

// 1) 获取集合个数
print("I have \(favoriteGenres.count) favorite music generes")
// 2) 判断集合是否为空
if favoriteGenres.isEmpty {
}

// 3 集合增删改查操作
// 3.1) 增
letters.insert("a")
// 3.2) 删
letters.remove("a")
letters.remove("r") // 不存在的字符，则返回nil
letters.removeAll()
// 3.3) 改

// 3.4) 查
if favoriteGenres.contains("Funk") {// 判断是否包含某个元素
    
}

// 4) 集合遍历
for genres in favoriteGenres {
    print(genres)
}

// 5) 集合操作
var oddDigits: Set = [1, 3, 5, 7, 9]
var primeDigist: Set = [2, 3, 5, 11]
// 5.1) 将两个集合中相同的值创建成一个新的集合
var same = oddDigits.intersect(primeDigist) // {5, 3}
// 5.2) 在一个集合中但不在两个集合中的创建一个集合
//var difference = oddDigits.symmetricDifference(primeDigist) // swift2中无该函数
// 5.3) 将两个集合的值创建成一个集合
var union = oddDigits.union(primeDigist) // {1,2,3,5,7,9,11}
// 5.4) 将不再该集合的值创建一个新的集合
var subtract = oddDigits.subtract(primeDigist)// odd不再PrimeDigit中的值 {1,7,9}

// 6) 集合成员关系 ps: Swift2中与Swift3中这一系列代码有调整
var anotherOddDigits: Set = [3, 5]
oddDigits = [1, 3, 5]
primeDigist = [2, 7]
// 6.1) 一个集合的值是否被包含在另一个集合中(可以相等, 不相等则使用isStrictSubset)
anotherOddDigits.isSubsetOf(oddDigits) // true
anotherOddDigits.isStrictSubsetOf(anotherOddDigits) // false
// 6.2) 一个集合中包含另一个集合所有的值(可以相等, 不相等则使用isStrictSuperset)
oddDigits.isSupersetOf(anotherOddDigits)
// 6.3) 判断两个集合是否没有交集
anotherOddDigits.isDisjointWith(primeDigist) // true
anotherOddDigits.isDisjointWith(oddDigits) // false

/**
 * 字典(Dictionaries)
 * 1st, March, 2017
 * 特点：存储多个相同类型的值的容器。数据项无顺序。
 */
// 0 字典初始化
// 0.1) 构造法创建拥有确定类型的空字典
//var namesOfIntegers = Int: String // Swift2中不支持
// 0.2) 字面量创建字典
var namesOfIntegers = [:] // 空字典
namesOfIntegers = [1: "jolie", 2: "rose"]
var airports:[String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// 1) 字典个数
print("dictionary of airports contains \(airports.count) airports")
// 2) 判断是否为空
if airports.isEmpty {
    
}

// 字典增删改查操作
// 3.1) 增
// 下标语法增加(ps: 也可通过下标语法改)
airports["LHR"] = "London"
// 3.2) 删
airports["LHR"] = nil
airports.removeValueForKey("LHR") // 返回nil则表明字典中本来无该键值的元素
// 3.3) 改
airports["LHR"] = "London Heathrow"
let oldValue = airports.updateValue("London", forKey: "LHR") // 返回更新之前的值，更新之前无值则返回nil。 所以oldValue是一个可选类型
// 3.4) 查
let YYZAirport = airports["YYZ"]

// 4) 字典遍历
for (airportCode, airportName) in airports {
}

for airportCode in airports.keys {
}

for airportName in airports.values {
}






