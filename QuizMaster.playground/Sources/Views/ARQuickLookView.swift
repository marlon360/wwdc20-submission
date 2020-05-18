import SwiftUI
import QuickLook
import ARKit
  
struct ARQuickLookView: UIViewControllerRepresentable {
    var name: String
    var allowScaling: Bool = true
      
    func makeCoordinator() -> ARQuickLookView.Coordinator {
        Coordinator(self)
    }
      
    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        return controller
    }
      
    func updateUIViewController(_ controller: QLPreviewController, context: Context) { }
      
    class Coordinator: NSObject, QLPreviewControllerDataSource {
        let parent: ARQuickLookView
        private lazy var fileURL: URL = Bundle.main.url(forResource: parent.name, withExtension: "reality")!
          
        init(_ parent: ARQuickLookView) {
            self.parent = parent
            super.init()
        }
          
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
          
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            guard let fileURL = Bundle.main.url(forResource: parent.name, withExtension: "usdz") else {
                fatalError("Unable to load \(parent.name).reality from main bundle")
            }
            
            let item = ARQuickLookPreviewItem(fileAt: fileURL)
            item.allowsContentScaling = parent.allowScaling
            return item
        }
    }
}
