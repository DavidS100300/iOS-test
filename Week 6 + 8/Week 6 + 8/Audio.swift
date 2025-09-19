import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    guard let url = Bundle.main.url(forResource: sound, withExtension: type) else { return }
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    } catch {
        print("Error playing sound: \(error.localizedDescription)")
    }
}
