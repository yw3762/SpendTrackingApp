//
//  QRCodeView.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/22/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    private var qrcodeContent: String
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()

    
    init(content: String) {
        self.qrcodeContent = content
    }
    
    var body: some View {
        VStack {
            Image(uiImage: generateQRCode(from: qrcodeContent))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
                .padding(.bottom, 50)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("QR Code")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("MainBlack"))
                }
            }
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    QRCodeView(content: "myemail@gmail.com")
}
