// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735

import Foundation

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
        
        var body: some View {
            VStack {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Name, Date, Category, Status... etc.", text: $searchText)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(30)
                .padding(10)

                // Sorting/Filtering Options
                HStack {
                    Button(action: {
                        // Action for sorting
                    }) {
                        HStack {
                            Image(systemName: "arrow.up.arrow.down")
                            Text("Recent")
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Action for changing sorting
                    }) {
                        HStack {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                            Text("Sort by")
                        }
                    }
                }
                .padding(.horizontal)

                // List of tasks
                List {
                    TaskView(priority: .high, taskName: "Exam Preparation", dueDate: "Till 4th May")
                    TaskView(priority: .medium, taskName: "Prepare for next lecture", dueDate: "Till 4th May")
                    TaskView(priority: .low, taskName: "Prepare for next lecture", dueDate: "Till 4th May")
                    // ... Add more tasks here
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Schedule")
        }
    }

    enum TaskPriority {
        case high, medium, low
    }

    struct TaskView: View {
        let priority: TaskPriority
        let taskName: String
        let dueDate: String
        
        var body: some View {
            HStack {
                priorityIcon
                VStack(alignment: .leading) {
                    Text(taskName)
                        .font(.headline)
                    Text(dueDate)
                        .font(.subheadline)
                }
                Spacer()
                Image(systemName: "checkmark.circle.fill") // Change according to the task status
            }
            .padding(.vertical, 8)
        }
        
        @ViewBuilder
        var priorityIcon: some View {
            switch priority {
            case .high:
                Image(systemName: "exclamationmark")
                    .foregroundColor(.red)
            case .medium:
                Image(systemName: "")
                    .foregroundColor(.yellow)
            case .low:
                Image(systemName: "")
                    .foregroundColor(.green)
            }
        }
    }

#Preview {
    SearchView()
}

