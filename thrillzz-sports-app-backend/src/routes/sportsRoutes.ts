import { Router, Request, Response } from 'express';
import { GameSearchFilters } from '../domain/types';
import {
  findGameById,
  getAllSports,
  searchSports,
} from '../services/sportsService';

export const sportsRouter = Router();

sportsRouter.get('/sports', (_req: Request, res: Response) => {
  res.json({ sports: getAllSports() });
});

sportsRouter.get('/sports/search', (req: Request, res: Response) => {
  const normalize = (value: unknown) => {
    const str = value?.toString() ?? '';
    return str.length > 0 ? str : undefined;
  };

  const filters: GameSearchFilters = {
    teamNameQuery: normalize(req.query.teamName),
    leagueNameQuery: undefined,
    startDate: normalize(req.query.startDate),
    endDate: normalize(req.query.endDate),
  };

  const results = searchSports(filters);
  res.json({ sports: results });
});

sportsRouter.get('/games/:id', (req: Request, res: Response) => {
  const game = findGameById(req.params.id);
  if (!game) {
    return res.status(404).json({ error: 'Game not found' });
  }

  return res.json({ game });
});
