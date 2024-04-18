// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735

import Foundation

import SwiftUI

struct MenuView: View {
    @State private var shouldLogout = false
    
    var body: some View {
        
        VStack {
            
                    // User profile picture and info
                    VStack(spacing: 16) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .padding(.top)

                        Button(action: {
                            // Action for adding a photo
                        }) {
                            Text("Add Photo")
                                .foregroundColor(.blue)
                        }

                        Text("Idris")
                            .font(.title2)

                        Text("idris@gmail.com")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom)

                    // Settings options
                    List {
                        SettingsRow(iconName: "pencil", text: "Edit Personal Info")
                        SettingsRow(iconName: "envelope", text: "Change Email")
                        SettingsRow(iconName: "lock", text: "Change Password")
                        SettingsRow(iconName: "gear", text: "Preference Settings")
                        NavigationLink(destination: ScheduleView()) {
                                SettingsRow(iconName: "checkmark.circle", text: "Clear Completed Task")
                            }
                        SettingsRow(iconName: "doc.text", text: "Terms of Use")
                        SettingsRow(iconName: "info.circle", text: "About Us")
                    }
                    .listStyle(GroupedListStyle())
            
            

                    // Log out button
            NavigationView {
                VStack {
                    // Your other content here
                    
                    NavigationLink(destination: LoginView(), isActive: $shouldLogout) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        // Perform logout actions here
                        shouldLogout = true
                    }) {
                        HStack {
                            Image(systemName: "power")
                            Text("Log out")
                        }
                        .foregroundColor(.blue)
                    }
                }
            }
                    .padding()
                }
                .navigationTitle("User Settings")
                .navigationBarTitleDisplayMode(.inline)
            }
        }

        struct SettingsRow: View {
            var iconName: String
            var text: String
            
            var body: some View {
                HStack {
                    Image(systemName: iconName)
                    Text(text)
                }
            }
        }

#Preview {
    MenuView()
}

