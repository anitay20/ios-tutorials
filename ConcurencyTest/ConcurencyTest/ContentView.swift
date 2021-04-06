//
//  ContentView.swift
//  ConcurencyTest
//
//  Created by anita on 3/23/21.
//

import SwiftUI

struct ContentView: View {
    
    let operation = CalculatePrimeOperation()
    @State private var busyButton = false
    
    var body: some View {
        VStack {
            Spacer()
            DatePicker(selection: .constant(Date()), label: { Text("Date")})
                //            DatePicker(selection: .constant(Date()), label: { Text("Date")})
                .labelsHidden()
            
            Button(action: calculatePrimes, label: {
                Text("Calculate Primes")
                    .disabled(busyButton)
            })
            Spacer()
            
        }
    }
    
    func calculatePrimes() {
        busyButton = true
        DispatchQueue.global(qos: .userInitiated).async {
            for number in 0...1_000_000 {
                let isPrimeNumber = self.isPrime(number: number)
                print("\(number) is prime: \(isPrimeNumber)")
            }
            self.busyButton = false
        }
    }
    
    func isPrime(number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        if number <= 3 {
            return true
        }
        var i = 2
        while i*i <= number {
            if number % i == 0 {
                return false
            }
            i = i + 2
        }
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
