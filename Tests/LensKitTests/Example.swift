@testable import LensKit

// sourcery do not resolve protocol from Source
// error: Unknown type AutoLens, should be used with `based`
// NOTE: workaround define Protocol with the same name in Tests
protocol AutoLens {}

struct Street: Equatable, AutoLens {
    let name: String
    
    static func == (lhs: Street, rhs: Street) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Address: Equatable, AutoLens {
    let street: Street
    
    static func == (lhs: Address, rhs: Address) -> Bool {
        return lhs.street == rhs.street
    }
}

struct Company: Equatable, AutoLens {
    let address: Address
    
    static func == (lhs: Company, rhs: Company) -> Bool {
        return lhs.address == rhs.address
    }
}

struct Employee: Equatable, AutoLens {
    let company: Company
    
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.company == rhs.company
    }
}
