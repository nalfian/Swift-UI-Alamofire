//
//  MovieDetail.swift
//  MovieSwiftUi
//
//  Created by Unknown on 05/02/20.
//  Copyright © 2020 AsiaQuest Indonesia. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 180, alignment: .center)
            Text("Title Movie")
                .padding(.top, 9)
            Text("Description")
                .padding(.top, 5)
                .font(.caption)
        }
        .padding(9)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail()
    }
}
