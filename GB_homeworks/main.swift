//
//  main.swift
//  GB_homeworks
//
//  Created by Денис Ледовский on 16.09.2021.
//

import Foundation

enum DriveMode {
    case sport
    case city
    case economFuel
}

enum AdditionalWheels: String {
    case add = "Дополнительные колёса установлены."
    case remove = "Дополнительные колеса убраны."
}

class Car {
    let marka: String
    let model: String
    let color: String
    let probeg: Int
    let price: Int

    init(marka: String, model: String, color: String, probeg: Int, price: Int) {
        self.marka = marka
        self.model = model
        self.color = color
        self.probeg = probeg
        self.price = price
    }
    func pustoiMetod (vvod:String) {
    }
}

final class SportCar: Car {
    let razgonDo100: Double
    let engineCapacity: Double
    var isSpoiler: Bool
    var driveMods: DriveMode

    init(marka: String, model: String, color: String, probeg: Int, price: Int,
         razgonDo100: Double, engineCapacity: Double, isSpoiler: Bool, driveMods: DriveMode) {
        self.razgonDo100 = razgonDo100
        self.engineCapacity = engineCapacity
        self.isSpoiler = isSpoiler
        self.driveMods = driveMods
        super.init(marka: marka, model: model, color: color, probeg: probeg, price: price)
    }

    override func pustoiMetod (vvod:String) {
        switch vvod {
        case "Sport":
            self.driveMods = .sport
            print("Режим изменён.")
        case "City":
            self.driveMods = .city
            print("Режим изменён.")
        case "FuelEconom":
            self.driveMods = .economFuel
            print("Режим изменён.")
        default:
            print("Ошибка. Выберите один из трех режимов: Sport, City или FuelEconom")
        }
    }
}

final class TrunkCar: Car {
    let loadCapacity: Int
    let volumeTrailer: Int
    var wheels: AdditionalWheels

    init(marka: String, model: String, color: String, probeg: Int, price: Int,
         loadCapacity: Int, volumeTrailer: Int, wheels: AdditionalWheels) {
        self.loadCapacity = loadCapacity
        self.volumeTrailer = volumeTrailer
        self.wheels = wheels
        super.init(marka: marka, model: model, color: color, probeg: probeg, price: price)
    }

    override func pustoiMetod(vvod: String) {
        switch vvod {
        case "Add":
            self.wheels = .add
            print("Установил дополнительные колёса.")
        case "Remove":
            self.wheels = .remove
            print("Убрал дополнительные колёса.")
        default:
            print("Ошибка. Для установки дополнительных колес напишите Add, для их снятия Remove.")
        }
    }
}

var car1 = SportCar(marka: "Ferrari", model: "A30", color: "Red", probeg: 1200, price: 32_000_000, razgonDo100: 4.3, engineCapacity: 6.0, isSpoiler: true, driveMods: .city)
print("Автомобиль \(car1.marka) \(car1.model). Цена \(car1.price) рублей. Разгон до 100 км/ч - \(car1.razgonDo100) секунды. Текущий режим \(car1.driveMods).")

car1.pustoiMetod(vvod: "Sport")
print("Текущий режим \(car1.driveMods).")

car1.pustoiMetod(vvod: "Add")
print("Текущий режим \(car1.driveMods).")

var car2 = TrunkCar(marka: "Volvo", model: "S20", color: "blue", probeg: 245_870, price: 5_400_000, loadCapacity: 5, volumeTrailer: 60, wheels: .add)
print("Грузовик \(car2.marka) \(car2.model). Грузоподъемность \(car2.loadCapacity) тонн. Вмещаемый объём \(car2.volumeTrailer) кубов. \(car2.wheels.rawValue)")

car2.pustoiMetod(vvod: "Remove")
print(car2.wheels.rawValue)
