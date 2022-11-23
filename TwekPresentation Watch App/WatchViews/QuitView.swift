//
//  QuitView.swift
//  PresentationAppWatch Watch App
//
//  Created by Alex A. Rocha on 14/11/22.
//

import SwiftUI

struct QuitView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                Text("Abandon practice?")
                    .font(.headline)
                    .fontWeight(.medium)
                
                Text("If you leave now, you will have to start again next time.")
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .fontWeight(.regular)
                    .padding(.top, 5)
            }
            
            VStack {
                Button("Abandon") {
                    print("Abandonando apresentação...")
                }
                Button("Cancel") {
                    print("Cancelando...")
                    dismiss()
                }
            }
            .padding(.top, 5)
            
        }
        
    }
}

struct QuitView_Previews: PreviewProvider {
    static var previews: some View {
        QuitView()
    }
}
