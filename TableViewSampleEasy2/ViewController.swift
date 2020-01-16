//
//  ViewController.swift
//  TableViewSampleEasy2
//
//  Created by yuki ukai on 2020/01/16.
//  Copyright © 2020 yuki ukai. All rights reserved.
//

import UIKit

// テーブルビュー表示するデータ
let sectionTitle = ["チョウ目", "バッタ目", "コウチュウ目"]
let section0 = [("キタハリ", "タテハチョウ科"), ("クロアゲハ", "アゲハチョウ科")]
let section1 = [("キリギリス", "キリギリス科"), ("ヒナバッタ", "バッタ科"), ("マツムシ", "マツムシ科")]
let section2 = [("ハンミョウ", "ハンミョウ科"), ("アオオサムシ", "オサムシ科"), ("チビクワガタ", "クワガタムシ科")]
let tableData = [section0, section1, section2]


// テーブルビューを表示するためのクラスは（UITableViewDelegate, UITableViewDataSouse）の２つのプロトコルを準拠する必要がある
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // テーブルビューを作る
        let myTableView = UITableView(frame: view.frame, style: .grouped)
        // テーブルビューのデリゲートを設定する
        myTableView.delegate = self
        // テーブルビューｍのデータソースを設定する
        myTableView.dataSource = self
        // テーブルビューを表示
        view.addSubview(myTableView)
        
    }
    
    // セクションごとの行数を返す（必須メソッド）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 第２引数のsectiongがセクション番号
        // tableData[section]で各セクションの値が入った配列をsectionDataに取り出してsectionData.countをそのセクションに表示する行数として返します
        let sectionData = tableData[section]
        // 各セクションの値の個数を行数として返します
        return sectionData.count
    }
    
    // 各行に表示するセルを返す（必須メソッド）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを作る
        // セルのスタイルを.subtitleにすることで、このセルに含まれるラベルにテキストを設定することで各行に文字を表示できる
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        // 引数のindexPathに対応するセクションデータをtableDataから取り出す
        let sectionData = tableData[(indexPath as NSIndexPath).section]
        //
        let cellData = sectionData[(indexPath as NSIndexPath).row]
        // セルに虫の名前を入れます
        cell.textLabel?.text = cellData.0
        // セルに科目を入れます（cellDataは「虫の名前、科目」のダブルです）
        cell.detailTextLabel?.text = cellData.1
        return cell
    }
    
    // セクション数を返す（初期値は１）
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    // セクションタイトルを返す（初期値は空）
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //配列sectionTitleに入っているタイトル数と同じ個数のセクションを作ります
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = sectionTitle[indexPath.section]
        let sectionData = tableData[indexPath.section]
        let cellData = sectionData[indexPath.row]
        // 表示される
        print("\(title)\(cellData.1)")
        print("\(cellData.0)")
    }
}

