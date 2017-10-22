import XCTest
@testable import LensKit

final class LensTests: XCTestCase {
    let lens: Lens<Employee, String> = (Employee.companyLens >>> Company.addressLens >>> Address.streetLens >>> Street.nameLens)
    let employee = Employee(company: Company(address: Address(street: Street(name: "street"))))
    
    func testGet() {
        let actual = lens.get(employee)
        XCTAssertEqual(actual, "street")
    }
    
    func testSet() {
        let actual = lens.set(employee, value: "new street")
        let expected = Employee(company: Company(address: Address(street: Street(name: "new street"))))
        XCTAssertEqual(actual, expected)
    }
    
    func testModify() {
        let actual = lens.modify(employee) { $0.capitalized }
        let expected = Employee(company: Company(address: Address(street: Street(name: "Street"))))
        XCTAssertEqual(actual, expected)
    }
}
