--- name: SelectGame :one
SELECT
  arena_uuid,
  game_uuid,
  game_title,
  game_state,
  player_count
FROM
  games
WHERE
  game_uuid = @game_uuid
LIMIT 1;

-- name: InsertGame :one
INSERT INTO games (
  arena_uuid,
  game_title,
  game_state,
  player_count
)
VALUES (
  @arena_uuid,
  @game_title,
  @game_state,
  @player_count
)
RETURNING game_uuid;

-- name: UpdateGame :one
UPDATE games SET
  game_title = @game_title,
  game_state = @game_state,
  player_count = @player_count
WHERE game_uuid = @game_uuid
RETURNING game_uuid AS res;