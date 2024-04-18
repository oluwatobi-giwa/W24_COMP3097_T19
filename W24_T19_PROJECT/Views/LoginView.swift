// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735

import SwiftUI
import CoreData

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginError: String? // Track login error
    @State private var isLoggedIn: Bool = false // Track login status
    @State private var loggedInUserName: String = "" // Track logged-in user's name
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Log in")
                    .font(.system(size: 40, weight: .bold))
                    .fontWeight(.bold)
                    .padding()
                
                Text("Welcome back! Please follow the instructions to sign in")
                    .padding(10)
                
                VStack(spacing: 10) {
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                }
                .padding(.vertical, 20)
                
                Button(action: {
                    self.attemptLogin()
                }) {
                    Text("Sign in")
                        .frame(maxWidth: .infinity)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5.0)
                }
                
                // Error message if login fails
                if let error = loginError {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
                
                NavigationLink(destination: ResetPasswordView()) {
                    Text("Forgot Password? Reset Password")
                        .padding(.top, 0)
                }
                .padding(.top, 15)
                
                Text("OR")
                
                // Social media sign-in buttons
                
                HStack {
                    Button(action: {
                        // Handle Apple sign-in
                        print("Apple button tapped")
                    }) {
                        Image("apple")
                    }
                    Button(action: {
                        // Handle Google sign-in
                        print("Google button tapped")
                    }) {
                        Image("google")
                    }
                    
                    Button(action: {
                        // Handle Facebook sign-in
                        print("Facebook button tapped")
                    }) {
                        Image("facebook")
                    }
                }
                .padding(.vertical, 10)
                
                NavigationLink(
                    destination: HomeView(userName: loggedInUserName), // Pass the user's name to HomeView
                    isActive: $isLoggedIn,
                    label: {
                        EmptyView()
                    }
                )
                
                NavigationLink(destination: SignupView()) {
                    Text("Don't have an account? Sign Up")
                        .padding(.top, 10)
                }
            }
            .padding()
            .background(Color(red: 236/255, green: 244/255, blue: 255/255))
            .cornerRadius(30.0)
            .padding(20)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .shadow(color: .gray, radius: 10)
        }
    }
    
    // Function to attempt login
    private func attemptLogin() {
        let context = PersistenceController.shared.container.viewContext
        
        // Create fetch request for Users entity with email and password predicate
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
        
        do {
            // Fetch data from CoreData with predicate
            let users = try context.fetch(fetchRequest)
            
            if let user = users.first {
                // User found, login successful
                loggedInUserName = "\(user.firstName)" // Get the logged-in user's name
                isLoggedIn = true // Navigate to HomeView
            } else {
                // No user found with the provided email and password
                loginError = "Incorrect email or password"
            }
        } catch {
            // Handle fetch errors
            print("Error fetching data: \(error.localizedDescription)")
            loginError = "An error occurred"
        }
    }
}
