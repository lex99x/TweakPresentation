//
//  ContentView.swift
//  PresentationAppWatch Watch App
//
//  Created by Gabriel Dias Goncalves on 07/11/22.
//

import SwiftUI

struct ManualPresentationView: View {
    
    @State var presentation: SimplePresentation

    var body: some View {
        NavigationView {
            VStack {
                TimerView(presentation: presentation)
                EventCardShow(apresentacao: presentation)
            }
        }
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ManualPresentationView()
//    }
//}
