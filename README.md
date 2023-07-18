<!-- TABLE OF CONTENTS -->

# Vet Clinic Database

This repository includes files with plain SQL that can be used to recreate a Vet Clinic database.

## Table of Contents

- [About the Project](#about-project)
- [Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run Tests](#run-tests)
- [Authors](#authors)
- [License](#license)

## About the Project <a name="about-project"></a>

**Vet Clinic Database** is a repository containing SQL files for creating and querying a Vet Clinic database. The database includes tables for animals, animal owners, clinic employees, and visits.

#### Tech Stack <a name="tech-stack"></a>

- PostgreSQL

## Getting Started <a name="getting-started"></a>

### Setup <a name="setup"></a>

To get a local copy up and running, follow these steps:

### Prerequisites <a name="prerequisites"></a>

To run this project, you need to have PostgreSQL installed on your local machine.

### Install <a name="install"></a>

1. Clone this repository:

   ``bash
   git clone https://github.com/ANTOINE1128/Vet-clinic-database.git
### Usage
# To Create the database in PostgreSQLexecute the following command:
  createdb vet_clinic
  Create the database in PostgreSQL:

createdb vet_clinic
Navigate to the repository folder:

cd Vet-clinic-database
Import the schema into the database:


psql -d vet_clinic -f schema.sql
Import the sample data into the database:


psql -d vet_clinic -f data.sql
<!--
Example command:

```sh
  rails server
```
--->



### Deployment

You can deploy this project using:

<!--
Example:

```sh

```
 -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>


👤 **> Antoine Makdessy**
- GitHub: [@githubhandle](https://github.com/ANTOINE1128)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/antoine-makdessy/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>
## ⭐️ Show your support <a name="support"></a>

If you like this project please don't forget to give it a star 

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>


I would like to thank my coding parnter(s) for their contribution to this project
also, I would like to thank my code reviewer(s) for their comments and suggestions  

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

_NOTE: we recommend using the [MIT license](https://choosealicense.com/licenses/mit/) - you can set it up quickly by [using templates available on GitHub](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository). You can also use [any other license](https://choosealicense.com/licenses/) if you wish._

<p align="right">(<a href="#readme-top">back to top</a>)</p>