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
//                    Text("")
//                        .font(.system(size: 13))
//                        .foregroundColor(Color(.RoxoWatch))
                    Text(event.eventTitle)
                        .font(.system(size: 17))
                        .foregroundColor(Color(.DarkText1))
                    Text("Duration: \(secondsToMinutesSecondsWithText(Int(event.eventDuration)))")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.DarkText2))
                        
                }
                Spacer()
                
             
                Text(event.eventDescription)
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
