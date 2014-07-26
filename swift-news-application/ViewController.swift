//
//  ViewController.swift
//  swift-news-application
//
//  Created by 吉亨斗 on 2014/07/13.
//  Copyright (c) 2014年 kilhyungdoo. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, NSXMLParserDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var blog_area: UITableView!
    
    public var rssList = [String]()
    public var element:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // rssデータを取得する処理
        let url : NSURL = NSURL(string: "https://s3-ap-northeast-1.amazonaws.com/kilobject/talent-news.xml")
        
        // rssデータ取得
        let myparser:NSXMLParser = NSXMLParser(contentsOfURL:url)
        myparser.delegate = self
        myparser.parse()
        
        //tableViewに表示
        blog_area.delegate = self
        blog_area.dataSource = self
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        return rssList.count
    }
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel.text = rssList[indexPath.row]
        return cell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 解釈開始時
    func parserDidStartDocument (parser:NSXMLParser) {
    }
    
    // 要素の開始時
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName: String!, attributes attributeDict: NSDictionary!) {
        element = elementName
    }
    
    // 要素の内容参照
    func parser(parser: NSXMLParser!, foundCharacters string : String!){
        if element == "title" && !string.isEmpty {
            rssList.append(string)
        }
        
        // elementがblog_imageの場合
        // imageバスを取得してNSDataでデータ取得
        // UIImageでイメージ変換
        // UIImageViewを生成し、cell.backgroundView = imageView;でcellの背景を設定する
    }
    
    // 要素の終了時
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI : String!, qualifiedName qName: String!) {
        
    }
    
    // 解釈終了時
    func parserDidEndDocument (parser:NSXMLParser) {
    }
}

