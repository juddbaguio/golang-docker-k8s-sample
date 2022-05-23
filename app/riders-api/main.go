package main

import (
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	r.HandleFunc("/riders", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello from riders-api"))
	})

	server := http.Server{
		Addr:    ":3000",
		Handler: r,
	}

	if err := server.ListenAndServe(); err != nil {
		log.Println(err)
		os.Exit(1)
	}
}
