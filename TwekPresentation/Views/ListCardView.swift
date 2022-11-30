//
//  ListCardView.swift
//  PresentationsApp
//
//  Created by Gabriel Dias Goncalves on 21/11/22.
//

import SwiftUI

struct ListCardView: View {
    var apresentacao : Presentation
    
    var body: some View {
        VStack(alignment: .leading,spacing: 4){
            Text(apresentacao.title)
                .font(.body)
                .bold()
                .foregroundColor(Color(.DarkText1))
            
            Text(apresentacao.descript)
                .font(.body)
                .foregroundColor(Color(.DarkText1))
            
            HStack(spacing: 4){
                Image(systemName: "applewatch.radiowaves.left.and.right")
                    .font(.subheadline)
                    .foregroundColor(Color(.DarkText2))
                
                if apresentacao.haptics == true{
                    Text("Haptics on Apple Watch enabled")
                        .font(.subheadline)
                        .foregroundColor(Color(.DarkText2))
                    
                }
                    else{
                        Text("Haptics on Apple Watch disabled")
                            .font(.system(size: 13))
                            .foregroundColor(Color(.DarkText2))
                    }
                
             
                Spacer()
            }.padding(.bottom,8)
            
            HStack(spacing: 8){
                Text("\(secondsToMinutesSeconds(apresentacao.totalTime))")
                    .font(.subheadline)
                    .foregroundColor(Color(.DarkText1))
                    .padding(.top,6)
                    .padding(.leading,12)
                    .padding(.bottom,6)
                    .padding(.trailing,12)
                    .background(Color(.CorPadraoCard))
                    .clipShape(Capsule())
                
                Text("\(apresentacao.events.count) Events")
                    .font(.subheadline)
                    .foregroundColor(Color(.DarkText1))
                    .padding(.top,6)
                    .padding(.leading,12)
                    .padding(.bottom,6)
                    .padding(.trailing,12)
                    .background(Color(.CorPadraoCard))
                    .clipShape(Capsule())
            }
        }
        .padding()
    }
}

struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView (apresentacao: Presentation())
    }
}
