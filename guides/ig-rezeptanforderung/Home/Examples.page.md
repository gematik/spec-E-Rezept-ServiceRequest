# {{page-title}}

## Beispiele für Profile

### Beispiele für MessageHeader
@```
from MessageHeader
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)
```

### Beispiele für ServiceRequest
@```
from ServiceRequest
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)
```

### Beispiele für Patienten
@```
from Patient
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)
```

### Beispiele für Practitioner
@```
from Practitioner
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)
```

### Beispiele für Organization
@```
from Organization
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)
```

### Beispiele für MedicationRequest
@```
from MedicationRequest
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)
```

### Beispiele für MedicationDispense
@```
from MedicationDispense
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)
```

### Beispiele für Medication
@```
from Medication
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)
```



## Anwendungsfall Beispiele

### Beispiele für UC1: Rezeptanforderung durch Pflegeeinrichtung

Beispiele für diesen Anwendungsfall befinden sich im [Simplifier Projekt](https://simplifier.net/erezept-servicerequest/~resources?category=Example&exampletype=Bundle&sortBy=RankScore_desc). Beispiele für diesen Anwendungsfall sind benannt nach "UC1-*"

@```

from Bundle
where id.startsWith('UC1-')
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)

```

### Beispiele für UC2: Rezeptanforderung der Pflegeeinrichtung mit Einlösung durch Patient

Beispiele für diesen Anwendungsfall befinden sich im [Simplifier Projekt](https://simplifier.net/erezept-servicerequest/~resources?category=Example&exampletype=Bundle&sortBy=RankScore_desc). Beispiele für diesen Anwendungsfall sind benannt nach "UC2-*"

@```

from Bundle
where id.startsWith('UC2-')
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)

```


### Beispiele für UC3: Rezeptanforderung der heimversorgenden Apotheke

Beispiele für diesen Anwendungsfall befinden sich im [Simplifier Projekt](https://simplifier.net/erezept-servicerequest/~resources?category=Example&exampletype=Bundle&sortBy=RankScore_desc). Beispiele für diesen Anwendungsfall sind benannt nach "UC3-*"

@```

from Bundle
where id.startsWith('UC3-')
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)

```

### Beispiele für UC4: Rezeptanforderung für anwendungsfertige Zytostatikazubereitungen

Beispiele für diesen Anwendungsfall befinden sich im [Simplifier Projekt](https://simplifier.net/erezept-servicerequest/~resources?category=Example&exampletype=Bundle&sortBy=RankScore_desc). Beispiele für diesen Anwendungsfall sind benannt nach "UC4-*"

@```

from Bundle
where id.startsWith('UC4-')
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)

```