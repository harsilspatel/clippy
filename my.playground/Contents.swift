import Cocoa

//let pasteboard = NSPasteboard.general
//
//pasteboard.string(forType: NSPasteboard.PasteboardType.string)
//
//
//var history: [String] = []
//
//func copyToClipboard(string: String) {
//    pasteboard.clearContents()
//    pasteboard.setString(string, forType: NSPasteboard.PasteboardType.string)
//    history.append(string)
//}
//copyToClipboard(string: "hello")
//
//var x: [String] = []
//if x.count > 0
//    {x.removeFirst()}
//x

//pasteboard.pasteboardItems?[0].

//var clipboardItems: [String] = []
//for element in pasteboard.pasteboardItems! {
//    if let str = element.string(forType: NSPasteboard.PasteboardType.string) {
//        clipboardItems.append(str)
//    }
//}
//clipboardItems.count




func virtualKey(_ keyCode: CGKeyCode, keyPress: Bool) {
    let source = CGEventSource(stateID: .combinedSessionState)
    CGEvent(keyboardEventSource: source,virtualKey: keyCode,keyDown: keyPress)?.post(tap: .cghidEventTap)
}
let shiftKey: CGKeyCode = 56
let z: CGKeyCode = 6
virtualKey(shiftKey, keyPress: true)
virtualKey(z, keyPress: true)
virtualKey(z, keyPress: false)
virtualKey(shiftKey, keyPress: false)



