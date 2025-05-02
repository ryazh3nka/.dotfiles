// script that checks which layout you're in
// credits to qwool/hyprland-dots

package main

import (
	"fmt"
	"os"
	"os/exec"
	"regexp"
)

var (
	floatingRegexp = regexp.MustCompile(`\Wfloating: (.*)`)
	monocleRegexp  = regexp.MustCompile(`\Wfullscreen: (.*)`)
)

func strIntToBool(num *string) bool { //lol
	if *num == "1" {
		return true
	}
	return false
}
func main() {
	full, err := exec.Command("hyprctl", "activewindow").Output()
	if err != nil {
		fmt.Printf("%s", err)
	}
	out := string(full[:])
	if len(out) < 20 {
		fmt.Printf("[]=")
		os.Exit(0)
	}

	isFloat := strIntToBool(&floatingRegexp.FindStringSubmatch(out)[1])
	isMonocle := strIntToBool(&monocleRegexp.FindStringSubmatch(out)[1])
	if isFloat && !isMonocle {
		fmt.Printf("&gt;&lt;&gt;")
	} else if isMonocle && !isFloat {
		fmt.Printf("[M]")
	} else {
		fmt.Printf("[]=")
	}
}
