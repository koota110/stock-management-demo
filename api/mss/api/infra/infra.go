package infra

import (
	"github.com/koota110/stock-management-demo/api/mss/api/domain/repo"
	"xorm.io/xorm"
)

type repository struct {
}

func NewDBRepository(engine *xorm.Engine, client HTTPClient) repo.Repo {
	return &repository{}
}
