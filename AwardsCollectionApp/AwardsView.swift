//
//  AwardsView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct AwardsView: View {
    let awards = Award.getAwards()
    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    
    var body: some View {
        NavigationView {
            CustomGridView(items: activeAwards, columns: 2) { sizeItem, award in
                VStack {
                    award.awardView
                    Text(award.title)
                }
                .padding()
                .frame(width: sizeItem, height: sizeItem)
            }
            .navigationBarTitle("Your awards: \(activeAwards.count)")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
