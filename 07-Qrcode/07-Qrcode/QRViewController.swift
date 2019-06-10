//
//  QRViewController.swift
//  07-Qrcode
//
//  Created by 冯志浩 on 2017/1/22.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit
import AVFoundation

class QRViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate  {
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupDevice()
        // 开始视频捕获
        captureSession?.startRunning()
        setupQRCodeView()
    }
    
    func setupQRCodeView() {
        // 初始化二维码选框并高亮边框
        qrCodeFrameView = UIView()
        if let qrCodeFrameView = qrCodeFrameView {
            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            view.addSubview(qrCodeFrameView)
            view.bringSubviewToFront(qrCodeFrameView)
        }
    }
    
    func setupDevice() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        do {
            // 通过之前获得的硬件设备，获得 AVCaptureDeviceInput 对象
            let input = try AVCaptureDeviceInput(device: captureDevice)
            // 初始化 captureSession 对象
            captureSession = AVCaptureSession()
            // 给 session 添加输入设备
            captureSession?.addInput(input)
            
            // 初始化视频预览 layer，并将其作为 viewPreview 的 sublayer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
        } catch {
            // 如果出现任何错误，仅做输出处理，并返回
            print(error)
            return
        }
        
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        // 设置 delegate 并使用默认的 dispatch 队列来执行回调
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        // 检查：metadataObjects 对象不为空，并且至少包含一个元素
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            return
        }
        // 获得元数据对象
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // 如果元数据是二维码，则更新二维码选框大小与 label 的文本
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                Content.shared.content = metadataObj.stringValue!
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
