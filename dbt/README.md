# dbt Project For Cascade Skills Assessment: *dbt* Data Engineer

This directory consists of the dbt project used for the Skills Assessment: *dbt* Data Engineer submission.

## How To Run This Project

### Python and dbt Dependencies

`dbt-postgres` is required to run this project. One method to install the dependencies is to use [Poetry](https://python-poetry.org/). Once you have Python 3.10 and Poetry installed, you can use `poetry shell` and `poetry install` to activate a new Python virtual environment and install the required dependencies, including `dbt-postgres`.

### Development Database (optional)

This project Docker setup for an optional development Docker database. If you have Docker installed and installed the [taskipy](https://pypi.org/project/taskipy/1.0.0/) library through Poetry or other means (e.g. Pip), then you can use the following commands:

```console
task start-dev-db  # Creates a container with a Postgres DB instance for local development purposes
task stop-dev-db   # Stops the local Postgres DB container
dbt-dev            # Runs dbt commands with the local `dev/` folder as --profiles-dir
```

`dbt` commands can be run against the local database using the `task dbt` command listed above, or by setting the dbt `--profiles-dir` argument to `dev`.

### dbt Dependencies

This project uses [dbt-utils](https://github.com/dbt-labs/dbt-utils) and [dbt-expectations](https://github.com/calogica/dbt-expectations). To install these dependencies, use the `dbt deps` command.
### Create seeds and build models

Simply run `dbt build` to seed the database and run and test all the models.
