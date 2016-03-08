package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/token", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusUnauthorized)
		w.Header().Set("Content-Type", "application/json")
		w.Write([]byte(`{"error": "unauthorized"}`))
	})

	log.Fatal(http.ListenAndServe(":5006", nil))
}
