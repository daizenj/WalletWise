//
//  TransactionCell.swift
//  WalletWise
//
//  Created by Daize Njounkeng on 4/30/23.
//
import UIKit
import Alamofire
import AlamofireImage

class TransactionCell: UITableViewCell {

    @IBOutlet weak var CompanyImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var date = Date()
    private var imageDataRequest: DataRequest?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with transaction: Transaction, with company: Company){
        
        titleLabel.text = transaction.company
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let date = transaction.date
        dateFormatter.locale = Locale(identifier: "en_US")
        dateLabel.text = dateFormatter.string(from: date!)
        if (transaction.cost! > 0){
            costLabel.textColor = UIColor.green
        }else{
            costLabel.textColor = UIColor.red
        }
        costLabel.text = String(transaction.cost!)
        if let imageFile = company.image, let imageUrl = imageFile.url{
                imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                    switch response.result {
                    case .success(let image):
                        // Set image view image with fetched image
                        self?.CompanyImage.image = image
                    case .failure(let error):
                        print("❌ Error fetching image: \(error.localizedDescription)")
                        break
                    }
                }
            }
        }
    }

