--- name: SelectArena :one
SELECT
  arena_uuid,
  arena_name,
  arena_email
FROM
  arenas
WHERE
  arena_uuid = @arena_uuid
LIMIT 1;

-- name: InsertArena :one
INSERT INTO arenas (
  arena_name,
  arena_email
)
VALUES (
  @arena_name,
  @arena_email
)
RETURNING arena_uuid;

-- name: UpdateArena :one
UPDATE arenas SET
  arena_name = @arena_name,
  arena_email = @arena_email
WHERE arena_uuid = @arena_uuid
RETURNING arena_uuid AS res;