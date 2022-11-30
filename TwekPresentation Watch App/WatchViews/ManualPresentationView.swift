//
//  ContentView.swift
//  PresentationAppWatch Watch App
//
//  Created by Gabriel Dias Goncalves on 07/11/22.
//

import SwiftUI

struct ManualPresentationView: View {
    
    @State var presentation: SimplePresentation
    @State var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                TimerView(presentation: presentation)
                EventCardShow(apresentacao: presentation)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    HStack {
                        Image(systemName: "chevron.backward.circle.fill")
                            .foregroundColor(Color(.RoxoWatch))
                    }
                })
           }
        }
        .sheet(isPresented: $showingSheet) {
            QuitView()
        }
        
    }
    
}
    
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ManualPresentationView()
//    }
//}
