//
//  MeView.swift
//  SpendTracking
//
//  Created by Alex Wang on 9/15/23.
//

import SwiftUI

struct MeView: View {
    var body: some View {
        NavigationStack {
            Text("Me tab")
            .navigationTitle("Me")
        }
        
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
