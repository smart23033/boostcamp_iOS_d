import Foundation

class FingerPrint {
    let id: Int64
    let person: Person
    
    init() {
        print("init Finger print. id: \(id)")
    }
    
    deinit {
        print("deinit FingerPrint \(id) instance")
    }
}

class Person {
    let name: String
    var fingerPrint: FingerPrint
    var apartment: Apartment
    var creditCard: CreditCard
    
    init() {
        print("init Person. name: \(name)")
    }
    
    deinit {
        print("deinit Person \(name) instance")
    }
}

class Apartment {
    let unit: String
    var tenant: Person
    
    init() {
        print("init Apartment \(unit)")
    }
    
    deinit {
        print("deinit Apartment instance")
    }
}

class CreditCard {
    let cardNumber: Int64
    let customer: Person
    
    init() {
        print("init CreditCard. card num : \(cardNumber) customer name : \(customer.name)")
    }
    
    deinit {
        print("deinit CreditCard instance")
    }
}

//var seok: Person? = Person()
//var apt: Apartment? = Apartment()
//seok.apartment = apt
//seok.creditCard = CreditCard()
//
//seok = nil
//apt = nil
