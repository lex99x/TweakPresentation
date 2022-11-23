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
        VStack(alignment: .leading,spacing: 8){
            Text(apresentacao.title)
                .font(.system(size: 17))
                .bold()
                .foregroundColor(Color(.DarkText1))
            Text(apresentacao.descript)
                .font(.system(size: 17))
                .foregroundColor(Color(.DarkText1))
            HStack(spacing: 0){
                Image(systemName: "applewatch.radiowaves.left.and.right")
                    .foregroundColor(Color(.DarkText2))
                    
                if apresentacao.haptics == true{
                    Text("Haptics on Apple Watch abled")
                        .font(.system(size: 13))
                        .foregroundColor(Color(.DarkText2))
                }
                else{
                    Text("Haptics on Apple Watch disabled")
                        .font(.system(size: 13))
                        .foregroundColor(Color(.DarkText2))
                }
            }
            HStack(spacing: 8){
                Text("\(secondsToMinutesSeconds(apresentacao.totalTime))")
                    .font(.system(size: 15))
                    .foregroundColor(Color(.DarkText1))
                    .padding(7)
                    .background(Color(.CorPadraoCard))
                    .clipShape(Capsule())
                    
                Text("\(apresentacao.events.count) Events ")
                    .font(.system(size: 15))
                    .foregroundColor(Color(.DarkText1))
                    .padding(7)
                    .background(Color(.CorPadraoCard))
                    .clipShape(Capsule())
            }
        }
        
    }
}

struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView (apresentacao: Presentation())
    }
}
