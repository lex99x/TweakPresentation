//
//  CreatePresentationModal.swift
//  PresentationsApp
//
//  Created by Gabriel Dias Goncalves on 15/11/22.
//

import SwiftUI

struct CreatePresentationModal: View {
    
    @Environment(\.presentationMode) var cancelar
    
    @State var presentation = Presentation()
    @State var selectedDuration = DayTime()
    @State var pickerShow = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Presentation Details")) {
                    
                    TextField("Title", text: $presentation.title)
                    TextField("Description (optional)", text: $presentation.descript)
                    
                    HStack {
                        Text("Duration")
                        Spacer()
                        Button(formatDayTime(hour: selectedDuration.hour,
                                             minute: selectedDuration.minute,
                                             second: selectedDuration.second)) {
                            pickerShow.toggle()
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background {
                            Color(.CorPadraoCard)
                        }
                        .cornerRadius(8)
                        .foregroundColor(pickerShow ? Color(.RoxoWatch) : Color(.white))
                    }
                    
                    if pickerShow {
                        
                        HStack {
                            Picker("", selection: $selectedDuration.hour) {
                                ForEach(0...24, id: \.self) { hour in
                                    Text("\(hour)")
                                }
                            }
                            .pickerStyle(.wheel)
                            Text("hours")
                            Picker("", selection: $selectedDuration.minute) {
                                ForEach(0...59, id: \.self) { minute in
                                    Text("\(minute)")
                                }
                            }
                            .pickerStyle(.wheel)
                            Text("min")
                            Picker("", selection: $selectedDuration.second) {
                                ForEach(0...59, id: \.self) { second in
                                    Text("\(second)")
                                }
                            }
                            .pickerStyle(.wheel)
                            Text("sec")
                        }
                        .foregroundColor(Color(.DarkText1))
                        .frame(height: 50)
                        
                    }
                    
                }.listRowBackground(Color(.DarkBG3))
                
                Section(header: Text("Preferences"),
                        footer: Text("Haptics feedbacks happen at the end of each event while practicing with your Apple Watch.")
                                    .font(.footnote)) {
                    
                    Toggle(isOn: $presentation.haptics) {
                        Text("Haptics feedback")
                    }
                    .tint(Color(.RoxoWatch))
                    
                }.listRowBackground(Color(.DarkBG3))
            }
            .scrollContentBackground(.hidden)
            .background(Color(.CorFundoCard))
            .navigationBarTitle("New Presentation", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        cancelar.wrappedValue.dismiss()
                    }
                    .foregroundColor(Color(.RoxoWatch))
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        
                        presentation.totalTime = dayTimeToSeconds(hour: selectedDuration.hour,
                                                                  minute: selectedDuration.minute,
                                                                  second: selectedDuration.second)
                        presentation.save()
                        cancelar.wrappedValue.dismiss()
                    }
                    .foregroundColor(Color(.RoxoWatch))
                }
            }
            
        }
    }
    
}

struct CreatePresentationModal_Previews: PreviewProvider {
    static var previews: some View {
        CreatePresentationModal()
    }
}

