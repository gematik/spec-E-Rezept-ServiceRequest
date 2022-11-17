<img align="right" width="200" height="37" src="Gematik_Logo_Flag.png"/> <br/>

# spec-erezept-medicationrequest-communications FHIR-Profiles

Communication ressources used to request a electronical prescription context. Ressources to to be published on www.simplifier.net/erezept-medicationrequest-communications


<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
       <ul>
        <li><a href="#release-notes">Release Notes</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


## About The Project
This Repo contains the fsh files to the later published spec-erezept-medicationrequest-communications files on simplifier.net and a script to validate them.

### Release Notes
See [ReleaseNotes.md](./ReleaseNotes.md) for all information regarding the (newest) releases.

### Prerequisites
1. Clone this project to your local machine.
2. Run the install script once.
3. Work on teh FHIR Profiles build and validate them with the given script.

### Installation
To install the necessary tools run

```bash
sudo ./install_fhir_tools.sh
```

This will install

- Java SDK 17 JRE
- Sushi from <https://github.com/FHIR/sushi>
- dotnet-sdk-3.1
- firely.terminal
- yq yaml-parser

After successfull installation run:

```bash
./validate.sh -is
```
See `../validation_results/` for results.

## Usage
See [Usage.md](./USAGE.md)

## Contributing
If you want to contribute, please check our [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

Copyright [yyyy] gematik GmbH

Licensed under the **Apache License, Version 2.0** (the "License"); you may not use this file except in compliance with the License.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the [LICENSE](./LICENSE) for the specific language governing permissions and limitations under the License.

## Contact
Please address your ideas via PullRequest.

## Usage <a name = "usage"></a>

### Installing FHIR tools on your local machine
**_NOTE:_** If you are using a ['box.fhir' Devbox](https://gitlab.prod.ccs.gematik.solutions/git/Verwaltung/Entwicklungsumgebung/devbox) you should have the neccessary dependencies already installed and this step can be skipped.

Otherwise, the following script installs all necessary tools for specifying fhir resources onto your local machine.

```bash
./scripts/install_fhir_tools.sh
```
(requires admin privileges)

### Run Validation

Run script `validate.sh` to

1. Run sushi FHIR Files generator
2. Validate all files in the `./Resources` folder
3. Get a html output file for each FHIR file in `../validation_results/`

You can use following script options

### Install dependencies from sushi-config.yaml

`-i` installs dependencies with firely.terminal from `./<foldername>/sushi-config.yaml` file

```bash
./validate.sh -i
```

### Sort resulting html files into severity folders

`-s` sorts resulting html files in folders by the severities of the findings.
Categories are: `error`, `warning`, `information` and `unknown`

```bash
./validate.sh -s
```

### Change default folder

`-d foldername` sets foldername for validation. Default is: `./Resources`

```bash
validate.sh -d ./Testresources
```

### Process single file

`-f filename` sets filename for single validation.

```bash
validate.sh -f ./Resources/fsh-generated/resources/myProfile.json
```

### Work with specific version of Hapi Validator

`-v version` defines a version od the used Hapi Validator. If the specified version of the hapi validator is not present the default will be used. Validator-JARs will be downloaded to ~/.fhir/validators/.

```bash
validate.sh -v 5.6.70
```

# Help

If you find issues with this template project, please leave an issue or create a Pull Request via  the [template repository](https://github.com/gematik/spec-TemplateForSimplifierProjects).