// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735

import Foundation

import SwiftUI

struct ResetPasswordView: View {
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Reset Password")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                
                VStack(spacing: 10) {
                    
                    SecureField("Password", text: $currentPassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)

                        SecureField("Password", text: $newPassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)

                        SecureField("Password", text: $confirmPassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                }
                .padding(.vertical, 20)
                
                Button(action: {
                    // Handle login
                    print("Reset Password button tapped")
                }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5.0)
                }
                
                // NavigationLink(destination: ResetPasswordView()) {
                //     Text("Forgot Password? Reset Password")
                //         .padding(.top, 20)
                // }
                
             
                .padding(.vertical, 20)
                
                 NavigationLink(destination: MenuView()) {
                     Text("Don't have an account? Sign Up")
                         .padding(.top, 20)
                 }
                
            }
            .padding()
            .background(Color(red: 236/255, green: 244/255, blue: 255/255))
            .cornerRadius(20.0)
            .padding()
//            .navigationBarTitle("Login", displayMode: .inline)
        }
    }
}

struct ContentView_ResetPasswordView: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}

