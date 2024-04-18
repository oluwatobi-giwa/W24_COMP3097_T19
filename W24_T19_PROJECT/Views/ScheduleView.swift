// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735i

import Foundation
import SwiftUI

struct ScheduleView: View {
    @State private var selectedCategory: String = "All"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink(destination: CreateTaskView()) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add Task")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                    }
                    .padding()

                    // Create a to-do list placeholder
                    Text("Create a to-do list")
                        .foregroundColor(Color.gray)

                    // Task categories
                    Picker("Category", selection: $selectedCategory) {
                        Text("All").tag("All")
                        Text("In-Progress").tag("In-Progress")
                        Text("Completed").tag("Completed")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding([.leading, .trailing])
                    .padding()

                    // Task list
                    ForEach(0..<3) { _ in
                        TaskRowView()
                    }
                }
                .navigationBarTitle("Schedule", displayMode: .inline)
                // .navigationBarItems(...) - Already implemented by you
            }
        }
    }
}



struct TaskRowView: View {
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark")
                .foregroundColor(.red) // Adjust color based on importance
            VStack(alignment: .leading) {
                Text("Exam Preparation")
                    .font(.headline)
                Text("Till 4th May")
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "checkmark.circle.fill")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}


