while ! mysqladmin ping -h"database" --silent; do
  sleep 1
done

# Run all migrations on the database.
alembic upgrade head