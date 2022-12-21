//
//  SnapshotTestingTests.swift
//  SnapshotTestingTests
//
//  Created by Will Saults on 12/17/22.
//

import SwiftUI
import XCTest
@testable import SnapshotTesting

final class SnapshotTestingTests: XCTestCase {

    func test_content() {
        let cells = makeCells()
        let sut = makeSUT(with: cells)

        assert(snapshot: sut.snapshot(for: .iPhone14(style: .light)), named: "CONTENT_light")
        assert(snapshot: sut.snapshot(for: .iPhone14(style: .dark)), named: "CONTENT_dark")
        assert(snapshot: sut.snapshot(for: .iPhone14(style: .light, contentSize: .extraExtraExtraLarge)), named: "CONTENT_light_extraExtraExtraLarge")
    }
    
    func test_errorMessage() {
        let sut = makeSUT(errorMessage: "Lorem ipsum dolor sit")

        assert(snapshot: sut.snapshot(for: .iPhone14(style: .light)), named: "ERROR_MESSAGE_light")
        assert(snapshot: sut.snapshot(for: .iPhone14(style: .dark)), named: "ERROR_MESSAGE_dark")
        assert(snapshot: sut.snapshot(for: .iPhone14(style: .light, contentSize: .extraExtraExtraLarge)), named: "ERROR_MESSAGE_light_extraExtraExtraLarge")
    }
    
    // MARK: Helpers
    
    private func makeSUT(with cellViewModels: [CellViewModel] = [], errorMessage: String? = nil) -> UIViewController {
        let content = ContentView(
            errorMessage: errorMessage,
            cellViewModels: cellViewModels
        )
        let controller = UIHostingController(rootView: content)
        controller.loadViewIfNeeded()
        return controller
    }
    
    private func makeCells() -> [CellViewModel] {
        [
            CellViewModel(
                title: "Amet commodo\nfacilisi nullam vehicula",
                image: UIImage.make(withColor: .red),
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
            )
            ,
            CellViewModel(
                title: "Cras sed\neget velit aliquet",
                image: UIImage.make(withColor: .green),
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sem integer vitae justo eget magna fermentum iaculis. Turpis massa sed elementum tempus egestas sed sed risus."
            )
        ]
    }
}
