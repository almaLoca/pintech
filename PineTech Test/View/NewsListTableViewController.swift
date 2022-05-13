//
//  NewsListTableViewController.swift
//  PineTech Test
//
//  Created by FairCode on 10/06/20.
//  Copyright © 2020 FairCode. All rights reserved.

import UIKit
import Alamofire

class NewsListTableViewController: UITableViewController, newsData {

    var storedOffsets = [Int: CGFloat]()
    var newsListTableViewControllerViewModel = NewsListTableViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsListTableViewControllerViewModel.newsDelegate = self
        newsListTableViewControllerViewModel.newsListApiCall()
    }
    
    func data(newsData: NewsModel) {
        print(newsData)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageSlideshowTableViewCell", for: indexPath) as! ImageSlideshowTableViewCell
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        headerCell.selectionStyle = .none
        headerCell.setCollectionViewDataSourceDelegate(self, forRow: 0)
        headerCell.collectionViewOffset = storedOffsets[0] ?? 0
        return headerCell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 66
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 154
        default:
            return 107
        }
    }
}

extension NewsListTableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        (cell.viewWithTag(20)!).layer.cornerRadius = 10
        (cell.viewWithTag(100) as! UILabel).text = "Reshma"
        return cell
    }

    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        tableView.layoutIfNeeded()
        return CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 50)
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch albumImage?.images?[indexPath.row].status {
//        case 1:
//            if isSelectionActivated {
//                self.selectedImageId = self.albumImage?.images?[indexPath.row].imageID ?? 0
//
//                if let imageID = albumImage?.images?[indexPath.row].imageID {
//                    if self.selectedImage_IdArray.contains(imageID){
//                        if let itemToRemoveIndex = selectedImage_IdArray.firstIndex(of: imageID) {
//                            selectedImage_IdArray.remove(at: itemToRemoveIndex)
//                        }
//                    }
//                    else{
//                        self.selectedImage_IdArray.append(self.selectedImageId)
//                    }
//                }
//                collectionView.reloadData();
//            }
//
//            else {
//                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageDetailsViewController") as! ImageDetailsViewController
//                vc.imageId = albumImage?.images?[indexPath.row].imageID ?? 0
//                vc.albumID = albumId
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//
//        case 2:
//            switch albumImage?.images?[indexPath.row].isPromoted {
//                case 1:
//                    break
//                default:
//                    let alertController = UIAlertController(title: "Add Image Name", message: "", preferredStyle: .alert)
//
//                    alertController.addTextField { (textField : UITextField!) -> Void in
//                        textField.placeholder = "Enter Image Name"
//                    }
//                    let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
//                        let textField = alertController.textFields![0] as UITextField
//                        //  self.selectedIndex = indexPath.row
//                        guard !(textField.text?.trimmingCharacters(in: .whitespaces).isEmpty)! else {
//                            Helper.notifiyUser(viewController: self, title: "Alert!", message:"Name cannot be blank")
//                            return
//                        }
//
//                        self.imageTitle = textField.text ?? ""
//                        self.selectedImageId = self.albumImage?.images?[indexPath.row].imageID ?? 0
//                        self.buttonAction()
//                    })
//                    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
//                        (action : UIAlertAction!) -> Void in })
//
//                    alertController.addAction(saveAction)
//                    alertController.addAction(cancelAction)
//                    self.present(alertController, animated: true, completion: nil)
//            }
//        default:
//            break
//        }
//    }
}
