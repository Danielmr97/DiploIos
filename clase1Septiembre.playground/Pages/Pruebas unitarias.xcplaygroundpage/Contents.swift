//Pruebas unitarias

import XCTest

class MyTest: XCTestCase {

    func getFullName(_ nameTuple : (String, String?, String, String? ))-> String {
        //          N1                    E1                              N2                     E2               E3                             N3
        return nameTuple.0 + (nameTuple.1 != nil ? " " : "") + (nameTuple.1 ?? "") + " " + nameTuple.2 + (nameTuple.3 != nil ? " " : "") + "\(nameTuple.3 ?? "")"
    }
    
    func test_GetFullName() {
        //given
        let firstPerarson : (String, String?, String, String?) = ("Jesus","Daniel","Mayo", "Ruiz")
        let SecondPerarson : (String, String?, String, String?) = (firstName : "Juan", Second: nil,LastName: "Mayo", secondLastName: nil)
        //when
        let firstFullName = getFullName(firstPerarson)
        let secondFullName = getFullName(SecondPerarson)
        //then
        XCTAssertEqual(firstFullName, "Jesus Daniel Mayo Ruiz")
        XCTAssertEqual(secondFullName, "Juan Mayo")
    }
}

MyTest.defaultTestSuite.run()
