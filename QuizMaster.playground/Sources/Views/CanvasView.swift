import SwiftUI
import PencilKit

public struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    
    public init(canvasView: Binding<PKCanvasView>) {
        self._canvasView = canvasView
    }

    public func makeUIView(context: Context) -> PKCanvasView {
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 20)
        return canvasView
    }

    public func updateUIView(_ uiView: PKCanvasView, context: Context) { }
}
