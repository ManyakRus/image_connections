package load_json

import (
	"encoding/json"
	"github.com/ManyakRus/image_connections/internal/logic"
	"github.com/ManyakRus/starter/log"
	"os"
)

func LoadJSON_from_file(FileName string) error {
	var err error

	//var json1 logic.MapServiceURL

	bytes, err := os.ReadFile(FileName)
	if err != nil {
		log.Error("ReadFile() error: ", err)
		return err
	}

	err = json.Unmarshal(bytes, &logic.MapServiceURL)
	if err != nil {
		log.Panic("Unmarshal() error: ", err)
	}

	return err
}
