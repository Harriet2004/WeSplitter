//
//  ContentView.swift
//  WeSplitter
//
//  Created by Harriet Mathew on 11/2/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var priceAmount = 0.0
    @State private var noOfPeople = 2
    @State private var tipPercentage = 0
    @FocusState private var isFocussed: Bool
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalAmount : Double {
        let peopleCount = Double(noOfPeople)
        let tipValue = Double(tipPercentage)
        let tipAmount = priceAmount * (tipValue / 100)
        let finalValue = priceAmount + tipAmount
        let splitValue = finalValue / peopleCount
        return splitValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter amount:", value: $priceAmount, format: .currency(code: Locale.current.currency?.identifier ?? "AED"))
                        .keyboardType(.decimalPad)
                        .focused($isFocussed)
                    
                    Picker("Number of people", selection: $noOfPeople) {
                        ForEach(2...100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section ("How much do you want to tip?") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text(($0), format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(totalAmount, format:.currency(code: Locale.current.currency?.identifier ?? "AED"))
                }
            }
            .navigationTitle("WeSplitter")
            .toolbar {
                if isFocussed {
                    Button("Done") {
                        isFocussed = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
