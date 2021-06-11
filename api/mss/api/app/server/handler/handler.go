package handler

import "github.com/koota110/stock-management-demo/api/mss/api/domain/service"

type Handler interface {
}

type handler struct {
}

func NewHandler(service service.Service) Handler {
	return &handler{}
}
