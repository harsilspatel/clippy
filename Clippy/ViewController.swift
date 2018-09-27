//
//  ViewController.swift
//  Clippy
//
//  Created by Harsil Patel on 26/9/18.
//  Copyright © 2018 Harsil Patel. All rights reserved.
//

import Cocoa
import HotKey

class ViewController: NSViewController {
    
    @IBOutlet weak var copyField: NSTextField!
    @IBOutlet weak var pasteField: NSTextField!
    
    var hotKey: HotKey? {
        didSet {
            guard let hotKey = hotKey else {
                print("Unregistered")
                return
            }
            
            print("Registered")
            
            hotKey.keyDownHandler = { [weak self] in
                print("Pressed at \(Date())")
            }
        }
    }
    
    let pasteboard = NSPasteboard.general
    var history: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register(self)
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
   
    @IBAction func copyToClipboard(_ sender: Any) {
        addToQueue()
    }
    
    func addToQueue() {
        let text = copyField.stringValue
        
        // copying the string to the system pasteboard
        pasteboard.clearContents()
        pasteboard.setString(text, forType: NSPasteboard.PasteboardType.string)
        
        history.append(text)
    }
    
    @IBAction func pasteToClipboard(_ sender: Any) {
        if history.count > 0 {
            pasteField.stringValue += " " + history.removeFirst()
        }
        
    }
    
    func unregister(_ sender: Any?) {
        hotKey = nil
    }
    
    func register(_ sender: Any?) {
        hotKey = HotKey(keyCombo: KeyCombo(key: .c, modifiers: [.control]))
    }

}

