<img align="right" width="200" height="37" src="Gematik_Logo_Flag_With_Background.png"/> <br/>

# spec-E-Rezept-ServiceRequest

Communication resources used to request a electronical prescription context. Resources to to be published on https://simplifier.net/erezept-servicerequest


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
    <li><a href="#additional-notes-and-disclaimer-from-gematik-gmbh">Additional Notes and Disclaimer from gematik GmbH</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


## About The Project
This Repo contains the fsh files to the later published spec-E-Rezept-ServiceRequest files on simplifier.net and a script to validate them.

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

## Creating PDFs from stylesheets

For the generation of PDFs from XML files the [Rezeptanforderung Stylesheet](./resources/rezeptanforderung-stylesheet.xsl) can be used. This repo contains a script which transforms the [XSLT Test Files](./resources/XSLT-Test-Files/) into PDFs.
This can be run with

```python
python3 resources/scripts/convert_to_pdf.py
```

## Usage
See [Usage.md](./USAGE.md)

## Contributing
If you want to contribute, please check our [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

Copyright 2022-2025 gematik GmbH

Apache License, Version 2.0

See the [LICENSE](./LICENSE) for the specific language governing permissions and limitations under the License

## Additional Notes and Disclaimer from gematik GmbH

1. Copyright notice: Each published work result is accompanied by an explicit statement of the license conditions for use. These are regularly typical conditions in connection with open source or free software. Programs described/provided/linked here are free software, unless otherwise stated.
2. Permission notice: Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    1. The copyright notice (Item 1) and the permission notice (Item 2) shall be included in all copies or substantial portions of the Software.
    2. The software is provided "as is" without warranty of any kind, either express or implied, including, but not limited to, the warranties of fitness for a particular purpose, merchantability, and/or non-infringement. The authors or copyright holders shall not be liable in any manner whatsoever for any damages or other claims arising from, out of or in connection with the software or the use or other dealings with the software, whether in an action of contract, tort, or otherwise.
    3. We take open source license compliance very seriously. We are always striving to achieve compliance at all times and to improve our processes. If you find any issues or have any suggestions or comments, or if you see any other ways in which we can improve, please reach out to: ospo@gematik.de
3. Please note: Parts of this code may have been generated using AI-supported technology. Please take this into account, especially when troubleshooting, for security analyses and possible adjustments.

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