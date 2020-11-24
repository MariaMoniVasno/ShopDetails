//
//  DeviceTypeViewController.swift
//  ShopDetails
//
//  Created by developer on 23/11/20.
//  Copyright © 2020 blockchain. All rights reserved.
//

import UIKit
import Alamofire

class DeviceTypeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet var deviceTypeSegContrl : UISegmentedControl!
    @IBOutlet var deviceTableView : UITableView!
    var shopDetails = ShopsDetails()
    var shops : Shops?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Shop List"
        self.navigationItem.setHidesBackButton(true, animated: true)

//        shopDetails.MainDomainDetailsAPI { (_ result: Result<Shops, ApiErrors>) in
//                   switch result{
//                   case .success(let data):
//                    self.shops = data
//                    
//                   case .failure(let error):
//                       print("error",error)
//                      
//                      
//                   }
//               }
    }

    @IBAction func onChangeSegment(_ sender: UISegmentedControl)
    {
        self.deviceTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let selectedIndex = self.deviceTypeSegContrl.selectedSegmentIndex
        switch selectedIndex
        {
        case 0:
            return Extensions.deviceiOSArray.count
        case 1:
            return Extensions.deviceAndroidArray.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceTypeTableViewCell") as? DeviceTypeTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        let selectedIndex = self.deviceTypeSegContrl.selectedSegmentIndex
        switch selectedIndex
        {
        case 0:
        cell.shopNameLbl.text = "Shop Name : \(((Extensions.deviceiOSArray[indexPath.row]) as AnyObject).object(forKey: "name") ?? "")"
        cell.shopAddressLbl.text = "Shop Address : \(((Extensions.deviceiOSArray[indexPath.row]) as AnyObject).object(forKey: "maps_address") ?? "")"
        case 1:
            cell.shopNameLbl.text = "Shop Name : \(((Extensions.deviceAndroidArray[indexPath.row]) as AnyObject).object(forKey: "name") ?? "")"
            cell.shopAddressLbl.text = "Shop Address : \(((Extensions.deviceAndroidArray[indexPath.row]) as AnyObject).object(forKey: "maps_address") ?? "")"
        default:
            break
        }
        cell.shopAddressLbl.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shopDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ShopDetailsViewController") as! ShopDetailsViewController
        let selectedIndex = self.deviceTypeSegContrl.selectedSegmentIndex
        switch selectedIndex
        {
        case 0:
            shopDetailsVC.shopDetailArray = Extensions.deviceiOSArray[indexPath.row] as! NSDictionary
        case 1:
            shopDetailsVC.shopDetailArray = Extensions.deviceAndroidArray[indexPath.row] as! NSDictionary
        default:
            break
        }
        self.navigationController?.pushViewController(shopDetailsVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
struct ShopsDetails {
   
func MainDomainDetailsAPI<H:Codable>(withResult: @escaping (Result<H, ApiErrors>) -> ()) {
    AF.request("https://foodie.deliveryventure.com/shops/data").responseData { response in
        switch response.result {
        case .success(let value):
            Extensions.DecodeHelper.ParseData(with: value, Completion: withResult)
            
        case .failure(let error):
            print(error)
        }
    }
}
}
