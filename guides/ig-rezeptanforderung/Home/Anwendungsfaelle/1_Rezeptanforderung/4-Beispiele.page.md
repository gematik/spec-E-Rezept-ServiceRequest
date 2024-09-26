## {{page-title}}

### Beispiele für UC1: Rezeptanforderung durch Pflegeeinrichtung

Beispiele für diesen Anwendungsfall befinden sich im [Simplifier Projekt](https://simplifier.net/erezept-servicerequest/~resources?category=Example&exampletype=Bundle&sortBy=RankScore_desc). Beispiele für diesen Anwendungsfall sind benannt nach "UC1-*"

@```

from Bundle
where id.startsWith('UC1-')
select Name: id, Link: link('https://simplifier.net/erezept-servicerequest/' + id)

```