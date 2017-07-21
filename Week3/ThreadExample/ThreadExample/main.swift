//
//  main.swift
//  ThreadExample
//
//  Created by Yoo Seok Kim on 2017. 7. 17..
//  Copyright © 2017년 Nois. All rights reserved.
//

import Foundation

var loop = true
class MyThreadingClass: NSObject {
    var count = 0
    let lock = NSLock()
    
    func runLoop() {
        while Thread.current.isCancelled == false {
            // lock
            lock.lock()
            
            if count >= 100 {
                print("end!")
                loop = false
                return
            }
            // critical section
            count = count + 1
            print("count: \(count) current: \(Thread.current)")
            
            // unlock
            lock.unlock()
            
            }
        
    }
    
    override init() {
        super.init()
        for _ in 0..<10 {
            Thread(target: self, selector: #selector(runLoop), object: nil).start()
        }
    }
}

let threadingObject = MyThreadingClass()

while loop {
    // to test thread
}
