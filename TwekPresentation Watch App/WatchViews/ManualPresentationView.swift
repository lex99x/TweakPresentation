//
//  ContentView.swift
//  PresentationAppWatch Watch App
//
//  Created by Gabriel Dias Goncalves on 07/11/22.
//

import SwiftUI

struct ManualPresentationView: View {
    
    @State var presentation = getMockedPresentations()
//    @State private var showingSheet = false
    
    var body: some View {
        
//        let longPressGesture = LongPressGesture()
//            .onEnded({value in
//                showingSheet = true
//            })
        NavigationView{
            VStack {
                TimerView(presentation: presentation[0])
//                    .gesture(longPressGesture)
//                    .sheet(isPresented: $showingSheet) {
//                        ActionsView()
//                            .navigationBarHidden(true)
//                    }
                EventCardShow(apresentacao: presentation[0])
            }
        }
      
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ManualPresentationView()
    }
}

