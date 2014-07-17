// Playground - noun: a place where people can play

import UIKit

// rssデータを取得する処理
let url : NSURL = NSURL(string: "http://feeds.feedburner.com/hatena/b/hotentry")

// rssデータ取得
var myparser:NSXMLParser = NSXMLParser(contentsOfURL:url)


