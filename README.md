# !!! IMPORTANT !!! - Archived
This project has been archived and is no longer actively maintained.  All code has been migrated to the [TIMS project](https://github.com/SmarterApp/TIMS).

# AP_IAT_Schema

Contains SQL schema migrations to support the IAT application(s). Uses the [flyway gradle plugin](https://flywaydb.org/documentation/gradle/).


# Local Development

The local execution expects a Postgres database at localhost on port 5432 with an existing iat database already 
created on it.

Your environment must have the env var DB_PASSWORD set with the password to your local iat database.  The environment
value is used when running locally. 

To execute this locally, in a terminal run `./gradlew bootRun`

# Release Process

The last migration script added is the release version.  We create a release in the GitHub repository called, 
for example, V8_iat.  We build the and copy the `build/libs/AP_IAT_Schema.jar` to the release.

This release is used in the deployment projects.  They look for this release, pull down the JAR, and execute the IAT 
database migration.