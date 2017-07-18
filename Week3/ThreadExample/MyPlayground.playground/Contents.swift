/*
 *  Boostcamp 2nd, iOS D조 - 쌍쌍바
 *  OperationQueue, Operation 사용 예제입니다.
 */

import Foundation

let numberOfEvents = 10000    // 입력되는 이벤트의 개수, 예를 들면 마우스를 사용할 때 입력되는 마우스 움직임 이벤트
let numberOfThreads = 2       // 입력된 이벤트를 처리하는 스레드의 수, 예를 들면 마우스 움직임 이벤트를 화면으로 반영하는 스레드

var eventsLock = NSLock()     // 마우스를 사용 시 Produce / 커널에서 Consume 되는 이벤트의 경쟁 상황을 막기 위한 잠금
var tasksLocks: [NSLock] = [] // 하나의 커널과 각 이벤트 처리 스레드 사이의 경쟁 상황을 막기 위한 잠금

var total = 0                    // 처리된 총 이벤트의 개수
var totalLock = NSLock()         // 처리된 총 이벤트의 개수 값의 경쟁 상황을 막기 위한 잠금

var ended = 0                    // 종료된 스레드의 개수
var endedLock = NSLock()         // 종료된 스레드의 개수 값의 경쟁 상황을 막기 위한 잠금

// 이벤트 처리 스레드마다 잠금 객체를 할당
for i in 0 ..< numberOfThreads {
    tasksLocks.append(NSLock())
}

var events:[Int] = [] // 유저가 만들어 낸 이벤트가 보관 됨

/// 생산자 - 마우스를 움직이는 유저, 끊임없이 마우스를 0 ..< numberOfEvents 만큼 움직임
class Producer: NSObject {
    
    /// 생산자 스레드에서 실행되는 함수
    func runLoop() {
        for i in 0 ..< numberOfEvents {
            eventsLock.lock()
            events.append(i)         // 유저가 만들어 낸 이벤트를 저장
            eventsLock.unlock()
        }
    }
    
    /// 생산자 스레드를 만들고 시작
    override init() {
        super.init()
        
        let thread = Thread(target: self, selector: #selector(runLoop), object: nil)
        thread.start()
    }
}

/// 소비자 - 마우스 움직임 이벤트를 화면에 반영하는 스레드
class Consumer: Operation {
    var num:Int         // 스레드 번호
    var tasks:[Int]     // 자신에게 할당 된 이벤트들을 보관
    
    init(_ num: Int){
        self.num = num
        self.tasks = []
        
        super.init()
    }
    
    override func main() {
        if self.isCancelled {
            return
        }
        
        while(true){
            tasksLocks[num].lock()
            
            var tmp = 0
            while !self.tasks.isEmpty {         // 자신에게 할당 된 업무가 있는 경우 처리
                tmp += self.tasks.popLast()!    // 이벤트를 화면에 반영하는 일을 덧셈을 하는 것으로 대체
            }
            
            tasksLocks[num].unlock()
            
            totalLock.lock()
            total += tmp                        // 총 이벤트 처리량에 자신이 처리한 이벤트의 개수를 더함
            print("\(num) - \(total)")
            totalLock.unlock()
            
            // 유저가 입력한 모든 이벤트가 처리 되었으면 반복문을 탈출해 스레드를 종료
            if total == numberOfEvents * (numberOfEvents - 1) / 2 {
                break
            }
        }
        
        endedLock.lock()
        ended += 1          // 스레드를 끝내기 전에 `종료 된 스레드 개수`를 증가시키고
        endedLock.unlock()
    }
}

/// iOS에서 제공하는 스레드 기술 중, Operation을 활용하는 방법

/// Foundation에서는 스레드를 Operation이란 형태로 제공하고, Queue 방식으로 처리할 수 있음
var operationQueue:OperationQueue = {
    var queue = OperationQueue()
    queue.name = "testQueue"
    queue.maxConcurrentOperationCount = numberOfThreads
    return queue
}()


var producer = Producer()
var consumers:[Consumer] = []
for i in 0 ..< numberOfThreads {
    var consumer = Consumer(i)                              // 이벤트 처리 스레드를 Operation 형태로 생성
    consumer.completionBlock = {print("\(i)번 쓰레드 종료")}    // Operation 종료 시 스레드 종료 문구 출력
    consumer.queuePriority = .veryLow
    consumers.append(consumer)
    operationQueue.addOperation(consumers[i])               // OperationQueue에 이벤트 처리 스레드를 입력
}


var num: Int, i = 0;
while(ended < numberOfThreads){
    num = i % numberOfThreads
    
    eventsLock.lock()        /// events를 사용하므로 잠금
    
    tasksLocks[num].lock()   /// consumers[num].tasks을 사용하므로 잠금
    
    while !events.isEmpty {  /// 놀고 있는 스레드에 이벤트 할당
        consumers[num].tasks.append(events.popLast()!)
    }
    
    tasksLocks[num].unlock()
    
    eventsLock.unlock()
    i += 1
}

print("끝")
