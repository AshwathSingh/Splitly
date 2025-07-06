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
    @State private var restaurantName = ""

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
    
    var totalPerPersonWithoutTip: Double {
        let peopleCount  = Double(numberOfPeople + 2)
        let total =  checkAmount
        let grandTotal = total / peopleCount
        return grandTotal
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6).ignoresSafeArea()
                VStack {
                    Form {
                        Section {
                            HStack {
                                Text(currencySymbol)
                                    .foregroundColor(.gray)
                                TextField("Enter bill amount", value: $checkAmount, format: .number)
                                    .keyboardType(.decimalPad)
                            }
                        } header: {
                            Text("💵 Bill Amount")
                                .font(.headline)
                        }
                        
                        
                        Section {
                            TextField("Restaurant Name", text: $restaurantName)
                            Picker("Number of People", selection: $numberOfPeople) {
                                ForEach(2..<100) {
                                    Text("\($0) People")
                                }
                            }
                        } header: {
                            Text("🍽️ General Information")
                                .font(.headline)
                        }
                        
                        Section {
                            Picker("Tip Percentage", selection: $tipPercentage) {
                                ForEach(tipPercentages, id: \.self) {
                                    Text("\($0)%")
                                }
                            }
                            .pickerStyle(.segmented)
                        } header: {
                            Text("💁 Tip Percentage")
                                .font(.headline)
                        }
                        
                        
                    }
                    .scrollContentBackground(.hidden)
                    
                    HStack(spacing: 16) {
                        
                        VStack {
                            Text("Without Tip")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Text(totalPerPersonWithoutTip, format: .currency(code: currencyCode))
                                .font(.title3)
                                .bold()
                        }
                        .frame(maxWidth: .infinity, minHeight: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemGray6))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        .padding(.horizontal)
                        
                        // With Tip Box
                        VStack {
                            Text("With Tip")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Text(totalPerPerson, format: .currency(code: currencyCode))
                                .font(.title3)
                                .bold()
                        }
                        .frame(maxWidth: .infinity, minHeight: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemGray6))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            // Action goes here
                            print("Bill saved!")
                        }) {
                            Label("Save Bill", systemImage: "square.and.arrow.down.fill")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            checkAmount = 0
                            numberOfPeople = 2
                            tipPercentage = 0
                            restaurantName = ""
                        }) {
                            Label("Clear Bill", systemImage: "delete.right.fill")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 12)
            }
            .navigationTitle("🧾 Add A New Bill")

        }

    }
}

#Preview {
    Home()
}
