//
//  ViewController.swift
//  swift-news-application
//
//  Created by 吉亨斗 on 2014/07/13.
//  Copyright (c) 2014年 kilhyungdoo. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, NSXMLParserDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // rssデータを取得する処理
        let url : NSURL = NSURL(string: "http://feeds.feedburner.com/hatena/b/hotentry")
        
        // rssデータ取得
        let myparser:NSXMLParser = NSXMLParser(contentsOfURL:url)
        myparser.delegate = self
        myparser.parse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 解釈開始時
    func parserDidStartDocument (parser:NSXMLParser) {
        println("xml parse start.")
    }
    
    // 要素の開始時
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName: String!, attributes attributeDict: NSDictionary!) {
        println("xml get content start.")
        
    }
    
    // 要素の内容参照
    func parser(parser: NSXMLParser!, foundCharacters string : String!){
        println("get characters.")
            
    }
    
    // 要素の終了時
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI : String!, qualifiedName qName: String!) {
        println("xml get content end.")
            
    }
    
    // 解釈終了時
    func parserDidEndDocument (parser:NSXMLParser) {
        println("xml parse end.")
    }
}

