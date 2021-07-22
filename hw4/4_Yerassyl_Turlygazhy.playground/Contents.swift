import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

class Car {
    let brand: String
    let productYear: Int
    var engine: EngineStatus = .off
    var windows: WindowsStatus = .closed
    
    enum EngineStatus: CustomStringConvertible {
        case on, off
        
        var description: String {
            switch self {
            case .on:
                return "Engine is on"
            case .off:
                return "Engine is off"
            }
        }
    }
    
    enum WindowsStatus: CustomStringConvertible {
        case opened, closed
        
        var description: String {
            switch self {
            case .opened:
                return "Windows are opened"
            case .closed:
                return "Windows are closed"
            }
        }
    }
    
    enum Action {
        case actEngine(EngineStatus)
        case actWindows(WindowsStatus)
        case loadCargo(Double)
        case actNitro
    }
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.productYear = year
    }
    
    func act(action: Action){
    }
}

class TrunkCar: Car, CustomStringConvertible {
    let maxCargoSpace: Double
    var currentCargoSpace: Double = 0.0
    
    var description: String {
        return "Brand: \(brand), year: \(productYear), max cargo: \(maxCargoSpace), used cargo: \(currentCargoSpace)"
    }
    
    init(brand: String, year: Int, maxCargo: Double) {
        self.maxCargoSpace = maxCargo
        super.init(brand: brand, year: year)
    }
    
    override func act(action: Car.Action) {
        switch action {
        case .actEngine(let status):
            engine = status
        case .actWindows(let status):
            windows = status
        case .loadCargo(let load):
            currentCargoSpace = currentCargoSpace + load
        default:
            break
        }
    }
}

class SportCar: Car, CustomStringConvertible {
    var topSpeed: Int
    let nitro: NitroExist
    
    var description: String {
        return "Brand: \(brand), year: \(productYear), top speed: \(topSpeed), nitro: \(nitro)"
    }
    
    enum NitroExist: CustomStringConvertible {
        case yes, none
        
        var description: String {
            switch self {
            case .yes:
                return "Car has nitro"
            case .none:
                return "Car does not have nitro"
            }
        }
    }
    
    init(brand: String, year: Int, topSpeed: Int, nitro: NitroExist) {
        self.nitro = nitro
        self.topSpeed = topSpeed
        super.init(brand: brand, year: year)
    }
    
    override func act(action: Car.Action) {
        switch action {
        case .actEngine(let status):
            engine = status
        case .actWindows(let status):
            windows = status
        case .actNitro:
            if nitro == .yes {
                print("Nitro is activated")
            } else {
                print("Sorry we don't have nitro")
            }
        default:
            break
        }
    }
}

var car1 = SportCar(brand: "Toyota", year: 2020, topSpeed: 200, nitro: .yes)
car1.act(action: .actNitro)

var car2 = SportCar(brand: "Subaru", year: 2010, topSpeed: 150, nitro: .none)
car2.act(action: .actNitro)

var car3 = TrunkCar(brand: "Kamaz", year: 2000, maxCargo: 200.0)
print(car3)
car3.act(action: .loadCargo(100.0))
print(car3)
