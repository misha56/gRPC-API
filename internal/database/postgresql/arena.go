package postgresql

import (
	"grpc/internal/database/postgresql/db"
)

type Arena struct {
	q *db.Queries
}

func NewArena(d db.DBTX) *Arena {
	return &Arena{
		q: db.New(d),
	}
}