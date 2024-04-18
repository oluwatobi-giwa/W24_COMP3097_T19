// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735


import Foundation

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        ZStack {
            Image("launchscreen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            Text("Powered By Team 19")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
                .padding(.horizontal)
                .offset(y: UIScreen.main.bounds.height / 3)
        }
        
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}

