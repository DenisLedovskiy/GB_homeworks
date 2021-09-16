//
//  main.swift
//  GB_homeworks
//
//  Created by Денис Ледовский on 16.09.2021.
//

import Foundation

enum DvigatelState {
    case on, off
}

enum WindowsState {
    case close, open
}

struct Car {
    let tipKuzova: String
    let marka: String
    let model: String
    let color: String
    let year: Int
    let price: Int
    let isTrailer: Bool
    let probeg: Int
    let korobka: String
    let hosts: Int
    let volumeDvigatela: Double
    let petrol: String
    var dvigatelState: DvigatelState
    var windowsState: WindowsState
    let volumeTrunk: Int
    var filledVolumeTrunk: Int

    mutating func dvigatelOn() {
        self.dvigatelState = .on
    }

    mutating func dvigatelOff() {
        self.dvigatelState = .off
    }

    mutating func windowsOpen() {
        self.windowsState = .open
    }

    mutating func windowsClose() {
        self.windowsState = . close
    }

    mutating func cargoIn (gruz:Int) -> Int {
        self.filledVolumeTrunk += gruz
        if self.filledVolumeTrunk <= self.volumeTrunk {
            print("Загрузили \(gruz) литров.")
            return self.filledVolumeTrunk
        } else {
            self.filledVolumeTrunk -= gruz
            print("Не помещается. Можно загрузить еще \(self.volumeTrunk-self.filledVolumeTrunk) литров.")
            return self.filledVolumeTrunk
        }
    }

    mutating func cargoOut (gruz:Int) -> Int {
        self.filledVolumeTrunk -= gruz
        if self.filledVolumeTrunk >= 0 {
            print("Выгрузили \(gruz) литров.")
            return self.filledVolumeTrunk
        } else {
            self.filledVolumeTrunk += gruz
            print("Нельзя выгрузить больше, чем есть.")
            return self.filledVolumeTrunk
        }
    }
}

var car1 = Car(tipKuzova: "Седан", marka: "LADA", model: "Vesta", color: "Белый", year: 2020, price: 768000, isTrailer: false, probeg: 12658, korobka: "Механическая", hosts: 1, volumeDvigatela: 1.6, petrol: "бензин", dvigatelState: .off, windowsState: .close, volumeTrunk: 150, filledVolumeTrunk: 0)
print(car1.windowsState)
car1.windowsOpen()
print(car1.windowsState)
print("Автомобиль \(car1.marka) \(car1.model), цвет \(car1.color), пробег \(car1.probeg) км. Количество владельцев: \(car1.hosts).")

var car2 = Car(tipKuzova: "Грузовик", marka: "Mercades", model: "S60", color: "Чёрный", year: 2003, price: 600000, isTrailer: true, probeg: 467400, korobka: "Автоматическая", hosts: 3, volumeDvigatela: 3.0, petrol: "дизель", dvigatelState: .off, windowsState: .close, volumeTrunk: 600, filledVolumeTrunk: 200)
print(car2.tipKuzova, car2.marka, "\(car2.model).",
      "Двигатель \(car2.dvigatelState),",
      "загружено \(car2.filledVolumeTrunk) литров.")
car2.dvigatelOn()
car2.cargoIn(gruz: 300)
print("Двигатель \(car2.dvigatelState),", "Загружено \(car2.filledVolumeTrunk) литров")

car2.cargoIn(gruz: 200)
print("Загружено \(car2.filledVolumeTrunk) литров")

car2.cargoOut(gruz: 400)
print("Загружено \(car2.filledVolumeTrunk) литров")

car2.cargoOut(gruz: 500)
print("Загружено \(car2.filledVolumeTrunk) литров")


