//
//  CreateEventModal.swift
//  PresentationsApp
//
//  Created by Alex A. Rocha on 16/11/22.
//

import SwiftUI

enum EventType {
    case none, keywords, color, image
}

struct CreateEventModal: View {
    
    @Environment(\.dismiss) var dismiss
    
    var presentation: Presentation
    @State private var event = Event()
    
    @State private var selectedStartTime = DayTime()
    @State private var selectedEndTime = DayTime()
    @State private var selectedEventType: EventType = .none
    
    @State private var showStartPicker = false
    @State private var showEndPicker = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Event details") .foregroundColor(Color(.DarkText2))) {
                        
                        TextField("Title", text: $event.eventTitle)
                            .foregroundColor(Color(.DarkText1))
                        TextField("Memory Trigger", text: $event.eventDescription)
                            .foregroundColor(Color(.DarkText1))
                        
                        HStack {
                            Text("Starts at")
                            Spacer()
                            Button(formatDayTime(hour: selectedStartTime.hour,
                                                 minute: selectedStartTime.minute,
                                                 second: selectedStartTime.second)) {
                                showStartPicker.toggle()
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background {
                                Color(.CorPadraoCard)
                            }
                            .cornerRadius(8)
                            .foregroundColor(showStartPicker ? Color(.RoxoWatch) : Color(.white))
                            
                        }
                        .foregroundColor(Color(.DarkText1))
                        
                        if showStartPicker {
                            
                            HStack {
                                
                                Picker("", selection: $selectedStartTime.hour) {
                                    ForEach(0...23, id: \.self) { hour in
                                        Text("\(hour)")
                                    }
                                }
                                .pickerStyle(.wheel)
                                Text("hours")
                                
                                Picker("", selection: $selectedStartTime.minute) {
                                    ForEach(0...59, id: \.self) { minute in
                                        Text("\(minute)")
                                    }
                                }
                                .pickerStyle(.wheel)
                                Text("min")
                                
                                Picker("", selection: $selectedStartTime.second) {
                                    ForEach(0...59, id: \.self) { second in
                                        Text("\(second)")
                                    }
                                }
                                .pickerStyle(.wheel)
                                Text("seg")
                                
                            }
                            .frame(height: 50)
                            
                        }
                        
                        HStack {
                            Text("Ends at")
                            Spacer()
                            Button(formatDayTime(hour: selectedEndTime.hour,
                                                 minute: selectedEndTime.minute,
                                                 second: selectedEndTime.second)) {
                                showEndPicker.toggle()
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background {
                                Color(.CorPadraoCard)
                            }
                            .cornerRadius(8)
                            .foregroundColor(showEndPicker ? Color(.RoxoWatch) : Color(.white))
                        }
                        .foregroundColor(Color(.DarkText1))
                        
                        if showEndPicker {
                            
                            HStack {
                                
                                Picker("", selection: $selectedEndTime.hour) {
                                    ForEach(0...23, id: \.self) { hour in
                                        Text("\(hour)")
                                    }
                                }
                                .pickerStyle(.wheel)
                                Text("hours")
                                
                                Picker("", selection: $selectedEndTime.minute) {
                                    ForEach(0...59, id: \.self) { minute in
                                        Text("\(minute)")
                                    }
                                }
                                .pickerStyle(.wheel)
                                Text("min")
                                
                                Picker("", selection: $selectedEndTime.second) {
                                    ForEach(0...59, id: \.self) { second in
                                        Text("\(second)")
                                    }
                                }
                                .pickerStyle(.wheel)
                                Text("sec")
                                
                            }
                            .frame(height: 50)
                            
                        }
                        
                    }
                    .listRowBackground(Color(.CorFundoTextFieldsBo3))
//                    Section(header:
//                                Text("Memory trigger"),
//                            footer:
//                                Text("Choose a memory trigger type to customize your event.")
//                        .font(.system(size: 11))) {
//                            
////                            Picker("Type", selection: $selectedEventType) {
////                                Text("None").tag(EventType.none)
////                                Text("Keywords").tag(EventType.keywords)
////                                Text("Color").tag(EventType.color)
////                                Text("Image").tag(EventType.image)
////                            }
//                            
//                        }
//                        .listRowBackground(Color(.CorFundoTextFieldsBo3))
                }
                .scrollContentBackground(.hidden)
                .background(
                    Color(.CorFundoCard)
                )
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(Color(.RoxoWatch))
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save") {
                        
                        event.startTimeSeg = dayTimeToSeconds(hour: selectedStartTime.hour,
                                                              minute: selectedStartTime.minute,
                                                              second: selectedStartTime.second)
                        
                        event.endTimeSeg = dayTimeToSeconds(hour: selectedEndTime.hour,
                                                            minute: selectedEndTime.minute,
                                                            second: selectedEndTime.second)
                        
                        event.calcDuration()
                        
                        presentation.log()
                        event.log()
                        event.save(presentation: presentation)
                        
                        
                        dismiss()
                        
                    }
                    .foregroundColor(Color(.RoxoWatch))
                }
                
            }
            .navigationTitle(Text("New Event"))
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct CreateEventModal_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventModal(presentation: Presentation())
    }
}

