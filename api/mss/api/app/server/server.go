package server

import (
	"github.com/koota110/stock-management-demo/api/mss/api/app/server/handler"
	"github.com/labstack/echo/v4"
)

type Server struct {
	echo *echo.Echo
}

func New(e *echo.Echo) *Server {
	return &Server{
		echo: e,
	}
}

// TODO: endpointは各API実装時に修正予定
func (s *Server) RegisterHandler(h handler.Handler) *Server {
	return s
}

func (s *Server) Start(port string) error {
	if port == "" {
		port = "80"
	}
	return s.echo.Start(":" + port)
}
