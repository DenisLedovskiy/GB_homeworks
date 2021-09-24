//
//  main.swift
//  GB_homeworks
//
//  Created by Денис Ледовский on 16.09.2021.
//

import Foundation

// MARK: - Структура "коллекция очередь".

struct Queue<T> {
    var elements: [T] = []

    mutating func addElement(element: T) {
        elements.append(element)
    }

    mutating func removeElement() {
        if elements.count != 0 {
            elements.removeFirst()
        }
    }

// MARK: - Сабскрипт для обращения по индексу.

    subscript(index: Int) -> T? {
        let result = index <= (elements.count - 1) && index >= 0 ? elements[index] : nil
        return result
    }
}

// MARK: - Функция высшего порядка "Фильтр".

extension Queue {

    func filter(parametr:(T) -> Bool) -> [T] {
        var filtredQueue = [T]()
        for i in elements {
            if parametr(i) {
                filtredQueue.append(i)
            }
        }
        return filtredQueue
    }

//MARK: - Функция высшего порядка "Первый в очереди".

    func firstElement() -> T? {
        if elements.count == 0 {
            print("Очередь пуста.")
            return nil
        } else {
            print("Первый в очереди - \(elements[0]).")
        }

        let element = elements.count == 0 ? nil : elements[0]
        return element
    }
}

// MARK: - Создание очереди, проверка работы функционала.

var testQueue = Queue<Int>()

testQueue.addElement(element: 1)
testQueue.addElement(element: 2)
testQueue.addElement(element: 3)
testQueue.addElement(element: 4)
testQueue.addElement(element: 5)
print(testQueue)
print("----------------------")
testQueue.removeElement()
print(testQueue)
testQueue.removeElement()
print(testQueue)
print("----------------------")
let filtredTestQueue = testQueue.filter(parametr: {$0 == 4})
print(filtredTestQueue)
print("----------------------")
print(testQueue[2])
print(testQueue[6])
print("----------------------")
testQueue.firstElement()
testQueue.removeElement()
testQueue.removeElement()
testQueue.removeElement()
testQueue.firstElement()
