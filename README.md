# Web pro Státnice 2024 na VŠPJ

## Run locally

- Clone repository

```bash
git clone https://github.com/Lynder063/statnice.git
```

- Go to the directory

```bash
cd statnice/
```

### Backend

- Configure your `.env` for backend

```bash
DB_USER=statnice
DB_HOST=ipOFdb
DB_DATABASE=statnice
DB_PASSWORD='Very Secure Password'
DB_PORT=5432
```

- And import SQL dump

```bash
psql -U statnice -d statnice -f /structures/dump.sql
```

- Start backend

```bash
node index.js
```

### Frontend

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3001](http://localhost:3001) with your browser to see the result.
