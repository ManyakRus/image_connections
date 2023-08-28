package load_json

import (
	"encoding/json"
	"github.com/ManyakRus/image_connections/internal/logic"
	"github.com/ManyakRus/starter/log"
	"github.com/ManyakRus/starter/micro"
	"os"
)

// LoadJSON - загружает 2 файла в формате .json в map
func LoadJSON() {
	var err error
	dir := micro.ProgramDir()

	//главный файл
	FileName := dir + "settings" + micro.SeparatorFile() + "connections.txt"
	err = LoadJSON_from_file(FileName)

	//дополнительный файл, необязательный
	FileName = dir + "settings" + micro.SeparatorFile() + "connections_add.txt"
	err = LoadJSON_from_file(FileName)

	if err != nil {

	}
}

func LoadJSON_from_file(FileName string) error {
	var err error

	//чтение файла
	bytes, err := os.ReadFile(FileName)
	if err != nil {
		log.Error("ReadFile() error: ", err)
		return err
	}

	//json в map
	var MapServiceURL2 = make(map[string]string)
	err = json.Unmarshal(bytes, &MapServiceURL2)
	if err != nil {
		log.Panic("Unmarshal() error: ", err)
	}

	//заполнение главного map
	for k, v := range MapServiceURL2 {
		logic.MapServiceURL[k] = v
	}

	return err
}
