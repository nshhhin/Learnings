package main

import "fmt"

func main() {
    var num int
    var pow int // 変数宣言が少し特殊ぐらい？
    var result = 1

    num = 2
    pow = 4
    for i := 0; i < pow; i++ { // for文もなんか特殊
       result *= num
    }

    fmt.Printf("%dの%d乗は%dです。\n", num, pow, result)
}