//
//  EventCard.swift
//  TwekPresentation
//
//  Created by Gabriel Dias Goncalves on 29/11/22.
//

import SwiftUI

struct EventCard: View {
    
    var event: Event
    
    var body: some View {
       
           
            HStack{
                VStack(alignment: .leading){
                    Text(event.)
                        .font(.system(size: 13))
                        .foregroundColor(Color(.RoxoWatch))
                    Text("titulo do evento")
                        .font(.system(size: 17))
                        .foregroundColor(Color(.DarkText1))
                    Text("duracao: 15 segundos")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.DarkText2))
                        
                }
                Spacer()
                
             
                Text("Keywords or short sentence, 3 lines maximum.")
                    .font(.system(size: 12))
                    .padding(3)
                    .background(Color(.CorPadraoCard))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                
                    
                    
            }
            .padding()
           
           
           
        
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard(event: Event())
    }
}
