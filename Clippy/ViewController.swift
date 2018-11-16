//
//  ViewController.swift
//  Clippy
//
//  Created by Harsil Patel on 26/9/18.
//  Copyright © 2018 Harsil Patel. All rights reserved.
//

import Cocoa
import HotKey
import Foundation


class ViewController: NSViewController {
    
    var history: [String] = []
    let pasteboard = NSPasteboard.general
    
    var copyKey: HotKey? {
        didSet {
            guard let copyKey = copyKey else {
                print("Unregistered")
                return
            }
            
            print("Registered")
            
            copyKey.keyDownHandler = {
                let myText: String = self.getHighlightedText() as! String
                print("\(myText) copied at \(Date())")
                self.history.append(myText)
            }
        }
    }
    
    var pasteKey: HotKey? {
        didSet {
            guard let pasteKey = pasteKey else {
                print("Unregistered")
                return
            }
            
            print("Registered")
            
            pasteKey.keyDownHandler = {
                if self.history.count > 0 {
                    let myText = self.history.removeFirst()
                    self.pasteboard.clearContents()
                    self.pasteboard.setString(myText, forType: NSPasteboard.PasteboardType.string)
                    print("\(myText) pasted at \(Date())")
                    self.insertText(text: myText)
                }
            }
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        copyKey = HotKey(keyCombo: KeyCombo(key: .c, modifiers: [.control]))
        pasteKey = HotKey(keyCombo: KeyCombo(key: .v, modifiers: [.control]))
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func getHighlightedText() -> AnyObject? {
        let systemWideElement = AXUIElementCreateSystemWide()
        var focusedElement: AnyObject?
        let focusedCode = AXUIElementCopyAttributeValue(systemWideElement, "AXFocusedUIElement" as CFString, &focusedElement)
        print(focusedCode == AXError.success)
        if (focusedCode == AXError.success) {
            var selectedText: AnyObject?
            let textCode = AXUIElementCopyAttributeValue(focusedElement as! AXUIElement, "AXSelectedText" as CFString, &selectedText)
            print(textCode)
            if (textCode == AXError.success) {
                print(selectedText)
                return selectedText
            }
        }
        return nil
    }
    
    func insertText(text: String) {
        let systemWideElement = AXUIElementCreateSystemWide()
        var focusedElement: AnyObject?
        let focusedCode = AXUIElementCopyAttributeValue(systemWideElement, "AXFocusedUIElement" as CFString, &focusedElement)
        if (focusedCode == AXError.success) {
            var selectedText: AnyObject?
            let textCode = AXUIElementCopyAttributeValue(focusedElement as! AXUIElement, "AXSelectedText" as CFString, &selectedText)
            if (textCode == AXError.success) {
                AXUIElementSetAttributeValue(focusedElement as! AXUIElement, "AXSelectedText" as CFString, text as CFTypeRef)
            }
        }
    }
}

