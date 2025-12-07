export interface Player {
  id: string;
  name: string;
  team: string;
  position: string;
}

export interface Game {
  id: string;
  sportId: string;
  leagueId: string;
  homeTeam: string;
  awayTeam: string;
  date: string;
  venue?: string;
  players: Player[];
}

export interface League {
  id: string;
  name: string;
  sportId: string;
  games: Game[];
}

export interface Sport {
  id: string;
  name: string;
  leagues: League[];
}

export interface GameSearchFilters {
  teamNameQuery?: string;
  leagueNameQuery?: string;
  startDate?: string;
  endDate?: string;
}
