import Cocoa
import Foundation

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

//pasteboard.pasteboardItems?[0]

//var clipboardItems: [String] = []
//for element in pasteboard.pasteboardItems! {
//    if let str = element.string(forType: NSPasteboard.PasteboardType.string) {
//        clipboardItems.append(str)
//    }
//}
//clipboardItems.count




//func virtualKey(_ keyCode: CGKeyCode, keyPress: Bool) {
//    let source = CGEventSource(stateID: .combinedSessionState)
//    CGEvent(keyboardEventSource: source,virtualKey: keyCode,keyDown: keyPress)?.post(tap: .cghidEventTap)
//}
//let shiftKey: CGKeyCode = 56
//let z: CGKeyCode =
//virtualKey(shiftKey, keyPress: true)
//virtualKey(z, keyPress: true)
//virtualKey(z, keyPress: false)
//virtualKey(shiftKey, keyPress: false)

//laskdjfal;skdjfalksdfjlaskdfjalksdfjlaskdjfalsdkfjslakdjflaskjdflaksdjfalksjdfklsjflskdfjslkdjfksdfj
//import Foundation

//public struct Focused {
//    /*
//     Return the current focused element (a NS..) within the currently
//     focused application on your OS
//     */
//    public static func element() -> AXUIElement? {
//        let systemWideElement: AXUIElement = AXUIElementCreateSystemWide()
//        let result: AXUIElement? = systemWideElement.getAttribute(property: kAXFocusedUIElementAttribute)
//        return result
//    }
//    /*
//     Return the value (text) of the user's current focused element,
//     which should be text within an editor
//     */
//    public static func elementText() -> String? {
//        if let focusedElement: AXUIElement = Focused.element() {
//            if let selectedText: AXValue = focusedElement.getAttribute(property: kAXValueAttribute) {
//                return "\(selectedText)"
//            }
//        }
//        return nil
//    }
//    /*
//     Return the value (text) of the user's current highlighted text,
//     within the currently focused element
//     */
//    public static func highlightedText() -> String? {
//        if let focusedElement: AXUIElement = Focused.element() {
//            if let highlightedText: AXValue = focusedElement.getAttribute(property: kAXSelectedTextAttribute) {
//                if !"\(highlightedText)".isEmpty {
//                    return "\(highlightedText)"
//                }
//            }
//        }
//        return nil
//    }
//}
//
//public extension AXUIElement {
//    /*
//     Helper method returns an accessibility attribute from
//     an AXUIElement (e.g. the text of a focused NSTextField)
//     */
//    public func getAttribute<T>(property: String) -> T? {
//        var ptr: AnyObject?
//        if AXUIElementCopyAttributeValue(self, property as CFString, &ptr) != AXError.success {
//            return nil
//        }
//        return ptr.map {
//            $0 as! T
//        }
//    }
//}
//
//sleep(2)
//
//
//var x: String? = ""
//if let highlightedText = Focused.highlightedText() {
//    x = highlightedText
//}
//else {
//    x = Focused.elementText()
//}
//print(x)

//laskdjfal;skdjfalksdfjlaskdfjalksdfjlaskdjfalsdkfjslakdjflaskjdflaksdjfalksjdfklsjflskdfjslkdjfksdfj

//let systemWideElement = AXUIElementCreateSystemWide().takeRetainedValue()
//var accessibilityEnabled: Bool { return AXIsProcessTrustedWithOptions(["AXTrustedCheckOptionPrompt": true]) }
//
//func axGet(element: AXUIElement, attribute: String) -> AnyObject? {
//    var value: AnyObject?
//    let returnCode = AXUIElementCopyAttributeValue(element, attribute, &value)
//    if (returnCode == AXError.Success) { return value }
//    return nil
//}
//func axSet(element: AXUIElement, attribute: String, value: AnyObject) -> Bool {
//    let returnCode = AXUIElementSetAttributeValue(element, attribute, value)
//    if (returnCode == AXError.Success) { return true }
//    print("Error setting \(attribute): \(returnCode)")
//    return false
//}
//
//func convertCaseUsingAccessibility(option: Int) -> Bool {
//    if accessibilityEnabled {
//        if let focusedElement = axGet(systemWideElement, attribute: "AXFocusedUIElement") {
//            if let selectedText = axGet(focusedElement as! AXUIElement, attribute: "AXSelectedText") {
//                let selected = selectedText as! String
//                let converted = getCaseConvertedString(selected, option)
//                return selected == converted || axSet(focusedElement as! AXUIElement, attribute: "AXSelectedText", value: converted)
//            }
//        }
//    }
//    return false
//}


func getHighlightedText() -> AnyObject? {
    let systemWideElement = AXUIElementCreateSystemWide()
    var focusedElement: AnyObject?
    let focusedCode = AXUIElementCopyAttributeValue(systemWideElement, "AXFocusedUIElement" as CFString, &focusedElement)
    if (focusedCode == AXError.success) {
        var selectedText: AnyObject?
        let textCode = AXUIElementCopyAttributeValue(focusedElement as! AXUIElement, "AXSelectedText" as CFString, &selectedText)
        if (textCode == AXError.success) {
            return selectedText
        }
    }
    return nil
}
print(getHighlightedText())
