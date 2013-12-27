PROJECT
=======

## Create remote git repository

1. Create git repo.
2. Add remote ```$ git remote add origin REPO_URL```.
3. Push to repo ```$ git push --set-upstream origin```.


## Run specs

```$ rspec .```

## Run rake integrate

The project requires 100% of test coverage.

When you finish an implementation, run:

```$ rake integrate```

This task will run all tasks described on 'integration.rake' file, check the file and verify the steps.