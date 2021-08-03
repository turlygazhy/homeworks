import UIKit

enum RegistrationError: Error {
    case tooYang
    case incorrectName
    case loginIsBusy
}

struct User {
    let age: Int
    let name: String
    let login: String
}

class Registration {
    
    var registeredUsers = [User]()
    
    func register(user: User) throws {
        guard user.age > 17 else {
            throw RegistrationError.tooYang
        }
        guard user.name.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil else {
            throw RegistrationError.incorrectName
        }
        for u in registeredUsers {
            if u.login == user.login {
                throw RegistrationError.loginIsBusy
            }
        }
        
        registeredUsers.append(user)
        print("You are registered")
    }
    
}


var registration = Registration()
do {
    try registration.register(user: User(age: 18, name: "fjkd10", login: "fdas"))
} catch RegistrationError.tooYang {
    print("You are too yang")
} catch RegistrationError.incorrectName {
    print("Your name cannot contain digits")
} catch RegistrationError.loginIsBusy {
    print("Please choose another login")
}

do {
    try registration.register(user: User(age: 18, name: "fjkd", login: "fdas"))
    try registration.register(user: User(age: 18, name: "fjkd", login: "fdas"))
} catch RegistrationError.tooYang {
    print("You are too yang")
} catch RegistrationError.incorrectName {
    print("Your name cannot contain digits")
} catch RegistrationError.loginIsBusy {
    print("Please choose another login")
}

