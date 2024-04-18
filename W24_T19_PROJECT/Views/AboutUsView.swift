// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735

import Foundation

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        VStack {
            
            Text("About Us")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 0)
                .font(.system(size: 40))
            
            Text("To Do List Mobile App, developed by")
                .padding(.top, 10)
                .font(.system(size: 15))
                
            
            Text("Team 19")
                .padding(.top, 0)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundStyle(.blue)
            
            Text("Divine Iyalla Falola")
                .padding(.top, 20)
                .font(.system(size: 25))
            
            Text("101394076")
                .padding(.top, 0)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundStyle(.blue)
            
            Text("Oluwatobi Hajarat Giwa")
                .padding(.top, 10)
                .font(.system(size: 25))
            
            Text("101303746")
                .padding(.top, 0)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundStyle(.blue)
            
            Text("Idris Oyelaja")
                .padding(.top, 10)
                .font(.system(size: 25))
            
            Text("101331074")
                .padding(.top, 0)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundStyle(.blue)
            
            Text("Mustafizur Rahman")
                .padding(.top, 10)
                .font(.system(size: 25))
            
            Text("<Student ID>")
                .padding(.top, 0)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundStyle(.blue)
            
            
            Text("George Brown College")
                .padding(.top, 30)
                .font(.system(size: 15))
            
        }
    }
}

struct ContentView_AboutUsView: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}

