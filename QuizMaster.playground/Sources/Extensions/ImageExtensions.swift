import UIKit

extension UIImage{
    
    func toCVPixelBuffer() -> CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer? = nil
        let attr = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
        kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        
        let width = Int(self.size.width)
        let height = Int(self.size.height)
        CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_OneComponent8, attr, &pixelBuffer)
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue:0))
        let colorspace = CGColorSpaceCreateDeviceGray()
        let bitmapContext = CGContext(data: CVPixelBufferGetBaseAddress(pixelBuffer!), width: width, height: height, bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: colorspace, bitmapInfo: 0)!
        guard let cg = self.cgImage else {
            return nil
        }
        bitmapContext.draw(cg, in: CGRect(x: 0, y: 0, width: width, height: height))
        return pixelBuffer
    }
    
       public func fit(in size: CGSize, background: UIColor = UIColor.black) -> UIImage? {
           
           let rect = CGRect(origin: .zero, size: size)
           var scaledImageRect = CGRect.zero
        
           let aspectWidth:CGFloat = size.width / self.size.width
           let aspectHeight:CGFloat = size.height / self.size.height
           let aspectRatio:CGFloat = min(aspectWidth, aspectHeight)
        
           scaledImageRect.size.width = self.size.width * aspectRatio
           scaledImageRect.size.height = self.size.height * aspectRatio
           scaledImageRect.origin.x = (size.width - scaledImageRect.size.width) / 2.0
           scaledImageRect.origin.y = (size.height - scaledImageRect.size.height) / 2.0
        
           UIGraphicsBeginImageContextWithOptions(size, false, 0)
           background.setFill()
           UIRectFill(rect)
           self.draw(in: scaledImageRect)
           
           let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
            
           return scaledImage
      }
    
    func invert() -> UIImage {
        let beginImage = CIImage(image: self)
        if let filter = CIFilter(name: "CIColorInvert") {
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            return UIImage(ciImage: filter.outputImage!)
        }
        return self
    }
}
