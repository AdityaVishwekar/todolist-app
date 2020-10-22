##Errors:
### Docker

ERROR: Named volume "db/postgres-init.sql:/docker-entrypoint-initdb.d/postgres-init.sql:rw" is used in service "db" but no declaration was found in the volumes section.

Solution - Use "./db" instead of "db"
```
"./db/postgres-init.sql:/docker-entrypoint-initdb.d/postgres-init.sql"
```

Following Error - 
```
api_1     | [Nest] 18   - 10/20/2020, 9:57:26 PM   [ExceptionHandler] connect ECONNREFUSED 0.0.0.0:5432 +13ms
```
Solution - The 0.0.0.0 is the listening address, it's used to listen on all interfaces and isn't an IP that you connect to. In your connect string, specify the service name for the hostname to connect to, in your case database.
```
Update HOST_NAME in ./todo-api/src/database/database.providers.ts
```

Solution2 - Add env variable
```
environment:
      DB_HOST_NAME: db
```