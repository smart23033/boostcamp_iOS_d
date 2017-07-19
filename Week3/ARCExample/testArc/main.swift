import Foundation

// lazy, weak, unowned를 활용하여 아래의 코드가 아래와 같은 결과가 나오도록 해주세요.

class FingerPrint {
    let id: Int64
    unowned let person: Person
    
    init(id: Int64, person: Person) {
        self.id = id
        self.person = person
        print("init Finger print. id: \(id)")
    }
    
    deinit {
        print("deinit FingerPrint \(id) instance")
    }
}

class Person {
    let name: String
    var fingerPrint: FingerPrint!
    
    init(name: String, fingerPrintId: Int64) {
        self.name = name
        self.fingerPrint = FingerPrint(id: fingerPrintId, person: self)
        print("init Person. name: \(name)")
    }
    
    var apartment: Apartment?
    var creditCard: CreditCard?
    
    lazy var personInfo1: String = {
        if let apt = self.apartment {
            return "name: \(self.name). apt unit : \(apt.unit)."
        } else {
            return "name: \(self.name)."
        }
    }()

    lazy var personInfo2: () -> String = {
        [unowned self] in
        if let apt = self.apartment {
            return "name: \(self.name). apt unit : \(apt.unit)."
        } else {
            return "name: \(self.name)."
        }
    }
    
    deinit {
        print("deinit Person \(name) instance")
    }
}

class Apartment {
    let unit: String
    
    init(unit: String) {
        print("init Apartment \(unit)")
        self.unit = unit
    }
    
    weak var tenant: Person?
    
    deinit {
        print("deinit Apartment instance")
    }
}

class CreditCard {
    let cardNumber: Int64
    unowned let customer: Person
    
    init(cardNumber: Int64, customer: Person) {
        print("init CreditCard. card num : \(cardNumber) customer name : \(customer.name)")
        self.cardNumber = cardNumber
        self.customer = customer
    }
    
    deinit {
        print("deinit CreditCard instance")
    }
}

var seok: Person? = Person(name: "seok", fingerPrintId: 04934802934862039486)
var apt: Apartment? = Apartment(unit: "suwon-apt")
seok!.apartment = apt
seok!.creditCard = CreditCard(cardNumber: 1029301981342345, customer: seok!)
//print(seok!.personInfo1)
//print(seok!.personInfo2())

seok = nil
apt = nil
