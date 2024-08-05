import Foundation
import QKMRZParser
import UIKit

public class QKMRZScanResult {
    public let documentImage: UIImage
    public let documentType: String
    public let countryCode: String
    public let surnames: String
    public let givenNames: String
    public let documentNumber: String
    public let nationalityCountryCode: String
    public let birthdate: Date?
    public let sex: String?
    public let expiryDate: Date?
    public let personalNumber: String
    public let personalNumber2: String?
    public let allCheckDigitsValid: Bool
    
    public lazy fileprivate(set) var faceImage: UIImage? = {
        guard let documentImage = CIImage(image: documentImage) else {
            return nil
        }
        
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: CIContext.shared, options: [CIDetectorAccuracy: CIDetectorAccuracyLow])!
        
        guard let face = faceDetector.features(in: documentImage).first else {
            return nil
        }
        
        let increasedFaceBounds = face.bounds.insetBy(dx: -30, dy: -85).offsetBy(dx: 0, dy: 50)
        let faceImage = documentImage.cropped(to: increasedFaceBounds)
        
        guard let cgImage = CIContext.shared.createCGImage(faceImage, from: faceImage.extent) else {
            return nil
        }
        
        return UIImage(cgImage: cgImage)
    }()
    
    public init(mrzResult: QKMRZResult, documentImage image: UIImage) {
        self.documentImage = image
        
        switch mrzResult {
        case .genericDocument(let doc):
            self.documentType = doc.documentType
            self.countryCode = doc.countryCode
            self.surnames = doc.surnames
            self.givenNames = doc.givenNames
            self.documentNumber = doc.documentNumber
            self.nationalityCountryCode = doc.nationalityCountryCode
            self.birthdate = doc.birthdate
            self.sex = doc.sex
            self.expiryDate = doc.expiryDate
            self.personalNumber = doc.personalNumber
            self.personalNumber2 = doc.personalNumber2
            self.allCheckDigitsValid = doc.allCheckDigitsValid
            
        case .frenchID(let doc):
            self.documentType = doc.documentType
            self.countryCode = doc.countryCode
            self.surnames = doc.lastName
            self.givenNames = doc.firstName
            self.documentNumber = doc.documentNumber
            self.nationalityCountryCode = doc.countryCode
            self.birthdate = doc.birthdate
            self.sex = doc.sex
            self.expiryDate = nil // French ID does not have expiry date in this struct
            self.personalNumber = doc.issuanceDepartment ?? ""
            self.personalNumber2 = doc.issuanceOffice
            self.allCheckDigitsValid = doc.allCheckDigitsValid
        }
    }
}
