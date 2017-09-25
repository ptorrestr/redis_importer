from multiprocessing import util
import subprocess
from setuptools import setup

def readme():
  with open('README.md') as f:
    return f.read()

def version():
  out = subprocess.Popen(['git','describe','--tags'], stdout = subprocess.PIPE, universal_newlines = True)
  out.wait()
  if out.returncode == 0:
    m_version = out.stdout.read().strip()
    version = m_version.split("-")
    if len(version) > 0:
      print(version[0])
      return version[0]
  return "0.0.1" #default version

DESCRIPTION="Script to import data into redis"
AUTHOR="Brian Walsh"
AUTHOR_EMAIL="brian.walsh@insight-centre.org"

setup(
  name="redis-importer", version=version(),
  description = DESCRIPTION, long_description = readme(),
  author=AUTHOR, author_email=AUTHOR_EMAIL,
  maintainer=AUTHOR, maintainer_email=AUTHOR_EMAIL,
  requires=["redis"],
  packages=["redis_importer"],
  entry_points={"console_scripts":['redis-importer = redis_importer.importer:import_data']}
)

