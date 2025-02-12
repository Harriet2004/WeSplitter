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
        
    var totalAmount : Double {
        let peopleCount = Double(noOfPeople)
        let tipValue = Double(tipPercentage)
        let tipAmount = priceAmount * (tipValue / 100)
        let finalValue = priceAmount + tipAmount
        let splitValue = finalValue / peopleCount
        return splitValue
    }
    
    var finalAmount : Double {
        let peopleCount = Double(noOfPeople)
        let tipValue = Double(tipPercentage)
        let tipAmount = priceAmount * (tipValue / 100)
        let finalValue = priceAmount + tipAmount
        return finalValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter amount:", value: $priceAmount, format: .currency(code: Locale.current.currency?.identifier ?? "AUD"))
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
                        ForEach(0...100, id: \.self) {
                            Text(($0), format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section ("Total amount for the check") {
                    Text(finalAmount, format:.currency(code: Locale.current.currency?.identifier ?? "AUD"))
                }
                
                Section ("Amount per person") {
                    Text(totalAmount, format:.currency(code: Locale.current.currency?.identifier ?? "AUD"))
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
