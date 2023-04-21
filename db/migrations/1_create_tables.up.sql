CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE game_state AS ENUM ('unspecified', 'ongoing', 'paused', 'ended');

CREATE TABLE arenas (
  arena_uuid  UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  arena_name  TEXT NOT NULL,
  arena_email TEXT NOT NULL
);

CREATE TABLE games (
  game_uuid   UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  arena_uuid  UUID REFERENCES arenas (arena_uuid) NOT NULL,
  game_title  TEXT NOT NULL,
  game_state  game_state DEFAULT 'unspecified' NOT NULL,
  player_count INTEGER DEFAULT 0
);
