package main

import (
	"fmt"
	"net/http"
	"os"
)

func handle(rw http.ResponseWriter, req *http.Request) {
	for name, headers := range req.Header {
		for _, h := range headers {
			fmt.Fprintf(rw, "%v: %v\n", name, h)
		}
	}

	body := make([]byte, req.ContentLength)
	req.Body.Read(body)
	fmt.Fprintln(rw, string(body))
	// if os.Getenv("varFromEnv") != "" {
	fmt.Fprintln(rw, "varFromEnv:", os.Getenv("varFromEnv"))
	// } else {
	// 	fmt.Fprintln(rw, "varFromEnv: You did not sent varFromEnv")
	// }
}

func main() {

	http.HandleFunc("/", handle)
	http.ListenAndServe(":8000", nil)
}
