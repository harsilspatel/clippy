import Cocoa

let pasteboard = NSPasteboard.general

pasteboard.string(forType: NSPasteboard.PasteboardType.string)


var history: [String] = []

func copyToClipboard(string: String) {
    pasteboard.clearContents()
    pasteboard.setString(string, forType: NSPasteboard.PasteboardType.string)
    history.append(string)
}
copyToClipboard(string: "hello")

var x: [String] = []
if x.count > 0
    {x.removeFirst()}
x

//pasteboard.pasteboardItems?[0].

//var clipboardItems: [String] = []
//for element in pasteboard.pasteboardItems! {
//    if let str = element.string(forType: NSPasteboard.PasteboardType.string) {
//        clipboardItems.append(str)
//    }
//}
//clipboardItems.count



