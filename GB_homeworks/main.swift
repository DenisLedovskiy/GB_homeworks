//
//  main.swift
//  GB_homeworks
//
//  Created by Денис Ледовский on 16.09.2021.
//

import Foundation

// Задание №1

enum Oshibki: Error {
    case netDannih
}

final class Massiv<T> {
    private var elements: [T] = []

    func addElement(element: T) {
        elements.append(element)
    }

    func printElement(index: Int) -> (T?, Oshibki?) {
        guard index <= elements.count - 1, index >= 0 else {
            return (nil, Oshibki.netDannih)
        }
        print(elements[index])
        return (elements[index], nil)
    }
}

let testMassiv = Massiv<Int>()

testMassiv.addElement(element: 1)
testMassiv.addElement(element: 2)
testMassiv.addElement(element: 3)
testMassiv.addElement(element: 4)
testMassiv.addElement(element: 5)

let rezult = testMassiv.printElement(index: 1)

if let variantOne = rezult.0 {
    print ("Программа работает.")
} else if let error = rezult.1 {
    print ("Ошибка: \(error.localizedDescription)")
}

print("-------------------")

// Задание №2

enum CreditCardError: Error {
    case notEhoughMoney
    case cardBlocked
}

struct Product {
    var price: Double

    init (price: Double) {
        self.price = price
    }
}

final class CreditCard {
    let limit: Double = 50_000
    var balance: Double = 45_567.4
    var isCardBlock = false

    func buyProduct(product: Product) throws {

        guard isCardBlock == false else {
            throw CreditCardError.cardBlocked
        }

        guard balance >= product.price else {
            throw CreditCardError.notEhoughMoney
        }

        balance -= product.price
        print("Вы совершили покупку на \(product.price) рублей. На балансе осталось \(balance) рублей.")
    }
}

let iPhone = Product(price: 34_500.0)
var cardSber = CreditCard()

do {
    try cardSber.buyProduct(product: iPhone)
} catch CreditCardError.cardBlocked {
    print("Карта заблокирована")
} catch CreditCardError.notEhoughMoney {
    let needMoney = iPhone.price - cardSber.balance
    print("У вас недостаточно денег. Не хватает \(needMoney) рублей.")
}



