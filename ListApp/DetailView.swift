//
//  DetailView.swift
//  ListApp
//
//  Created by maho hayashi on 2025/07/16.
//

import SwiftUI
import AVFAudio

struct DetailView: View {
    
    @State var animal: Animal
    @State var player: AVAudioPlayer!
    
    var body: some View {
        VStack{
            Text(animal.name)
                .font(.title)
                .bold()
            Spacer()
            Image(animal.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
            Spacer()
            Button{
                player.currentTime = 0
                player.play()
            } label: {
                Text("鳴き声を聞く")
            }
            .buttonStyle(BorderedProminentButtonStyle())
            Spacer()
            Spacer()
        }
        .padding()
        
        //音声が流れなかったのでここを変更
        .onAppear {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(data: animal.sound)
            } catch {
                print("Audio setup error: \(error)")
            }
        }
//        .onAppear {
//            player = try! AVAudioPlayer(data: animal.sound)
//        }
    }
}

#Preview {
    DetailView(animal: .cat)
}
