//
//  GenerateQRCode.swift
//  QRHub
//
//  Created by Muhammad Asad Chattha on 08/12/2023.
//

import SwiftUI

struct GenerateQRCode: View {
    // MARK: - Properties
    @State private var isShowingAlert = false
    @State private var userInput = ""
    @State private var qrCodeImage: UIImage?

    // MARK: - View
    var body: some View {
        VStack {
            Button("Generate QR Code", action: onGenerateQR)
                .alert("QR Content", isPresented: $isShowingAlert) {
                    Button("OK", action: generateQR)
                        .foregroundStyle(.mint)
                    TextField("Enter text", text: $userInput)
                } message: {
                    Text("Add something to the QR Code")
                }

            if let qrCodeImage {
                Image(uiImage: qrCodeImage)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200)
//                    .overlay(Text("Debug"))
            }
        }
    }
}

// MARK: - Actions
extension GenerateQRCode {

    func onGenerateQR() {
        isShowingAlert = true
    }

    func generateQR() {
        let data = userInput.data(using: .ascii)
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else {return}
        qrFilter.setValue(data, forKey: "inputMessage")
        guard let qrImage = qrFilter.outputImage else { return }
        let transformScale = CGAffineTransform(scaleX: 8.0, y: 8.0)
        let scaledQRImage = qrImage.transformed(by: transformScale)
        qrCodeImage = UIImage(ciImage: scaledQRImage)
        userInput = ""
    }

    private func generateQRCode() {
        let data = "string".data(using: String.Encoding.ascii)
        if let QRFilter = CIFilter(name: "CIQRCodeGenerator") {
            QRFilter.setValue(data, forKey: "inputMessage")
            guard let QRImage = QRFilter.outputImage else {return}
            
            //
            let transformScale = CGAffineTransform(scaleX: 8.0, y: 8.0)
            let scaledQRImage = QRImage.transformed(by: transformScale)
            qrCodeImage = UIImage(ciImage: scaledQRImage)
        }
    }
}

// MARK: - Helpers
extension GenerateQRCode {
    
}


#Preview {
    GenerateQRCode()
}
