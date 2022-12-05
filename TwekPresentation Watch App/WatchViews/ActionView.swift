//
//  ActionsViews.swift
//  PresentationAppWatch Watch App
//
//  Created by Alex A. Rocha on 09/11/22.
//

import SwiftUI

struct ActionsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var mainTimer = 0
    @State var totalTime = 50
    @State var timerColor = Color.white
    
    @State private var isShowingAlert = false
    private static let alertMessage = "Leave practice?\n\nIf you leave now, you will have to start again next time."
    
    var body: some View {
        
        ScrollView {
            
            Text("Ensaio pausado")
                .font(.headline)
                .fontWeight(.medium)
            
            if totalTime >= 3600 {
                Text("\(secondsToHoursMinutesSeconds(mainTimer)) / \( secondsToHoursMinutesSeconds(totalTime))")
                    .foregroundColor(timerColor)
                    .font(.headline)
                    .fontWeight(.medium)
            } else {
                Text("\(secondsToMinutesSeconds(mainTimer)) / \( secondsToMinutesSeconds(totalTime))")
                    .foregroundColor(timerColor)
                    .font(.headline)
                    .fontWeight(.medium)
            }
            
            Button("Retomar") {
                print("Retomando ensaio...")
                dismiss()
            }
            .background(Color(.RoxoWatch))
            .clipShape(Capsule())
            
            Button("Recomeçar") {
                print("Recomeçando ensaio...")
            }
            .background(Color(.RoxoWatch))
            .clipShape(Capsule())
            
            Button("Encerrar") {
                print("Apresentando alerta de encerramento...")
                isShowingAlert.toggle()
            }
            .background(Color(.RoxoWatch))
            .clipShape(Capsule())
            .alert(ActionsView.alertMessage, isPresented: $isShowingAlert) {
            
                Button("Leave") {
                    print("Encerrando ensaio...")
                }
                
                Button("Cancel", role: .cancel, action: {})
    
            }
            
        }
        
    }
}

struct ActionsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionsView()
    }
}
