//
//  TextBoxView.swift
//  SafetyNet
//
//  Created by Sam Gass on 9/28/20.
//  Copyright © 2020 SafetyNet. All rights reserved.
//

import SwiftUI

struct TextBoxView: UIViewRepresentable {
    typealias UIViewType = UITextView
    
    var placeholderText: String = "How Do You Feel?"
    @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<TextBoxView>) -> UITextView {
        let textBoxView = UITextView()
        
        textBoxView.textContainer.lineFragmentPadding = 0
        textBoxView.textContainerInset = .zero
        textBoxView.font = UIFont.systemFont(ofSize: 17)
        
        textBoxView.text = placeholderText
        textBoxView.textColor = .placeholderText
        
        
        return textBoxView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextBoxView>) {
        
        if text != "" || uiView.textColor == .label {
            uiView.text = text
            uiView.textColor = .label
        }
        
        uiView.delegate = context.coordinator
    }
    
    func frame(numLines: CGFloat) -> some View {
        let height = UIFont.systemFont(ofSize: 17).lineHeight * numLines
        return self.frame(height: height)
    }
    
    func makeCoordinator() -> TextBoxView.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextBoxView
        
        init(_ parent: TextBoxView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .placeholderText {
                textView.text = ""
                textView.textColor = .label
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text == "" {
                textView.text = parent.placeholderText
                textView.textColor = .placeholderText
            }
        }
    }
}

