import redis
import json
import argparse
import logging
import sys

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def generate_parameters():
  parser = argparse.ArgumentParser(
    description = 'Kanopy Redis User store population',
    epilog = 'Brian Walsh, brian.walsh@insight-centre.org\n'
  )

  parser.add_argument('-i', dest="input_file", type=str, required=True, help="Input file")
  parser.add_argument("--rs-host", dest="redis_host", type=str, required=True, help="Host of redis instance")
  parser.add_argument("--rs-port", dest="redis_port", type=int, required=True, help="Port of redis instance")
  parser.add_argument("--rs-db", dest="redis_db", type=int, required=True, help="Redis db to use")
  #parser.add_argument("--log-file", dest="log_file", type=str, required=False, help="Log file to use")
  return parser.parse_args()


def import_data():

  param = generate_parameters()
  
  with open(param.input_file) as f:
    data = json.load(f)
  
  logger.info("Data read from %s" % (param.input_file))

  r = redis.StrictRedis(param.redis_host, param.redis_port, param.redis_db)
  #Clear the redis db
  r.flushdb()
  logger.info("Cleared redis db")

  #Add the data from the input file
  logger.info("Adding data to redis")
  for key, value in data.items():
    r.set(key, json.dumps(value))

  logger.info("%s keys added to redis" % (len(r.keys())))

#if __name__ == '__main__':
#  import_data()
