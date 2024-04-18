//
//  ContentView.swift
//  W24_T19_PROJECT
//
//  Created by Divine Falola on 2024-04-17.
//

// Oluwatobi Hajarat Giwa: 101331074
// Idris Oyelaja: 101303746
// Divine Falola: 101394076
// Mustafizur Rahman: 101383735

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("getstarted")
                    
                VStack {
                    Spacer()
                    
                    Button(action: {
                        print("Get Started button pressed")
                    }) {
                        HStack {

                            NavigationLink(destination: SignupView()) {
                                Text("Get Started")
                                .font(.title)
                                .foregroundColor(.black)
                            
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(.black)
                                    .font(.title)
                            }
                        }
                        .padding()
                    }
                    
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

