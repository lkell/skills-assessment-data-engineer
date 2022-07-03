# dbt Project For Cascade Skills Assessment: *dbt* Data Engineer

This directory consists of the dbt project used for the Skills Assessment: *dbt* Data Engineer submission.

## How To Run This Project

### Python and dbt Dependencies

`dbt-postgres` is required to run this project. One method to install the dependencies is to use [Poetry](https://python-poetry.org/). Once you have Python 3.10 and Poetry, installed you can use `poetry shell` and `poetry install` to activate a new Python virtual environment and install the required dependencies, including `dbt-postgres`.

### Development Database (optional)

This project Docker setup for an optional development Docker database. If you have Docker installed and installed the [taskipy](https://pypi.org/project/taskipy/1.0.0/) library through Poetry or other means (e.g. Pip), then you can use the following commands:

```console
task start-dev-db  # Creates a container with a Postgres DB instance for local development purposes
task stop-dev-db   # Stops the local Postgres DB container
```

`dbt` commands can then be run against the local database by setting `--profiles-dir dev` or by using `task dbt [additional commands and args...]`.

### Create seeds and build models

Simply run `dbt build` to seed the database and run and test all the models.
