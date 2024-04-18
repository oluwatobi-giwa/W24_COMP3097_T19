// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735

import SwiftUI
import CoreData

struct CreateTaskView: View {
    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    @State private var selectedCategory: String = "Select Category"
    @State private var selectedDate = Date()
    @State private var showCalendar = false
    @State private var validationError: String?
    @State private var showAlert = false // Add this state variable
    @State private var navigateToAboutUs = false // Add this state variable
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Create Task")
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
                    CalendarView(selectedDate: $selectedDate, isPresented: $showCalendar)
                }
                
                Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                    .padding(.horizontal)
                
                Picker("Select Category", selection: $selectedCategory) {
                    Text("Low").tag("Low")
                    Text("Moderate").tag("Moderate")
                    Text("High!!!").tag("High!!!")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Button(action: {
                    addTask()
                }) {
                    Text("Add Task")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5.0)
                        .padding(.horizontal)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(validationError ?? ""), dismissButton: .default(Text("OK")))
                }
                
                NavigationLink(destination: MenuView(), isActive: $navigateToAboutUs) {
                    EmptyView()
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
    
    struct CalendarView: View {
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
    
    private func addTask() {
        guard isFormValid() else { return }
        
        let context = PersistenceController.shared.container.viewContext
        let newTask = Tasks(context: context)
        newTask.taskTitle = taskTitle
        newTask.taskDescription = taskDescription
        newTask.taskDate = selectedDate
        newTask.taskCategory = selectedCategory
        
        
        do {
            try context.save()
            // Reset fields after saving
            taskTitle = ""
            taskDescription = ""
            selectedCategory = "Select Category"
            selectedDate = Date()
            
            // Navigate to AboutUsView after saving
            navigateToAboutUs = true
        } catch {
            print("Error saving task: \(error.localizedDescription)")
        }
    }
    
    private func isFormValid() -> Bool {
        if taskTitle.isEmpty || taskDescription.isEmpty || selectedCategory == "Select Category" {
            validationError = "All fields are required"
            return false
        }
        return true
    }
}

