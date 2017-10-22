@testable import LensKit

// sourcery do not resolve protocol from Source
// error: Unknown type Lenser, should be used with `based`
// -> define Protocol with the same name in Tests
protocol Lenser {}

struct Street: Equatable, Lenser {
    let name: String
    
    static func == (lhs: Street, rhs: Street) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Address: Equatable, Lenser {
    let street: Street
    
    static func == (lhs: Address, rhs: Address) -> Bool {
        return lhs.street == rhs.street
    }
}

struct Company: Equatable, Lenser {
    let address: Address
    
    static func == (lhs: Company, rhs: Company) -> Bool {
        return lhs.address == rhs.address
    }
}

struct Employee: Equatable, Lenser {
    let company: Company
    
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.company == rhs.company
    }
}
