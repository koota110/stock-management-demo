package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	_ "github.com/go-sql-driver/mysql"
	"github.com/koota110/stock-management-demo/api/mss/api/app/server"
	"github.com/koota110/stock-management-demo/api/mss/api/app/server/handler"
	"github.com/koota110/stock-management-demo/api/mss/api/config"
	"github.com/koota110/stock-management-demo/api/mss/api/domain/service"
	"github.com/koota110/stock-management-demo/api/mss/api/infra"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"xorm.io/xorm"
	xlog "xorm.io/xorm/log"
)

func NewDB() *xorm.Engine {
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8&parseTime=true&loc=Asia%%2FTokyo",
		config.DB.ID, config.DB.Password, config.DB.Host, config.DB.Port, config.DB.DB)

	db, err := xorm.NewEngine("mysql", dsn)
	if err != nil {
		log.Fatal(err)
	}

	if config.DB.Log {
		logger := xlog.NewSimpleLogger(os.Stdout)
		db.SetLogger(logger)
		db.ShowSQL(true)
		db.SetLogLevel(xlog.LOG_DEBUG)
	}

	return db
}

func NewHandler(db *xorm.Engine) handler.Handler {
	repo := infra.NewDBRepository(db, infra.HTTPClient{})
	mssService := service.NewService(repo)
	h := handler.NewHandler(mssService)

	return h
}

func main() {
	if err := config.ReadConfig(); err != nil {
		log.Fatal(err)
	}

	db := NewDB()
	h := NewHandler(db)
	e := echo.New()
	e.Validator = handler.NewValidator()
	e.Use(apiMiddleware.RequestID())
	e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins: config.App.AllowOrigins,
		AllowMethods: []string{http.MethodGet, http.MethodHead, http.MethodPut, http.MethodPatch, http.MethodPost, http.MethodDelete},
	}))
	e.Use(apiMiddleware.Certification())

	mssServer := server.New(e).RegisterHandler(h)

	log.Fatal(mssServer.Start(config.App.APIPort))
}
