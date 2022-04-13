import RxSwift

print("publish")
Observable.of(1,2,3)
    .map { n -> Int in
        print(n)
        return n
    }
    .publish()
    .connect()

print("o")
let o = Observable.of(1,2,3)
    .map { n -> Int in
        print(n)
        return n
    }
    .share()

let o1 = Observable.of(1,2,3).share()
print("o1")
o1.subscribe(onNext: { print($0) })
print("o1")
o1.subscribe(onNext: { print($0) })
