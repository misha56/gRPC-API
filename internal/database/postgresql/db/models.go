// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.17.2

package db

import (
	"database/sql"
	"database/sql/driver"
	"fmt"

	"github.com/google/uuid"
)

type GameState string

const (
	GameStateUnspecified GameState = "unspecified"
	GameStateOngoing     GameState = "ongoing"
	GameStatePaused      GameState = "paused"
	GameStateEnded       GameState = "ended"
)

func (e *GameState) Scan(src interface{}) error {
	switch s := src.(type) {
	case []byte:
		*e = GameState(s)
	case string:
		*e = GameState(s)
	default:
		return fmt.Errorf("unsupported scan type for GameState: %T", src)
	}
	return nil
}

type NullGameState struct {
	GameState GameState
	Valid     bool // Valid is true if GameState is not NULL
}

// Scan implements the Scanner interface.
func (ns *NullGameState) Scan(value interface{}) error {
	if value == nil {
		ns.GameState, ns.Valid = "", false
		return nil
	}
	ns.Valid = true
	return ns.GameState.Scan(value)
}

// Value implements the driver Valuer interface.
func (ns NullGameState) Value() (driver.Value, error) {
	if !ns.Valid {
		return nil, nil
	}
	return string(ns.GameState), nil
}

type Arenas struct {
	ArenaUuid  uuid.UUID
	ArenaName  string
	ArenaEmail string
}

type Games struct {
	GameUuid    uuid.UUID
	ArenaUuid   uuid.UUID
	GameTitle   string
	GameState   GameState
	PlayerCount sql.NullInt32
}
