//
//  ViewController.swift
//  MPMusicPlayerSample
//
//  Created by 新納真次郎 on 2018/07/31.
//  Copyright © 2018年 nshhhin. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {
    
    var player: MPMusicPlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = MPMusicPlayerController.applicationMusicPlayer
        getAuth()
    }
    
    @IBAction func tapSelectBtn(_ sender: Any) {
        
        getAuth()
        
        let picker = MPMediaPickerController()
        
        picker.delegate = self
        
        picker.allowsPickingMultipleItems = false
        picker.showsCloudItems = true
        picker.showsItemsWithProtectedAssets = true
        
        switch player.playbackState {
        case .playing:
            print("再生中！！！！")
        default:
            print("それいがーーい")
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        
        defer {
            dismiss(animated: true, completion: nil)
        }
        
        let items = mediaItemCollection.items
        if items.isEmpty {
            return
        }
        
        print("再生")
        playSong( items[0] )
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController){
        dismiss(animated: true, completion: nil)
    }
    
    func playSong(_ item: MPMediaItem){
        let singleCollection = MPMediaItemCollection(items: [item, item, item])
        print( item.title )
        player.setQueue(with: singleCollection)
        
        // 再生準備(AppleMusicの曲とかもあるので非同期的な処理)
        player.prepareToPlay(completionHandler: { error in
            if error == nil {
                self.player.play()
            } else {
                print(error?.localizedDescription)
            }
        })
    }
    
    func getAuth(){
        let alert = UIAlertController(title: "セキュリティ", message: "設定 > 一般から ライブラリのアクセスを許可してください", preferredStyle: .alert)
        alert.addAction(title: "キャンセル", style: .cancel)
        
        MPMediaLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                print("許可されました")
            case .denied:
                print("拒否されましたあああああ")
                alert.show()
            default:
                print("それ以外!")
            }
        }
    }
    
}

