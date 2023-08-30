//
//  ProgressView.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import SwiftUI
import UIKit
import ImageIO

struct ProgressView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: UIViewRepresentableContext<ProgressView>) -> UIImageView {
        let imageView = UIImageView()
        if let image = UIImage.gif(name: gifName) {
            imageView.image = image
        }
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: UIViewRepresentableContext<ProgressView>) {}
}

extension UIImage {
    static func gif(name: String) -> UIImage? {
        guard let asset = NSDataAsset(name: name),
              let source = CGImageSourceCreateWithData(asset.data as CFData, nil) else { return nil }

        var images: [UIImage] = []
        let frameCount = CGImageSourceGetCount(source)
        for i in 0..<frameCount {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let image = UIImage(cgImage: cgImage)
                images.append(image)
            }
        }
        return UIImage.animatedImage(with: images, duration: 0.035 * Double(images.count))
    }
}

