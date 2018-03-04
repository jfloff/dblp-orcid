# DBLP Orcid

Parses the [DBLP](dblp.uni-trier.de) XML in order to gather all author info per [ORCID](https://orcid.org/), saving it to a single csv. You can also [download the csv directly from the repo](dblp-orcids.csv).


#### Build
```sh
docker build --rm -t jfloff/dblp-orcid .
```


#### Run
```sh
docker run -v $(pwd):/home/dblp-orcid --rm -ti jfloff/dblp-orcid ./parse.py
```
Note: when running please have in mind that the DBLP XML is large (more than 2GB). Even though we tried to improve memory management while parsing, it still requires a considerable amount.


## License
The code in this repository, unless otherwise noted, is MIT licensed. See the LICENSE file in this repository. When using this repository do not forget to acknowledge [DBLP](dblp.uni-trier.de).