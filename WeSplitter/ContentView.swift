//
//  ContentView.swift
//  WeSplitter
//
//  Created by Harriet Mathew on 11/2/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var priceAmount = 0.0
    @State private var noOfPeople = 0
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var body: some View {
        Form {
            Section {
                TextField("Enter amount: ", value: $priceAmount, format: .currency(code: Locale.current.currency?.identifier ?? "AED"))
                    .keyboardType(.decimalPad)
            }
            Section {
                Text(priceAmount, format:.currency(code: Locale.current.currency?.identifier ?? "AED"))
            }
        }
    }
}

#Preview {
    ContentView()
}
