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
                        .font(.body)
                        .foregroundColor(Color(.DarkText1))
                    Text("Duration: \(secondsToMinutesSecondsWithText(Int(event.eventDuration)))")
                        .font(.footnote)
                        .foregroundColor(Color(.DarkText2))
                        
                }
                Spacer(minLength: 30)
                
             
                Text(event.eventDescription)
                    .frame(width: 100, height: 50, alignment: .center)
                    .font(.subheadline)
                    .padding(8)
                    .background(Color(.CorPadraoCard))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                
                    
                    
            }
            .padding(8)
           
           
           
        
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard(event: Event())
    }
}
