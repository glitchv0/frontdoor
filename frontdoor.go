package main

import (
	"fmt"
	"net"
	"net/http"
	"os"
)

func handle(rw http.ResponseWriter, req *http.Request) {
	// Loop through headers and print them
	for name, headers := range req.Header {
		for _, h := range headers {
			fmt.Fprintf(rw, "%v: %v\n", name, h)
		}
	}

	host, _ := os.Hostname()
	addrs, _ := net.LookupIP(host)
	for _, addr := range addrs {
		if ipv4 := addr.To4(); ipv4 != nil {
			fmt.Fprintln(rw, "IPv4: ", ipv4)
		}
	}
	// Echo the body back
	body := make([]byte, req.ContentLength)
	req.Body.Read(body)
	fmt.Fprintln(rw, string(body))
	// Echo the environment variable
	fmt.Fprintln(rw, "varFromEnv:", os.Getenv("varFromEnv"))
}

func main() {
	// call the handle function and run the web server
	http.HandleFunc("/", handle)
	http.ListenAndServe(":8000", nil)
}
