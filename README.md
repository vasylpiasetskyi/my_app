# my_app
My app projects created by Django


## Requirements
- Docker
- Docker Compose


## Development
- Clone project
- Save `.env.example` as `.env` add edit settings in this file
- Install `fabric3` by console command: `python3 -m pip install fabric3`
- Run `fab build`, only for install or update project's dependencies
- Run `fab start` for start project
- Run `fab run` for starting an application server in dev mode
- Run `fab migrate` for appling DB migrations (in other console window)
- Run `fab manage:createsuperuser` for creating an admin user for access to admin area 
- Visit `localhost:8000`
- To shutdown project run `fab stop`
- If you can't install or use fabric see `fabfile.py` for correct docker command


## DB Backup and Restore
- To restore db data from fixtures/db_dump.sql with `fab db_restore`
- To backup db data to fixtures/db_dump.sql with `fab db_backup`


## Demo users:
Admin:
- username: admin
- email: admin@admin.com
- password: admin
