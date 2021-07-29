import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue<T: Comparable> {
    
    var items = [T]()
    
    mutating func add(item: T){
        items.append(item)
    }
    
    mutating func getNext() -> T {
        return items.removeFirst()
    }
    
    func filter(item:T) -> [T] {
        return  items.filter{$0 == item}
    }
    
    subscript (index: Int) -> T {
        return items[index]
    }
}

var q1 = Queue<Int>()
q1.add(item: 10)
q1.add(item: 5)
q1.add(item: 15)
q1.add(item: 7)
print(q1.filter(item: 10))
print(q1)
print(q1[2])

var q2 = Queue<String>()
q2.add(item: "test")
print(q2)

