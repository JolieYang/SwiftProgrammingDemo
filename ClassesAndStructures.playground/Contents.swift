//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
 * Structure
 * 2th,March,2017
 * 特点: 值类型, 
 * 值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。(传值而不是传指针，所以背后是两个实例，而不是指向同一个实例)
 * OC中字符串，数组，字典是以类的形式，传递时不会发生值拷贝。而Swift中这些都是以结构体的形式，所以赋值过程中值会被拷贝。然而实际上，Swift在幕后只有在绝对必要时才执行实际的拷贝
 */
struct Resolution {
    var width = 0
    var height = 0
}
let vga = Resolution(width: 1, height: 2) // 结构体有一个自动生成的成员逐一构造器， 类没有。
//vga.width = 3 // 编译报错，无法修改存储属性
var cinema = vga
cinema.width = 2
print(cinema, vga)
/**
 * Class
 * 2th,March,2017
 * 特点： 引用类型，允许继承，有析构器用于释放为其分配的资源,
 * Tip: 将实例声明为常量，仍可对属性进行更改。因为实例属性值的改变不影响实例常量的值，也就是实例常量值确实没有改变。而结构体声明为常量，则无法对属性进行修改
 */
class VideoMode {
    // 延迟存储属性，只有在第一次被访问时才被创建
    lazy var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
let someVideoMode = VideoMode()
// 点语法访问属性，支持直接获取子属性(someVideoMode.resolution.width)
print("the frameRate of VideoMode: \(someVideoMode.frameRate), width:\(someVideoMode.resolution.width)")
let otherVideoMode = someVideoMode
// 恒等运算符： 判断是否引用同一个类实例
if otherVideoMode === someVideoMode {
    print("hello")
}
/**
 * Properties
 * 2th,March,2017
 * 组成： 存储属性与计算属性
 * 特点：计算属性可以用于类、结构体和枚举，存储属性只能用于类和结构体。
 * Tip: 计算属性必须用var声明，即使是只读属性，因为值都不是固定的。
 */
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    // 计算属性
    var center: Point {
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
    // 只读计算属性
    var area: Double {
        return size.width * size.height
    }
}
// 属性观察器
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalStep to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 210
// ---- 类型属性
struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

// 获取类型属性
print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value"
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将当前音量限制在阀值之内
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels { // 存储当前音量作为新的最大输入音量 AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()


