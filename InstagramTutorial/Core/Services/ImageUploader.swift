//
//  ImageUploader.swift
//  InstagramTutorial
//
//  Created by Christopher Walter on 9/21/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage


struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String?{
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let id = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(id)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
}
