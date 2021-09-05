//
//  BooksLocalDataSourceTest.swift
//  MVVMCoordinatorTests
//
//  Created by Dambert M. on 5/09/21.
//

import XCTest
@testable import MVVMCoordinator

class BooksLocalDataSourceTest: XCTestCase {

    var bookLocalDataSource: BooksLocalDataSource!

    override func setUp() {
        self.bookLocalDataSource = BooksLocalDataSource()
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSaveABook() throws {

        let book = Book()
        book.title = "Author"
        book.desc = "Description"

        // Get count1
        let count1 = try self.bookLocalDataSource.getAll().count
        // Save a book object
        try self.bookLocalDataSource.save([book])
        // Get count2
        let count2 = try self.bookLocalDataSource.getAll().count

        XCTAssert((count1+1 == count2))

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
