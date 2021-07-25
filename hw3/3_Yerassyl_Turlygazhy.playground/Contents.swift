import UIKit


// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
// 6. Вывести значения свойств экземпляров в консоль.

struct SportCar {
    var brand: String
    var year: Int
    var trunkValue: Double
    var engineOn:Bool
    var windowsOpened: Bool
    var usedTrunkValue: Double = 0

    mutating func actEngine(action: EngineAction){
        switch action {
        case .start:
            engineOn = true
        default:
            engineOn = false
        }
    }
    
    mutating func actWindow(action: WindowAction){
        switch action {
        case .open:
            windowsOpened = true
        default:
            windowsOpened = false
        }
    }
    
    mutating func actTrunk(action: TrunkAction, value: Double){
        switch action {
        case .upload:
            trunkValue = trunkValue + value
        default:
            trunkValue = trunkValue - value
        }
    }
    
    func describe() {
        print("Sport car \(brand), year: \(year). Engine is \(engineOn==true ? "on" : "off"), windows is \(windowsOpened==true ? "opened" : "closed"), trunk value is \(trunkValue)")
    }
}

struct TrunkCar {
    var brand: String
    var year: Int
    var trunkValue: Double
    var engineOn:Bool
    var windowsOpened: Bool
    var usedTrunkValue: Double = 0

    mutating func actEngine(action: EngineAction){
        switch action {
        case .start:
            engineOn = true
        default:
            engineOn = false
        }
    }
    
    mutating func actWindow(action: WindowAction){
        switch action {
        case .open:
            windowsOpened = true
        default:
            windowsOpened = false
        }
    }
    
    mutating func actTrunk(action: TrunkAction, value: Double){
        switch action {
        case .upload:
            trunkValue = trunkValue + value
        default:
            trunkValue = trunkValue - value
        }
    }
    
    func describe() {
        print("Sport car \(brand), year: \(year). Engine is \(engineOn==true ? "on" : "off"), windows is \(windowsOpened==true ? "opened" : "closed"), trunk value is \(trunkValue)")
    }
}

enum EngineAction {
    case start
    case turnOff
}

enum WindowAction {
    case open
    case close
}

enum TrunkAction {
    case upload
    case download
}

var car1 = SportCar(brand: "Toyota", year: 2013, trunkValue: 20.1, engineOn: true, windowsOpened: false)
car1.actWindow(action: .open)

car1.describe()

var car2 = TrunkCar(brand: "Kamaz", year: 2000, trunkValue: 50.0, engineOn: false, windowsOpened: false)
car2.actEngine(action: .start)

car2.describe()
