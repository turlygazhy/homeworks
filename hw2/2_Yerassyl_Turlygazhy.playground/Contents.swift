import UIKit

//1. четное или нет
func isEven(checkedDigit: Int) -> Bool {
    return checkedDigit % 2 == 0
}

//проверка
print(isEven(checkedDigit: 5))
print(isEven(checkedDigit: 4))
print(isEven(checkedDigit: 6))

//2. делится на 3 или нет
func canBeDevideToThree(checkedDigit: Int) -> Bool {
    return checkedDigit % 3 == 0
}

//проверка
print(canBeDevideToThree(checkedDigit: 9))
print(canBeDevideToThree(checkedDigit: 10))
print(canBeDevideToThree(checkedDigit: 12))

//3. создать массив из 100 чисел
func getArray() -> [Int] {
    var digits = [Int]()
    for i in 1...100 {
        digits.append(i)
    }
    return digits
}

var digits = getArray()
print(digits)

//4.удаление
var index = 0
while true {
    if digits.count <= index {
        break
    }
    let digit = digits[index]
//    print("index \(index) digit \(digit)")
    if digit%2 == 0 || digit%3 != 0 {
        digits.remove(at: index)
//        print("removed")
    } else {
        index = index + 1
    }
}

print(digits)

//5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func addOneFibonacciToArray(array: inout [Int]){
    var prevFibo = 0
    var nextFibo = 0
    
    while true {
        if !array.contains(nextFibo) {
            array.append(nextFibo)
            break
        } else {
            if nextFibo == 0 {
                nextFibo = 1
            } else {
                let temp = prevFibo
                prevFibo = nextFibo
                nextFibo = temp + prevFibo
            }
        }
    }
}

var array = [Int]()
for _ in 0...49 {
    addOneFibonacciToArray(array: &array)
}
print(array)


