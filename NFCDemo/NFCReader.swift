//
//  NFCReader.swift
//  NFCDemo
//
//  Created by Mr_zhaohy on 2017/11/4.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

import Foundation
import CoreNFC

/// 回调闭包
typealias ResultBlock = (Bool, String) ->()

class NFCReader:NSObject, NFCNDEFReaderSessionDelegate{
    /// 初始化单例类
    static let shared = NFCReader()
    private override init() {}
    
    /// 提示消息
    var alertMsg = String()

    private var resultBlock:ResultBlock?
    
    private var readerSession:NFCNDEFReaderSession?
    
    func statrScan(block: @escaping ResultBlock) {
        if NFCNDEFReaderSession.readingAvailable {
            resultBlock = block
            readerSession = NFCNDEFReaderSession.init(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: true)
            readerSession?.alertMessage = alertMsg
            readerSession?.begin()
        }
        else{
            block(false, "此设备不支持NFCReader")
        }
        
    }
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        resultBlock!(false, error.localizedDescription)
    }
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        resultBlock!(true, "success")
    }
    
}
