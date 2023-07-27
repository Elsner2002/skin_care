//
//  CameraViewModel.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import AVKit
import Foundation
import SwiftUI
import VisionKit

enum ScanType: String {
    case barcode
}

enum DataScannerAccessStatusType{
    case notDetermined
    case cameraAccessNotGaranted
    case cameraNotAvailable
    case scannerAvailable
    case scannerNotAvailable
}

@MainActor
final class CameraViewModel: ObservableObject {
    
    @Published var dataSannerAccessStatus: DataScannerAccessStatusType = .notDetermined
    @Published var recognizedItems: [RecognizedItem] = []
    @Published var scanType: ScanType = .barcode
    
    var recognizerDataType: DataScannerViewController.RecognizedDataType = .barcode()
    
    private var isScanerAvailable: Bool {
        DataScannerViewController.isAvailable && DataScannerViewController.isSupported
    }
    
    func requestDataScannerAccessStatus() async {
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            dataSannerAccessStatus = .cameraNotAvailable
            return
        }
        
        switch AVCaptureDevice.authorizationStatus(for: .video){
            
        case .authorized:
            dataSannerAccessStatus = isScanerAvailable ? .scannerAvailable : .scannerNotAvailable
            
        case .restricted, .denied:
            dataSannerAccessStatus = .cameraAccessNotGaranted
            
        case .notDetermined:
            let granted = await AVCaptureDevice.requestAccess(for: .video)
            if granted {
                dataSannerAccessStatus = isScanerAvailable ? .scannerAvailable : .scannerNotAvailable
            }
            else{
                dataSannerAccessStatus = .cameraAccessNotGaranted
            }
            
        default: break
            
        }
    }
    
}

extension RecognizedItem: Equatable {
    public static func == (lhs: RecognizedItem, rhs: RecognizedItem) -> Bool {
        lhs.id == rhs.id
    }
}
