Quick start:

```bash
yarn docker:init
```

To start app outside Docker container:

```bash
# Kill old process
sudo kill -9 `sudo lsof -t -i:5000`

# Dev start
yarn start:dev

# Prod start
yarn build
yarn start
```

To enable online payment start Webhook:
```bash
stripe listen --forward-to localhost:5000/stripe/webhook
```

Copy database dump:
cat your_dump.sql | docker exec -i your-db-container psql -U postgres
