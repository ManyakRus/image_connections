Graph of connections to external services, for the golang language.

The image_connections console utility is designed to display all connections to external services of any repository in the Golang language
in the form of a diagram (graph) in .graphml format, which can be converted into a .jpg image, etc.
The source code of the repository is automatically parsed to find imports of external service modules.
It is necessary to understand what services this repository interacts with,
to study or better understand the call structure of the source code.
Displayed:
- the name of the current repository
- names of external services, arrows to them

![connections](https://github.com/ManyakRus/image_connections/assets/30662875/1126e873-ddf6-4b3a-ae48-6a8974f6c257)


Sample execution (pictures) can be found in the examples directory

Configured to display the following services:
- PostgreSQL
- MSSQL
- Kafka
- Nats
- Minio
- Email
- Web
- Web socket
- Camunda
- whatsapp
- Telegram
- Chat GPT
- Redis
- Keycloak
- Prometeus
- and etc.

You can add other services to the list in the files:
settings/connections.txt
settings/connections_add.txt

Installation order:
1. Install the .graphml file editor yEd (free)
https://www.yworks.com/products/yed/download

2. Compile this repository
>make build
>
image_connections file will appear in the bin folder

3. Run the image_connections file with parameters:
>image_connections <your repository main.go file directory> <filename.graphml> <your repository name>
>
(or make an .env file
DIRECTORY_SOURCE=
FILENAME_GRAPHML=
SERVICE_NAME=
)

4. Open the resulting .graphml file in the yEd editor
(all elements will be in the center of the screen first)
and select from the menu:
Layout - Radial
- The yEd editor will arrange all the elements of the circuit in an optimal way.
You can also select a different Layout type to change the display.

5. Export the scheme to a picture.
Select from the menu:
File-Export


Source code in Golang.
Tested on Linux Ubuntu
Readme from 29.08.2023

Made by Aleksandr Nikitin
https://github.com/ManyakRus/image_connections
