# ORCIDS from DBLP

Parses the [DBLP](dblp.uni-trier.de) XML in order to gather all author info per [ORCID](https://orcid.org/), saving it to a single csv. You can also [download the csv directly from the repo](dblp-orcids.csv).


#### Run
We use a Docker-based deployment. To run use the following command:
```sh
docker run --rm -ti jfloff/dblp-orcids 1> dblp-orcids.csv
```
If you want to run on a standard environment, just install the `requirements.pip` and run `./parse.py`

The `parse.py` script has a couple of options:
- `--out` [default=True] : Outputs csv to stdout. Useful for redirecting output. Redirect only stdout, since stderr has progress messages.
- `--csv` [default=False] : Saves to 'dblp-orcids.csv'.
- `--no-download` [default=False] : Does not download DBLP XML files. Useful for development.

**Note**: when running please have in mind that the DBLP XML is large (more than 2GB). Even though we tried to improve memory management while parsing, it still requires a considerable amount.

The image `jfloff/dblp-orcids` is already available through [Docker Hub](https://hub.docker.com/r/jfloff/dblp-orcids/), but you can always clone this repo and build it yourself.
```sh
docker build --rm -t jfloff/dblp-orcids .
```

#### Read CSV
Here is a snippet to load the CSV into python pandas:
```python
from ast import literal_eval
import pandas as pd

dblp_info=pd.read_csv('dblp-orcids.csv', comment='#', encoding='utf-8',
                dtype={
                    # force dtypes: pandas with problems guessing
                    'acm_id': object,
                    'scopus_id': object,
                },
                converters={
                    # parse lists of alias and dblp_keys to python object
                    'alias': lambda x: literal_eval(x),
                    'dblp_key': lambda x: literal_eval(x),
                },
                # optional: set index to orcid
                index_col='orcid')

```

## License
The code in this repository, unless otherwise noted, is MIT licensed. See the LICENSE file in this repository. When using this repository do not forget to acknowledge [DBLP](dblp.uni-trier.de).