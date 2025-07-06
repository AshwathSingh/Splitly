//
//  Home.swift
//  Splitly
//
//  Created by Ashwath Singh on 06/07/25.
//
import SwiftUI

struct Home: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20

    let tipPercentages = [0, 5, 10, 15, 20, 25, 30]

    var currencySymbol: String {
        Locale.current.currency?.identifier ?? "$"
    }

    var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }

    // Computed property for per person amount
    var totalPerPerson: Double {
        let peopleCount  = Double(numberOfPeople + 2)
        let tipSelected = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelected
        let total = tipValue + checkAmount
        let grandTotal = total / peopleCount
        return grandTotal
    }

    var body: some View {
        NavigationView {
            Form {
                // Bill input section
                Section("Bill Amount") {
                    HStack {
                        Text(currencySymbol)
                            .foregroundColor(.gray)
                        TextField("0.00", value: $checkAmount, format: .number)
                            .keyboardType(.decimalPad)
                    }
                }

                // People picker section
                Section("Number of People") {
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }

                // Tip picker section
                Section("Tip Percentage") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }

                // Output section
                Section("Per Person Amount") {
                    Text(totalPerPerson, format: .currency(code: currencyCode))
                        .font(.title3)
                }
            }
            .navigationTitle("Add A New Bill")
        }
    }
}

#Preview {
    Home()
}
