package config

import (
	"fmt"
	"os"
	"strings"
)

type db struct {
	ID       string `env:"DB_ID"`
	Password string `env:"DB_PASSWORD"`
	Host     string `env:"DB_HOST"`
	Port     string `env:"DB_PORT"`
	DB       string `env:"DB_DB"`
	Log      bool   `env:"DB_LOG"`
}

type app struct {
	AllowOrigins []string `env:"ALLOW_CORS_ORIGINS"`
	APIPort      string   `env:"API_PORT"`
}

type auth struct {
	HostName     string `env:"KEYCLOAK_HOST"`
	Realm        string `env:"KEYCLOAK_REALM"`
	ClientID     string `env:"KEYCLOAK_CLIENT_ID"`
	ClientSecret string `env:"KEYCLOAK_CLIENT_SECRET"`
}

type endpoint struct {
	LETIF          string `env:"LET_IF_ENDPOINT"`
	DeviceRegistry string `env:"DEVICE_REGISTRY_ENDPOINT"`
}

var (
	DB       *db
	App      *app
	Auth     *auth
	Endpoint *endpoint
)

func ReadConfig() error {
	envKeys := []string{
		"DB_ID", "DB_PASSWORD", "DB_HOST", "DB_PORT", "DB_DB", "DB_DB",
		"ALLOW_CORS_ORIGINS", "API_PORT",
		"KEYCLOAK_HOST", "KEYCLOAK_REALM", "KEYCLOAK_CLIENT_ID", "KEYCLOAK_CLIENT_SECRET",
		"LET_IF_ENDPOINT", "DEVICE_REGISTRY_ENDPOINT",
	}
	env := map[string]string{}

	for _, k := range envKeys {
		v := os.Getenv(k)
		if v == "" {
			return fmt.Errorf("cannot get environment variable %s", k)
		}
		env[k] = v
	}

	var dbLog bool
	if v := os.Getenv("DB_LOG"); v == "true" {
		dbLog = true
	}

	DB = &db{
		ID:       env["DB_ID"],
		Password: env["DB_PASSWORD"],
		Host:     env["DB_HOST"],
		Port:     env["DB_PORT"],
		DB:       env["DB_DB"],
		Log:      dbLog,
	}
	App = &app{
		AllowOrigins: strings.Split(env["ALLOW_CORS_ORIGINS"], ","),
		APIPort:      env["API_PORT"],
	}
	Auth = &auth{
		HostName:     env["KEYCLOAK_HOST"],
		Realm:        env["KEYCLOAK_REALM"],
		ClientID:     env["KEYCLOAK_CLIENT_ID"],
		ClientSecret: env["KEYCLOAK_CLIENT_SECRET"],
	}
	Endpoint = &endpoint{
		LETIF:          env["LET_IF_ENDPOINT"],
		DeviceRegistry: env["DEVICE_REGISTRY_ENDPOINT"],
	}
	return nil
}
