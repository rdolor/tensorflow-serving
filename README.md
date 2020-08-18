# TensorFlow model serving

This TF serving uses the model from the [train-custom-tfestimator](https://github.com/rdolor/train-custom-tfestimator).

Run the commands:

-   To build the image: `make build`
-   To create the container: `docker-compose up -d` or `docker-compose run -d --service-ports pytrain_server`
-   To get into the container: `docker exec -it <container_name> bash`
-   To check the logs: `docker logs -f <container_name>`
-   To force stop the container: `docker rm -f <container_name>`

To check if it is able to get the right model, do `curl http://localhost:8501/v1/models/DNN`.
    To get the IP address, try running `docker-machine inspect default | grep IPAddress` and then use this address instead of localhost.

It should give a result similar to this:
```
{
 "model_version_status": [
  {
   "version": "1597737426",
   "state": "AVAILABLE",
   "status": {
    "error_code": "OK",
    "error_message": ""
   }
  }
 ]
}
```

When the model is updated a new one, a status would like this:
```
{
    "model_version_status": [
        {
            "version": "1597757765",
            "state": "AVAILABLE",
            "status": {
                "error_code": "OK",
                "error_message": ""
            }
        },
        {
            "version": "1597737426",
            "state": "END",
            "status": {
                "error_code": "OK",
                "error_message": ""
            }
        }
    ]
}
```


To check the metadata, do `curl http://localhost:8501/v1/models/DNN/metadata`

To get a prediction, POST on `http://localhost:8501/v1/models/DNN:predict`:
```
{
	"inputs":{
        "region"        : [[0]],
        "city"          : [[0]],
        "slotwidth"     : [[0]],
        "hour"          : [[0]],
        "slotvisibility": [[0]],
        "slotformat"    : [[0]],
        "slotprice"     : [[0]],
        "usertag"       : [[0,1,2]],
        "adexchange"    : [[0]],
        "weekday"       : [[0]],
        "slotheight"    : [[0]]
    }
}
```

An example output would be:
```
{
    "outputs": [
        0.198998734
    ]
}
```