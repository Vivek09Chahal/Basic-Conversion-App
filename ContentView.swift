//
//  ContentView.swift
//  WeSplit
//
//  Created by Vivek Chahal on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var checkAmount = 0.0
    @State var numberOfPeople = 2
    @State var tipPercentage = 20
    
    @FocusState var amountIsFocused: Bool
    
    let tipPercentages = [10, 20, 30, 40, 50]
    
    var totalPerPerson:Double{
        //calculate the total per person here
        let peopleCount = Double(numberOfPeople+2)
        let tip = Double(tipPercentage)
        
        let tipvalue = checkAmount / 100 * tip
        let grandTotal = checkAmount + tipvalue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
}
    
    var body: some View{
        NavigationStack {
            Form{
                Section{
                    TextField("amount", value: $checkAmount, format: .currency(code: "IND"))
                        .keyboardType(.decimalPad) // to have keyboard as soon as we open app
                        .focused($amountIsFocused) // to bring done button
                    
                    Picker("Nummber of People", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    //.pickerStyle(.navigationLink)  // take to new screen to pick
                }
                Section("Tip Percentage"){
                    Picker("tipPercentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section{
                    Text(totalPerPerson , format: .currency(code: "IND"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
