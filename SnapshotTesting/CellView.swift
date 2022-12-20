//
//  CellView.swift
//  SnapshotTesting
//
//  Created by Will Saults on 12/17/22.
//

import SwiftUI

struct CellViewModel: Identifiable {
    var id = UUID()
    var title: String
    var image: UIImage
    var description: String
}

struct CellView: View {
    var viewModel: CellViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.title)
            Image(uiImage: viewModel.image)
                .resizable()
                .cornerRadius(20)
                .frame(minHeight: 350, maxHeight: 350)
            Text(viewModel.description)
        }
        .padding()
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CellViewModel(
            title: "Amet commodo\nfacilisi nullam vehicula",
            image: UIImage.make(withColor: .red),
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
        CellView(viewModel: viewModel)
    }
}
