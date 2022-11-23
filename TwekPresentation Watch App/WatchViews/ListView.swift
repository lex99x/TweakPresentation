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
        if Decode(data: counter.count) == []{
            Text("Crie uma apresentacao no watch e toque aqui")
        }
        else{
            List(Decode(data: counter.count)) { apresentacao in
                Text(apresentacao.title)
            }
            //        Text("ola")
            //            .onTapGesture {
            //                print(Decode(data: counter.count))
            //            }
            
            
        }
    }
        
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}




