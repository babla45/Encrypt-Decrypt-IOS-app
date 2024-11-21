//  ContentView.swift
//  bibAssignmenrt
//  Created by Gaming Lab on 17/11/24.
import SwiftUI
struct ContentView: View {
    @State private var inputText: String = ""
    @State private var shiftValue: String = ""
    @State private var resultText: String = ""
    @State private var isEncrypted: Bool = true

    func caesarCipher(text: String, shift: Int) -> String {
        let letters = Array("abcdefghijklmnopqrstuvwxyz")
        var result = ""
        for char in text.lowercased() {
            if let letterIndex = letters.firstIndex(of: char) {
                let shiftedIndex = (letterIndex + shift + letters.count) % letters.count
                result.append(letters[shiftedIndex])
            } else {
                result.append(char)
            }
        }
        return result
    }

    var body: some View {
        VStack {
            Text("\n Hi!! I am Md. Babla Islam.                  \n Welcome to my \n").font(.title2).fontWeight(.bold).foregroundColor(.white).background(Color(hue: 1.0, saturation: 0.922, brightness: 0.508)).multilineTextAlignment(.center).cornerRadius(5).padding(5.0)
            Text("   Encrypt/Decrypt   ").font(.title).foregroundColor(Color.white).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
            Text(" IOS application  ").font(.title3).fontWeight(.bold).foregroundColor(.white).background(Color.blue).multilineTextAlignment(.center).cornerRadius(5).padding(5.0)
            TextField("Enter the target string eg. BABLA", text: $inputText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
                .buttonBorderShape(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=shape: ButtonBorderShape@*/.roundedRectangle/*@END_MENU_TOKEN@*/)
            TextField("Enter shift value eg. 5 ", text: $shiftValue)
                .keyboardType(.numberPad).padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
            

            HStack {
                Button(action: {
                    if let shift = Int(shiftValue), !inputText.isEmpty {
                        resultText = caesarCipher(text: inputText, shift: shift)
                        isEncrypted = true
                    }
                }) {
                    Text("Encrypt")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    if let shift = Int(shiftValue), !inputText.isEmpty {
                        resultText = caesarCipher(text: inputText, shift: -shift)
                        isEncrypted = false
                    }
                }) {
                    Text("Decrypt")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            Text("Result:")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 0.771, saturation: 0.952, brightness: 0.966))
                .padding()
            Text("     \(resultText)    ")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding()
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
