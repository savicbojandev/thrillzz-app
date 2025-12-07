import {
  Game,
  GameSearchFilters,
  League,
  Sport,
} from '../domain/types';
import { getSampleSports } from '../data/sampleSports';

const sportsData = getSampleSports();

export function getAllSports(): Sport[] {
  return sportsData;
}

export function findGameById(id: string): Game | undefined {
  for (const sport of sportsData) {
    for (const league of sport.leagues) {
      const game = league.games.find((g) => g.id === id);
      if (game) return game;
    }
  }
  return undefined;
}

export function searchSports(filters: GameSearchFilters): Sport[] {
  const normalizedTeam = (filters.teamNameQuery ?? '').trim().toLowerCase();
  const startDate = parseDate(filters.startDate);
  const endDate = parseDate(filters.endDate);

  return sportsData
      .map((sport) => {
        const filteredLeagues = sport.leagues
            .map((league) => {
              const filteredGames = league.games.filter((game) =>
                  matchesFilters(game, league, {
                    normalizedTeam,
                    startDate,
                    endDate,
                  }),
              );

              if (filteredGames.length === 0) return undefined;

              return { ...league, games: filteredGames };
            })
            .filter((league): league is League => Boolean(league));

        if (filteredLeagues.length === 0) return undefined;

        return { ...sport, leagues: filteredLeagues };
      })
      .filter((sport): sport is Sport => Boolean(sport));
}

function matchesFilters(
  game: Game,
  league: League,
  filters: {
    normalizedTeam: string;
    startDate?: Date;
    endDate?: Date;
  },
): boolean {
  if (filters.startDate && new Date(game.date) < filters.startDate) {
    return false;
  }
  if (filters.endDate && new Date(game.date) > filters.endDate) {
    return false;
  }

  if (filters.normalizedTeam) {
    const normalizedTitle =
        `${game.homeTeam} ${game.awayTeam}`.toLowerCase();
    const normalizedLeagueName = league.name.toLowerCase();
    const matchesTitle = normalizedTitle.includes(filters.normalizedTeam);
    const matchesLeague = normalizedLeagueName.includes(filters.normalizedTeam);

    if (!matchesTitle && !matchesLeague) {
      return false;
    }
  }

  return true;
}

function parseDate(input?: string): Date | undefined {
  if (!input) return undefined;
  const parsed = new Date(input);
  return Number.isNaN(parsed.getTime()) ? undefined : parsed;
}
