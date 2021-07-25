import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

protocol Car: AnyObject {
    var brand: String {get}
    var productYear: Int {get}
    var engine: EngineStatus {get set}
    var windows: WindowsStatus {get set}
    
    func act(action: Action)
}

extension Car {
    func actEngine(status: EngineStatus){
        engine = status
    }
    
    func actWindow(status: WindowsStatus){
        windows = status
    }
}

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

class TrunkCar: Car {
    var brand: String
    var productYear: Int
    var engine: EngineStatus
    var windows: WindowsStatus
    let maxCargoSpace: Double
    var currentCargoSpace: Double = 0.0
    
    init(brand: String,productYear: Int,engine: EngineStatus,windows: WindowsStatus,maxCargoSpace: Double) {
        self.brand = brand
        self.productYear = productYear
        self.engine = engine
        self.windows = windows
        self.maxCargoSpace = maxCargoSpace
    }
    
    func act(action: Action) {
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

extension TrunkCar: CustomStringConvertible{
    var description: String {
        return "Brand: \(brand), year: \(productYear), max cargo: \(maxCargoSpace), used cargo: \(currentCargoSpace)"
    }
}

class SportCar: Car {
    var brand: String
    var productYear: Int
    var engine: EngineStatus
    var windows: WindowsStatus
    var topSpeed: Int
    let nitro: NitroExist
    
    init(brand: String,productYear: Int,engine: EngineStatus,windows: WindowsStatus,topSpeed: Int,nitro: NitroExist) {
        self.brand = brand
        self.productYear = productYear
        self.engine = engine
        self.windows = windows
        self.topSpeed = topSpeed
        self.nitro = nitro
    }
    
    func act(action: Action) {
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
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Brand: \(brand), year: \(productYear), top speed: \(topSpeed), nitro: \(nitro)"
    }
}

var car1 = SportCar(brand: "Toyota", productYear: 2020, engine: .on, windows: .opened, topSpeed: 200, nitro: .yes)
car1.act(action: .actNitro)

var car2 = SportCar(brand: "Subaru", productYear: 2010, engine: .off, windows: .closed, topSpeed: 150, nitro: .none)
car2.act(action: .actNitro)

var car3 = TrunkCar(brand: "Kamaz", productYear: 2000, engine: .off, windows: .opened, maxCargoSpace: 200.0)
print(car3)
car3.act(action: .loadCargo(100.0))
print(car3)
