//
//  ContentView.swift
//  SnapshotTesting
//
//  Created by Will Saults on 12/17/22.
//

import SwiftUI

struct ContentView: View {
    var errorMessage: String?
    var cellViewModels: [CellViewModel]
    
    var body: some View {
        VStack {
            if let message = errorMessage {
                Spacer()
                Text(message)
                    .foregroundColor(.white)
                    .bold()
                    .padding(12)
                    .background(.orange)
                    .cornerRadius(8)
            }
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(cellViewModels) { CellView(viewModel: $0) }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CellViewModel(
            title: "Amet commodo\nfacilisi nullam vehicula",
            image: UIImage.make(withColor: .red),
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
        ContentView(
            errorMessage: "This is a warning!",
            cellViewModels: [viewModel]
        )
    }
}
