//
//  EventCardView.swift
//  PresentationsApp
//
//  Created by Alex A. Rocha on 21/11/22.
//

import SwiftUI

struct EventCardView: View {
    
    
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(String(secondsToMinutesSeconds(Int(event.eventDuration))))
                .foregroundColor(Color(.DarkText2))
            ZStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(event.eventTitle)
                                .foregroundColor(Color(.DarkText1))
                            Text(event.eventDescription)
                                .foregroundColor(Color(.DarkText2))
                        }
                        Spacer()
                        Text("Keywords or, 3 lines maximum.")
                            .padding(.horizontal, 15)
                            .padding(.vertical, 15)
                            .foregroundColor(Color(.DarkText1))
                            .background(Color(.DarkBG4))
                    }
                    .padding()
                }
                .background(Color(.DarkBG3))
                .cornerRadius(10)
            }
        }
    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView(event: Event())
    }
}

