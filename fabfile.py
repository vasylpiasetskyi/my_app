"""
Please install fabric3 before run command from this module.

Install fabric3 from console:
>>> python3 -m pip install -U pip
>>> python3 -m pip install -U fabric3
"""

import multiprocessing
from fabric.api import task, local

DC = "docker-compose -f docker-compose.dev.yml"
SETTINGS = "--settings my_app.settings.dev"
PYTHON = "python3"


@task
def build():
    """Run docker-compose build command.

    Example: docker-compose -f docker-compose.dev.yml build 
    """
    local(f"{DC} build")


@task
def start():
    """Run docker-compose in detach mode.
    Run containers in the background.
    Example: docker-compose -f docker-compose.dev.yml up -d
    """
    local(f"{DC} up -d")


@task
def start_():
    """Run docker-compose.
    Example: docker-compose -f docker-compose.dev.yml up -d
    """
    local(f"{DC} up")


@task
def stop():
    """Stop docker-compose.

    Example: docker-compose -f docker-compose.dev.yml dowm
    """
    local(f"{DC} down")


@task
def status():
    """Show docker-compose status."""
    local(f"{DC} ps")


@task
def logs():
    """Show docker-compose status."""
    local(f"{DC} logs")


@task
def makemigrations(app='', fake=False, settings=SETTINGS):
    """Make django migration."""
    fake = '--fake-initial' if fake else ''
    local(f"{DC} exec app {PYTHON} src/manage.py makemigrations {app} {fake} {settings}")


@task
def migrate(app='', settings=SETTINGS):
    """Run django migration."""
    local(f"{DC} exec app python3 src/manage.py migrate {app} {settings}")


@task
def run(settings=SETTINGS):
    """Run django development server.
    docker-compose -f docker-compose.dev.yml exec app python3 src/manage.py runserver 0.0.0.0:8000 --settings my_app.settings.dev
    """
    local_addr = "0.0.0.0:8000"
    local(f"{DC} exec app {PYTHON} src/manage.py runserver {local_addr} {settings}")


# @task
# def run(settings=SETTINGS):
#     """Run django development server with celery worker and celery beat.
#     docker-compose -f docker-compose.dev.yml exec -d worker celery --app good_job --workdir ./src worker --loglevel INFO -f /app/logs/worker.log & \
#     docker-compose -f docker-compose.dev.yml exec -d beat celery --app good_job --workdir ./src beat --loglevel INFO -f /app/logs/beat.log & \
#     docker-compose -f docker-compose.dev.yml exec app python3 src/manage.py runserver 0.0.0.0:8000 --settings good_job.settings.dev
#     """
#     local_addr = "0.0.0.0:8000"
#     local(f"{DC} exec -d worker celery --app my_app --workdir ./src worker --loglevel INFO -f /app/logs/worker.log & "
#           f"{DC} exec -d beat celery --app my_app --workdir ./src beat --loglevel INFO -f /app/logs/beat.log & "
#           f"{DC} exec app {PYTHON} src/manage.py runserver {local_addr} {settings}")


@task
def collectstatic(settings=SETTINGS):
    """Collect static for production."""
    local(f"{DC} exec app python3 src/manage.py collectstatic --noinput {settings}")


@task
def shell(settings=SETTINGS):
    """Run django shell in web container."""
    local(f"{DC} exec app python3 src/manage.py shell_plus {settings}")


@task
def bash():
    """Run bash in web container."""
    local(f'{DC} app /bin/bash')


@task
def manage(command, app_name='', settings=SETTINGS):
    """Run django manage command."""
    local(f"{DC} exec app python3 src/manage.py {command} {app_name} {settings}")


@task
def sqlshell(settings=SETTINGS):
    """Run django shell with uploaded all models."""
    command = "shell_plus"
    local(f"{DC} exec app python3 src/manage.py {command} --print-sql {settings}")


@task
def db_shell():
    """Run postgres command line interface."""
    local(f'{DC} exec db psql -h postgres -U postgres')


@task
def unittest(app_name=''):
    """Run test.
       Command for run all tests: fab unittest:src
       Command for run dedicated tests: fab unittest:apps
       Example: docker-compose -f docker-compose.dev.yml exec app python3 src/manage.py test apps -v 2"""
    local(f"{DC} exec app python3 src/manage.py test {app_name} -v 2")


@task
def pytest(app_name='', multicore=False, isort=False):
    """Run pytest."""
    if multicore:
        cpu_cores = multiprocessing.cpu_count()
        cpu_cores = "-n " + str(cpu_cores)
    else:
        cpu_cores = ''
    use_isort = '--isort' if isort else ''
    settings = "settings.testing"
    pytest_cmd = ('{} exec app bash -c "cd /app/src && pytest {0} -x -s -v {1} {2} --create-db --reuse-db --ds={}"')
    local(pytest_cmd.format(DC, app_name, cpu_cores, use_isort, settings))


@task
def db_backup(container_name='db_my_app', dest="fixtures/db_dump.sql"):
    """Make backup for database.

    Example:
        docker exec -t -u postgres db_my_app pg_dumpall -c > fixtures/db_dump.sql
    """
    local(f"docker exec -t -u postgres {container_name} pg_dumpall -c > {dest}")


@task
def db_restore(container_name='db_my_app', src="fixtures/db_dump.sql"):
    """Restore DB data from sql file.

    Example:
        cat fixtures/db_dump.sql | docker exec -i goodjob_db_1 psql -Upostgres
    """
    local(f"cat {src} | docker exec -i {container_name} psql -Upostgres")
