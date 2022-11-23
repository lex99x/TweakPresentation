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
        List(Decode(data: counter.count)) {
            Text("ola")
        }
           
    }
        
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
