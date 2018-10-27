package main

import "fmt"

type Score int
func (s Score) Show() { fmt.Printf("点数は%d点です\n", s) }
func main() {
    var myScore Score = 100
	myScore.Show()
	// Showをレシーバーっていうらしい
}