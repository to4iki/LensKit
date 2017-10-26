import XCTest
@testable import LensKit

final class LensTests: XCTestCase {
    let lens: Lens<Employee, String> = (Employee.companyLens >>> Company.addressLens >>> Address.streetLens >>> Street.nameLens)
    let employee = Employee(company: Company(address: Address(street: Street(name: "street"))))
    
    func testLensLaws() {
        // set(s, get(t)) == t
        XCTAssertEqual(lens.set(employee, value: lens.get(employee)), employee)
        
        // get(set(s, t)) == t
        XCTAssertEqual(lens.get(lens.set(employee, value: "t")), "t")
        
        // set(set(s, t1), t2) == set(s, t2)
        XCTAssertEqual(lens.set(lens.set(employee, value: "t1"), value: "t2"), lens.set(employee, value: "t2"))
    }
    
    func testModify() {
        let actual = lens.modify(employee) { $0.capitalized }
        let expected = Employee(company: Company(address: Address(street: Street(name: "Street"))))
        XCTAssertEqual(actual, expected)
    }
}
