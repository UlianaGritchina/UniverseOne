//
//  ShareView.swift
//  PocketSpace
//
//  Created by Ульяна Гритчина on 10.06.2022.
//

import SwiftUI

struct ShareView: View {
    let imageData: Data
    @Binding var isShowingShereView: Bool
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {isShowingShereView.toggle()}) {
                    Image(systemName: "chevron.down")
                        .font(.system(size: UIScreen.main.bounds.height / 35))
                }
            }
            .padding()
            
            Spacer()
            
            Image(uiImage: UIImage(data: imageData) ?? UIImage(named: "Back0")!)
                .resizable()
                .scaledToFit()
                .addPinchZomm()
            
            
            Spacer()
        }
    }
}

extension View {
    func addPinchZomm() -> some View {
        return PinchZoomContent {
            self
        }
    }
}

struct PinchZoomContent<Content: View>: View {
    var content: Content
    @State var ofset: CGPoint = .zero
    @State var scale: CGFloat = 0
    @State var scalePosition: CGPoint = .zero
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .offset(x: ofset.x, y: ofset.y)
            .overlay(
                GeometryReader { proxy in
                    let size = proxy.size
                    ZommGesture(size: size, scale: $scale, ofset: $ofset, scalePosition: $scalePosition)
                }
            )
            .scaleEffect(scale + 1, anchor: .init(x: scalePosition.x,
                                                  y: scalePosition.y))
    }
}

struct ZommGesture: UIViewRepresentable {
    
    var size: CGSize
    @Binding var scale: CGFloat
    @Binding var ofset: CGPoint
    @Binding var scalePosition: CGPoint
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        let pinch = UIPinchGestureRecognizer(
            target: context.coordinator,
            action: #selector(context.coordinator.handlePinch(sendler:)))
        
        
        let pan = UIPanGestureRecognizer(
            target: context.coordinator,
            action: #selector(context.coordinator.handlePan(sendler:)))
        pan.delegate = context.coordinator
        
        view.addGestureRecognizer(pinch)
        view.addGestureRecognizer(pan)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        
        
        let parent: ZommGesture
        
        init(parent: ZommGesture) {
            self.parent = parent
        }
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            true
        }
        @objc func handlePan(sendler: UIPanGestureRecognizer) {
            sendler.maximumNumberOfTouches = 2
            if (sendler.state == .began || sendler.state == .changed) && parent.scale > 0 {
                guard let view = sendler.view else { return }
                let translation = sendler.translation(in: view)
                parent.ofset = translation
            } else {
                withAnimation {
                    parent.ofset = .zero
                }
            }
        }
        
        
        @objc func handlePinch(sendler: UIPinchGestureRecognizer) {
            if sendler.state == .began || sendler.state == .changed {
                parent.scale = (sendler.scale - 1)
                let scalePoint = CGPoint(
                    x: sendler.location(in: sendler.view).x / sendler.view!.frame.size.width,
                    
                    y: sendler.location(in: sendler.view).y / sendler.view!.frame.size.height)
                
                parent.scalePosition = (parent.scalePosition == .zero ? scalePoint : parent.scalePosition)
            } else {
                withAnimation(.default) {
                    parent.scale = 0
                    parent.scalePosition = .zero
                }
            }
        }
    }
    
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView(imageData: Data(), isShowingShereView: .constant(false))
    }
}
