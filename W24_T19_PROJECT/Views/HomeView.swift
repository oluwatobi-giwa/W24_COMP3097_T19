// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        NavigationLink(destination: SearchView()) {
            HStack {
                TextField("Search", text: $searchText)
            
                Image(systemName: "magnifyingglass")
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            .padding()
        }
      
        .cornerRadius(20)
      
    }
}


struct HomeView: View {
    var userName: String
    @State private var selectedCategory: String = "All"
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    // Search Bar
                    SearchBar(searchText: $searchText)

                    // Greeting section
                    Text("Welcome, \(userName)")
                        .font(.largeTitle)
                        .padding()
                    
                    NavigationLink(destination: CreateTaskView()) {
                            Text("Create Task")
                                .frame(maxWidth: .infinity)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(5.0)
                        }
                    .padding(.horizontal)

                    // Today's tasks progress
                    HStack {
                        ProgressView(value: 4, total: 10)
                            .progressViewStyle(CircularProgressViewStyle(trackColor: .gray, progressColor: .blue))
                            .frame(width: 40, height: 40) // Adjust to match the desired size
                            VStack(alignment: .leading) {
                                Text("Today")
                            .font(.caption)
                                Text("04/10 Tasks")
                            .font(.title)
                                    }
                                }
                    .padding([.leading, .trailing, .top])

                    // Task categories
                    Picker("Category", selection: $selectedCategory) {
                        Text("All").tag("All")
                        Text("In-Progress").tag("In-Progress")
                        Text("Completed").tag("Completed")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding([.leading, .trailing])

                    // Projects section
                    Text("Projects")
                        .font(.headline)
                        .padding(.leading)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ProjectView(projectName: "Mobile App Group Project", dueDate: "Till 4th May", taskCount: 8, progress: 0.5)
                            ProjectView(projectName: "Capstone Project", dueDate: "Till 4th May", taskCount: 8, progress: 0.7)
                            // Add more projects here
                        }
                        .padding(.horizontal)
                    }

                    // Tasks section
                    Text("Tasks")
                        .font(.headline)
                        .padding(.leading)
                    VStack(spacing: 10) {
                        ActivityView(taskName: "Exam Preparation", importance: .high)
                        // Add more tasks here
                    }
                    .padding(.horizontal)
                    
                    
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct ProjectView: View {
        var projectName: String
        var dueDate: String
        var taskCount: Int
        var progress: Float
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(projectName)
                    .font(.headline)
                Text(dueDate)
                    .font(.subheadline)
                Text("\(taskCount) Tasks")
                    .font(.caption)
                ProgressView(value: progress)
            }
            .padding()
            .frame(width: 220, height: 150)
            .background(Color.blue)
            .cornerRadius(10)
        }
    }


    struct ActivityView: View {
        var taskName: String
        var importance: TaskImportance
        
        var body: some View {
            HStack {
                importance.icon
                Text(taskName)
                    .font(.headline)
                Spacer()
                Image(systemName: "checkmark.circle")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }

    enum TaskImportance {
        case high, medium, low
        
        var icon: some View {
            switch self {
            case .high:
                return Image(systemName: "exclamationmark").foregroundColor(.red)
            case .medium:
                return Image(systemName: "exclamationmark.triangle").foregroundColor(.yellow)
            case .low:
                return Image(systemName: "checkmark.circle").foregroundColor(.green)
            }
        }
    }

struct CircularProgressViewStyle: ProgressViewStyle {
    var trackColor: Color
    var progressColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Circle()
                .stroke(lineWidth: 5.0)
                .opacity(0.3)
                .foregroundColor(trackColor)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(fractionCompleted, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(progressColor)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: fractionCompleted)
        }
    }
}


struct ContentView_HomeView: PreviewProvider {
    static var previews: some View {
        HomeView(userName: "Divine")
    }
}

