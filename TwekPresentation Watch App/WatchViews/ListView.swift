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
        NavigationView{
            VStack{
                let apresentacoes = Decode(data: counter.count)
                List(apresentacoes) { apresentacao in
                    
                    NavigationLink(destination: PlayView(presentation :apresentacao), label: {
                        Text(apresentacao.title)
                    })
                    
                }
                .scrollContentBackground(.hidden)
               
                if apresentacoes == [] {
                    HStack{
                        Image(systemName: "arrow.clockwise")
                        Text("Refresh in your iphone")
                            .font(.system(size: 12))
                            .foregroundColor(Color(.DarkText1))
                            .multilineTextAlignment(.center)
                    }
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

