package service

import "github.com/koota110/stock-management-demo/api/mss/api/domain/repo"

type Service interface {
}

type service struct {
}

func NewService(repo repo.Repo) Service {
	return &service{}
}
