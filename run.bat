robot --dry -d results --listener listeners/LogListener.py --listener listeners/EmailListener.py -V listeners/config.py tests &
robotmetrics --inputpath ./results/ -M metrics.html