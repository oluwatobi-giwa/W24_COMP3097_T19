// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735

import SwiftUI
import CoreData

struct SignupView: View {
    @StateObject private var userData = UserData()
    
    // Error messages
    @State private var errorAlert: AlertItem?
    
    @State private var isFormValid: Bool = false
    @State private var registrationSuccess: Bool = false // Track registration success
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sign Up")
                    .font(.system(size: 40, weight: .bold))
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                Text("Sign Up to personalize your experience")
                    .padding(.top, 10)
                
                VStack(spacing: 10) {
                    TextField("First Name", text: $userData.firstName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                    
                    TextField("Last Name", text: $userData.lastName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                    
                    TextField("Email", text: $userData.email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .autocapitalization(.none) // Disable autocapitalization for email
                    
                    SecureField("Password", text: $userData.password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                    
                    SecureField("Confirm Password", text: $userData.confirmPassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5.0)
                }
                .padding(.vertical, 20)
                
                Button(action: {
                    self.validateForm()
                }) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5.0)
                }
                .alert(item: $errorAlert) { errorAlert in
                    Alert(
                        title: Text(errorAlert.title),
                        message: Text(errorAlert.message),
                        dismissButton: .default(Text("OK")) {
                            self.errorAlert = nil // Clear the error alert
                        }
                    )
                }
                
                // Social media sign-in buttons
                
                NavigationLink(destination: LoginView()) {
                    Text("Already have an account? Sign In")
                        .padding(.top, 20)
                        .foregroundColor(.blue)
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
    
    private func validateForm() {
        guard userData.isValid() else {
            errorAlert = AlertItem(title: "Error", message: "All fields are required")
            return
        }
        
        if !isValidEmail(userData.email) {
            errorAlert = AlertItem(title: "Error", message: "Invalid email format")
            return
        }
        
        if userData.password.count < 6 {
            errorAlert = AlertItem(title: "Error", message: "Password must be at least 6 characters long")
            return
        }
        
        if userData.password != userData.confirmPassword {
            errorAlert = AlertItem(title: "Error", message: "Passwords do not match")
            return
        }
        
        // Check if a user with the same email already exists
        if isUserAlreadyRegistered(email: userData.email) {
            errorAlert = AlertItem(title: "Error", message: "This email is already registered")
            return
        }
        
        // If all validations pass, show success message and save user data
        userData.save()
        errorAlert = AlertItem(title: "Success", message: "Registration Successful")
        registrationSuccess = true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        // Implement email validation logic here
        // For simplicity, we check if the email contains '@'
        return email.contains("@")
    }
    
    // Function to check if a user with the same email already exists
    private func isUserAlreadyRegistered(email: String) -> Bool {
        let context = PersistenceController.shared.container.viewContext
        
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let users = try context.fetch(fetchRequest)
            return !users.isEmpty
        } catch {
            print("Error checking user existence: \(error.localizedDescription)")
            return false
        }
    }
}

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

class UserData: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    func isValid() -> Bool {
        return !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
    
    func save() {
        let context = PersistenceController.shared.container.viewContext
        
        let newUser = Users(context: context)
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.email = email
        newUser.password = password
        
        do {
            try context.save()
        } catch {
            // Handle the error appropriately, such as showing an alert
            print("Error saving user data: \(error.localizedDescription)")
        }
    }
}

