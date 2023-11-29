//
//  AlertViewExtension.swift
//  SpendTracking
//
//  Created by Alex Wang on 11/1/23.
//


import SwiftUI

struct CustomAlertModifier {

    // MARK: - Value
    // MARK: Private
    @Binding private var isPresented: Bool

    // MARK: Private
    private let title: String
    private let message: String
    private let dismissButton: CustomAlertButton?
    private let primaryButton: CustomAlertButton?
    private let secondaryButton: CustomAlertButton?
}


extension CustomAlertModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                CustomAlert(title: title, message: message, dismissButton: dismissButton, primaryButton: primaryButton, secondaryButton: secondaryButton)
            }
    }
}

extension CustomAlertModifier {

    init(title: String = "", message: String = "", dismissButton: CustomAlertButton, isPresented: Binding<Bool>) {
        self.title         = title
        self.message       = message
        self.dismissButton = dismissButton
    
        self.primaryButton   = nil
        self.secondaryButton = nil
    
        _isPresented = isPresented
    }

    init(title: String = "", message: String = "", primaryButton: CustomAlertButton, secondaryButton: CustomAlertButton, isPresented: Binding<Bool>) {
        self.title           = title
        self.message         = message
        self.primaryButton   = primaryButton
        self.secondaryButton = secondaryButton
    
        self.dismissButton = nil
    
        _isPresented = isPresented
    }
}
