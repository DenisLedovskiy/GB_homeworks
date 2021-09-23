//
//  main.swift
//  GB_homeworks
//
//  Created by Денис Ледовский on 16.09.2021.
//

import Foundation

// MARK: - Перечисления

enum WindowState: String {
    case open = "открыты"
    case close = "закрыты"
}

enum Dvigatel: String {
    case on = "заведен"
    case off = "заглушен"
}

enum DoorState: String {
    case open = "открыты"
    case close = "закрыты"
}

enum DriveMode: String {
    case sport = "спорт"
    case city = "городской"
    case economFuel = "экономия топлива"
}

enum AdditionalWheels: String {
    case add = "Дополнительыне колёса установлены"
    case remove = "Дополнительные колеса убраны"
}

// MARK: - Описание протокола и его расширений

protocol CarProtocol {
    var marka: String { get }
    var model: String { get }
    var color: String { get }
    var probeg: Int { get }
    var price: Int { get }
    var windows: WindowState { get set }
    var dvigatel: Dvigatel { get set }
    var doors: DoorState { get set }

    func doAvto()
}

extension CarProtocol {

    mutating func openWindow() {
        windows = .open
    }

    mutating func closeWindow() {
        windows = .close
    }
}

extension CarProtocol {

    mutating func onDvigatel() {
        dvigatel = .on
    }

    mutating func offDvigatel() {
        dvigatel = .off
    }
}

extension CarProtocol {

    mutating func openDoors() {
        doors = .open
    }

    mutating func closeDoors() {
        doors = .close
    }

}

// MARK: - Обявление классов

final class SportCar: CarProtocol {

    var marka: String
    var model: String
    var color: String
    var probeg: Int
    var price: Int
    var windows: WindowState
    var dvigatel: Dvigatel
    var doors: DoorState
    let razgonDo100: Double
    let engineCapacity: Double
    let isSpoiler: Bool
    var driveMode: DriveMode

    init (marka: String,
          model: String,
          color: String,
          probeg: Int,
          price: Int,
          windows: WindowState,
          dvigatel: Dvigatel,
          doors: DoorState,
          razgonDo100: Double,
          engineCapacity: Double,
          isSpoiler: Bool,
          driveMode: DriveMode) {
        self.marka = marka
        self.model = model
        self.color = color
        self.probeg = probeg
        self.price = price
        self.windows = windows
        self.dvigatel = dvigatel
        self.doors = doors
        self.razgonDo100 = razgonDo100
        self.engineCapacity = engineCapacity
        self.isSpoiler = isSpoiler
        self.driveMode = driveMode
    }

    func doAvto() { }

    func chooseMode(vvod:String) {
        switch vvod {
        case "Sport":
            driveMode = .sport
            print("Режим изменён.")
        case "City":
            driveMode = .city
            print("Режим изменён.")
        case "FuelEconom":
            driveMode = .economFuel
            print("Режим изменён.")
        default:
            print("Ошибка. Выберите один из трех режимов: Sport, City или FuelEconom")
        }
    }
}

final class TrunkCar: CarProtocol {
    var marka: String
    var model: String
    var color: String
    var probeg: Int
    var price: Int
    var windows: WindowState
    var dvigatel: Dvigatel
    var doors: DoorState
    let loadCapacity: Int
    let volumeTrailer: Int
    var wheels: AdditionalWheels

    init (marka: String,
          model: String,
          color: String,
          probeg: Int,
          price: Int,
          windows: WindowState,
          dvigatel: Dvigatel,
          doors: DoorState,
          loadCapacity: Int,
          volumeTrailer: Int,
          wheels: AdditionalWheels) {
        self.marka = marka
        self.model = model
        self.color = color
        self.probeg = probeg
        self.price = price
        self.windows = windows
        self.dvigatel = dvigatel
        self.doors = doors
        self.loadCapacity = loadCapacity
        self.volumeTrailer = volumeTrailer
        self.wheels = wheels
    }

    func doAvto() { }

    func addWheels(vvod: String) {
             switch vvod {
             case "Add":
                 wheels = .add
                 print("Установил дополнительные колёса.")
             case "Remove":
                 wheels = .remove
                 print("Убрал дополнительные колёса.")
             default:
                 print("Ошибка. Для установки дополнительных колес напишите Add, для их снятия Remove.")
             }
         }
}

// MARK: - CustomStringConvertible

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
            Автомобиль \(marka) \(model).
            Пробег \(probeg) км.
            Разгон до 100 - \(razgonDo100) секунды.
            Двери \(doors.rawValue).
            Режим: \(driveMode.rawValue).
            """
    }
}

extension TrunkCar: CustomStringConvertible {
     var description: String {
        return """
            Автомобиль \(marka) \(model).
            Пробег \(probeg) км.
            Объем трейлера \(volumeTrailer) литров.
            Двери \(doors.rawValue).
            \(wheels.rawValue).
            """
     }
}

// MARK: - Создание объектов классов, действия и вывод в консоль

var car1 = SportCar(marka: "Lamborgini", model: "Huracan", color: "желтый", probeg: 35_000, price: 17_000_000, windows: .close, dvigatel: .off, doors: .close, razgonDo100: 3.9, engineCapacity: 6.5, isSpoiler: true, driveMode: .city)

print(car1)
print("Двигатель \(car1.dvigatel.rawValue).")

car1.onDvigatel()
car1.chooseMode(vvod: "Sport")

print("------------------")
print(car1)
print("Двигатель \(car1.dvigatel.rawValue).")

var car2 = TrunkCar(marka: "Mercedes", model: "V56", color: "белый", probeg: 356_000, price: 4_005_000, windows: .close, dvigatel: .off, doors: .close, loadCapacity: 3, volumeTrailer: 65, wheels: .add)

print("------------------")
print(car2)

car2.openDoors()
car2.addWheels(vvod: "Remove")

print("------------------")
print(car2)




