//
//  DetailRestRoomViewController.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit
import MessageUI

class DetailRestRoomViewController: UIViewController {

    @IBOutlet weak var adresseLabel: UILabel!
    @IBOutlet weak var arrondissement: UILabel!
    @IBOutlet weak var openingDate: UILabel!
    @IBOutlet weak var coordinates: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var toiletImage: UIImageView!
    
    var detailModel: DetailRestRoomViewModel!
    
    class func makeFromStoryboard() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailRestRoomViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adresseLabel.text = detailModel.getAdresse()
        arrondissement.text = detailModel.getArrondissement()
        openingDate.text = detailModel.getOpeningDate()
        coordinates.text = detailModel.getCoordinates()
        
        mainView.layer.cornerRadius = 8
        mainView.clipsToBounds = true
        
        toiletImage.layer.cornerRadius = toiletImage.frame.size.width / 2
        toiletImage.clipsToBounds = true
        
        favoriteButton.isSelected = detailModel.isFavorite()
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        favoriteButton.isSelected = !favoriteButton.isSelected
        detailModel.updateFavorite()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "favoriteChange"), object: nil)
    }
    
    @IBAction func share() {
        let stringForShare = "Find me at the RestRoom\nAdresse: \(detailModel.getAdresse())\nOpening Date: \(detailModel.getOpeningDate())\nCoordinates: \(detailModel.getCoordinates())"
        let activityVC = UIActivityViewController(activityItems: [stringForShare], applicationActivities: nil)
        activityVC.excludedActivityTypes = [.message]
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func call() {
        sendSMS()
    }
    
    @IBAction func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailRestRoomViewController: MFMessageComposeViewControllerDelegate {
    
    func sendSMS() {
        if MFMessageComposeViewController.canSendText() {
            let vc = MFMessageComposeViewController()
            vc.body = "Find me at the RestRoom\nAdresse: \(detailModel.getAdresse())\nOpening Date: \(detailModel.getOpeningDate())\nCoordinates: \(detailModel.getCoordinates())"
            vc.messageComposeDelegate = self
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
