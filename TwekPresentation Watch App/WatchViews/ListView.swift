//
//  ListView.swift
//  TwekPresentation Watch App
//
//  Created by Gabriel Dias Goncalves on 23/11/22.
//

import SwiftUI


struct ListView: View {
    
    @StateObject var counter = Counter()
    
    var body: some View {
        
        let apresentacoes = Decode(data: counter.count)

        NavigationView {
            
            if apresentacoes == [] {
                HStack (alignment: .center, spacing: 4) {
                    Image(systemName: "arrow.down")
                        .font(.caption)
                        .foregroundColor(Color(.DarkText2))
                    Text("Refresh your iPhone list.")
                        .font(.caption2)
                        .foregroundColor(Color(.DarkText2))
//                        .multilineTextAlignment(.center)
                }
                .scenePadding()
                .padding(.top,8)
            } else {
                VStack (alignment: .leading) {
                    
                    List(apresentacoes) { apresentacao in
                        NavigationLink(destination: PlayView(presentation : apresentacao), label: {
                            Text(apresentacao.title)
                        })
                        .listRowBackground(Color(.CorFundoCard).cornerRadius(8))
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
        .navigationBarBackButtonHidden()
      
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

