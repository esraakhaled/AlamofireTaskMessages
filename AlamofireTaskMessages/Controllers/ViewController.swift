//
//  ViewController.swift
//  AlamofireTaskMessages
//
//  Created by Esraa Khaled   on 12/09/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   @IBOutlet weak var textField: UITextField!
    
    
    let paramGet = [
        "order_id": "1",
        "order_type":"1",
        "lang":"en"
    ]
    var product: Products?
    var post: PostModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.25
        
    }

   @IBAction func sendPost(_ sender: Any) {

       guard let trainText = textField.text else {
            return
        }

        let paramPost = ["text": trainText,
                         "order_id": "1",
                         "order_type":"1",
                         "from":"1",
                         "lang":"en"]

       NetworkCall.shared.fetchData(url: URLs.shared.getURL(for: .addNewMessage), method: .post, encoding: JSONEncoding.default, parameters: paramPost , headers: nil) { (result: Result<PostModel,Error>) in
           switch result{
          case .success(let post):
                if post.success == 1 {
                    print("Data entered Successfullly 🥳")
                    NetworkCall.shared.fetchData(url: URLs.shared.getURL(for: .getMessages), method: .get, encoding: URLEncoding.default, parameters: self.paramGet, headers: nil) { (result: Result<Products,Error>) in
                        switch result{
                        case .success(let get):
                            print(get)
                            self.product = get
                            DispatchQueue.main.async {
                                  self.tableView.reloadData()
                            }
                            
                        case .failure(let error):
                            print(error)
                        }
                    }
               }else{
                   print("error ")
                }
                print(post)

            case .failure(let error):
               print(error)
            }
        }
  }


}
 
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:MessagesTableViewCell.reuseIdentifier, for: indexPath) as? MessagesTableViewCell
       
        if product?.product?[indexPath.row].fromTo == "2" {
            let cell = tableView.dequeueReusableCell(withIdentifier:MessagesTableViewCell.reuseIdentifier, for: indexPath) as? MessagesTableViewCell
            cell?.userName.text = product?.product?[indexPath.row].clientID
            cell?.message_date.text = (product?.product?[indexPath.row].date)! + " am"
            cell?.messageBody.text = product?.product?[indexPath.row].text
            cell?.view.layer.cornerRadius = 40.0
            cell?.view.layer.borderWidth = 0.5
            cell?.view.layer.borderColor = UIColor.clear.cgColor
            cell?.userImg.layer.cornerRadius = (cell?.userImg.frame.height)! / 2
            cell?.userImg.clipsToBounds = true
            return cell!
        }else if product?.product?[indexPath.row].fromTo == "1" {
            let cell = tableView.dequeueReusableCell(withIdentifier:ReplaiesTableViewCell.reuseIdentifier, for: indexPath) as? ReplaiesTableViewCell
            cell?.userName.text = product?.product?[indexPath.row].clientID
            cell?.message_date.text = (product?.product?[indexPath.row].date)! + " am"
            cell?.messageBody.text = product?.product?[indexPath.row].text
            cell?.view.layer.cornerRadius = 40.0
            cell?.view.layer.borderWidth = 0.5
            cell?.view.layer.borderColor = UIColor.clear.cgColor
            cell?.userImg.layer.cornerRadius = (cell?.userImg.frame.height)! / 2
            cell?.userImg.clipsToBounds = true
            return cell!
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product?.product?.count ?? 0
    }
   
}

