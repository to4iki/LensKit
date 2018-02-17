// Generated using Sourcery 0.10.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import LensKit

extension Address {
  static let streetLens = Lens<Address, Street>(
    get: { $0.street },
    set: { address, street in
       Address(street: street)
    }
  )
}
extension Company {
  static let addressLens = Lens<Company, Address>(
    get: { $0.address },
    set: { company, address in
       Company(address: address)
    }
  )
}
extension Employee {
  static let companyLens = Lens<Employee, Company>(
    get: { $0.company },
    set: { employee, company in
       Employee(company: company)
    }
  )
}
extension Street {
  static let nameLens = Lens<Street, String>(
    get: { $0.name },
    set: { street, name in
       Street(name: name)
    }
  )
}
