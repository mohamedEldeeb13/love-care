//
//  soundPlay.swift
//  love&care
//
//  Created by Mohamed Abd Elhakam on 24/12/2023.
//


import SwiftUI
import AVFoundation

var audioPlayer : AVAudioPlayer?

func play(audioPath : String , audioType : String) {
   
        if let path = Bundle.main.path(forResource: audioPath, ofType: audioType) {
            do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
            }catch{
                print("file not exist")
            }
                
        }
    
}
