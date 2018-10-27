package main

import "fmt"

// typeキーワードっていうのを使うと新しい型を宣言できるらしい
type Score int

func main() {
    var myScore Score = 100
    fmt.Printf("私の点数は%d点です。\n", myScore)
}