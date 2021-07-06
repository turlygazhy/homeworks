import UIKit

//ax^2 + bx + c = 0

let a: Double = 3
let b: Double = 7
let c: Double = -10

//d = b^2 - 4ac
let d: Double = b*b - 4*a*c

print("Дискриминант \(d)")

if d>0 {
    let x1 = (-1*b + d.squareRoot())/(2*a)
    let x2 = (-1*b - d.squareRoot())/(2*a)
    print("Уравнение имеет 2 корня х1 = \(x1), x2 = \(x2)" )
} else if d==0 {
    let x = -1*b/2*a
    print("Уравнение имеет один корень \(x)")
} else {
    print("Уравнение не имеет корней")
}

//Даны катеты прямоугольного треугольника, найти площадь, периметр и гипотенузу
let catet1:Double=3
let catet2:Double=4

//площадь
let s = 0.5*catet1*catet2
print("Площадь треугольника \(s)")

//гипотенуза
let gip = ((catet1*catet1)+(catet2*catet2)).squareRoot()
print("Гипотенуза \(gip)")

//периметр
let p = catet1 + catet2 + gip
print("Периметр \(p)")

