# Thrillzz Sports App Backend (Node.js)

Express + TypeScript API that serves the mock sports/leagues/games tree consumed by the Flutter
client.

## Run locally

```bash
cd thrillzz-sports-app-backend
npm install
npm run dev   # http://localhost:3001
```

Build for production:

```bash
npm run build
npm start
```

## Lokalne verzije / konfiguracija (backend)

- Node: v24.1.0
- npm: 11.3.0
- Base domain (matches Flutter client): `http://localhost:3001/api/`

## API

- `GET /health` – health probe.
- `GET /api/sports` – full Sport → League → Game → Player graph.
- `GET /api/sports/search?teamName=&leagueName=&startDate=&endDate=` – filters games and trims out
  empty leagues/sports. `teamName` matches either team name or league name, `leagueName` gates by
  league title, and dates expect ISO strings.
- `GET /api/games/:id` – single game payload, 404 if missing.

## Architecture notes

- In-memory mock data lives in `src/data/sampleSports.ts`; it mirrors the Flutter fixtures so IDs
  stay stable across both apps.
- `src/domain` holds types; `src/services` keeps pure filtering/lookups; `src/routes` wires HTTP;
  `src/index.ts` handles Express bootstrap and coarse error handling.
- No database or auth; everything is stateless. Validation is minimal because the consumers are
  trusted for this exercise.

## What I'd add with more time

- Input validation (zod/joy) and richer 4xx responses.
- Persistence + migrations instead of in-memory mocks.
- Contract tests against the Flutter client plus CI lint/test hooks.
