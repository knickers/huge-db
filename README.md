# huge-db
A pre-seeded mysql database (mariadb) for my [HUGE](https://github.com/knickers/huge) docker image.

The gist of this script is to copy [`01-create-database.sql`](https://github.com/panique/huge/blob/master/application/_installation/01-create-database.sql), [`02-create-table-users.sql`](https://github.com/panique/huge/blob/master/application/_installation/02-create-table-users.sql), and [`03-create-table-notes.sql`](https://github.com/panique/huge/blob/master/application/_installation/03-create-table-notes.sql) from the [HUGE source](https://github.com/panique/huge) into `/docker-entrypoint-initdb.d/` in the image. These are then run in order when the container is started.
