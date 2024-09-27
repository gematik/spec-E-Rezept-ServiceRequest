## {{page-title}}

### Beispiele für UC2: Rezeptanforderung der Pflegeeinrichtung mit Einlösung durch Patient

Beispiele für diesen Anwendungsfall befinden sich im [Simplifier Projekt](https://simplifier.net/erezept-servicerequest/~resources?category=Example&exampletype=Bundle&sortBy=RankScore_desc). Beispiele für diesen Anwendungsfall sind benannt nach "UC1-*"

@```

from Bundle
where id.startsWith('UC2-')
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)

```