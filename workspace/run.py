# Databricks notebook source
from logging import getLogger, INFO, ERROR, StreamHandler

# COMMAND ----------
getLogger('py4j').setLevel(ERROR)
log = getLogger('Notebook')
log.setLevel(INFO)
log.addHandler(StreamHandler())

# COMMAND ----------
log.info('Hello World')
