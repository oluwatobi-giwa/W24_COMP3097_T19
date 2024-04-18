// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735

import Foundation
import SwiftUI

struct EditTaskView: View {
    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    @State private var selectedCategory: String = "Select Category"
    @State private var selectedDate = Date()
    @State private var showCalendar = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Edit Task")
                    .font(.system(size: 40, weight: .bold))
                    .fontWeight(.bold)
                    .padding(.top, 10)
                TextField("Task Title", text: $taskTitle)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                
                TextField("Task Description", text: $taskDescription)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                
                Button(action: {
                    showCalendar.toggle()
                }) {
                    Text("Select Date")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5.0)
                        .padding(.horizontal)
                }
                .sheet(isPresented: $showCalendar) {
                    EditCalendarView(selectedDate: $selectedDate, isPresented: $showCalendar)
                }
                
                Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                    .padding(.horizontal)
                
                Picker("Select Category", selection: $selectedCategory) {
                    Text("Low").tag("Low")
                    Text("Medium").tag("Medium")
                    Text("High!!!").tag("High!!!")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                NavigationLink(destination: AboutUsView()) {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5.0)
                        .padding(.horizontal)
                    
                }
                Spacer()
                    
            }
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}

struct EditCalendarView: View {
    @Binding var selectedDate: Date
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Spacer()
            
            Button("Done") {
                isPresented.toggle()
            }
            .padding()
        }
    }
}



struct ContentView_EditTaskView: PreviewProvider {
    static var previews: some View {
        EditTaskView()
    }
}

