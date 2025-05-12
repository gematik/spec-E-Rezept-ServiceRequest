# {{page-title}}

Diese Seite enthält weitere Hinweise zur UI und Prozessablaufen im Rahmen der in diesem IG beschriebenen Anwendungsfälle.

## Angabe der LANR fehlt bei Rezeptanforderung

Es ist denkbar, dass bei Übermittlung der Therapiedaten von Krankenhaus an Apotheke, um eine Rezeptanforderung zu erstellen, die Arztnummer des Arztes, welcher die Rezeptanforderung erwartet, nicht angegeben wurde. Dies kann zu Problemen führen, da die Apotheke die Rezeptanforderung nicht eindeutig einem bestimmten Arzt zuordnen kann.

Um diese Situation zu verbessern, empfehlen wir eine Abstimmung zwischen dem Krankenhaus und der Apotheke. Folgende Schritte könnten dabei hilfreich sein:

1.  **Kommunikation:** Das Krankenhaus sollte sicherstellen, dass bei jeder Rezeptanforderung per KIM die Arztnummer des behandelnden Arztes durch das AVS angegeben werden kann. Dazu muss diese der Apotheke vorab mitgeteilt werden.
2.  **Apothekenprozess:** Die Apotheke kann ihre Abläufe überprüfen und sicherstellen, dass sie die eingehenden Therapieanforderungen auf Korrektheit überprüft.
3.  **Rückfragen:** Falls eine Therapieanforderung ohne Arztnummer eintrifft, sollte die Apotheke das Krankenhaus kontaktieren und um die fehlenden Informationen bitten.
4.  **Zuteilung durch Krankenhaus:** Falls eine Rezeptanforderung von der Apotheke an das Krankenhaus per KIM übermittelt wird und die Arztnummer fehlt, kann das Krankenhaus selbst Prozesse definieren, wie es mit dieser Rezeptanforderung umgeht (Wer bearbeitet diese Anforderung?).
5.  **Dokumentation:** Es ist wichtig, alle Kommunikation und getroffenen Vereinbarungen schriftlich zu dokumentieren, um Missverständnisse zu vermeiden.

Die Profile der Rezeptanforderung beziehen sich auf die generischen FHIR-Profile. Dort sind fast alle Angaben optional. Sollte keine Arztnummer (LANR) bekannt sein, können auch andere Informationen (Klartext Namen, Institution, Station) übergeben werden. ([siehe Discussion #78](https://github.com/gematik/spec-E-Rezept-ServiceRequest/discussions/78))
Wir hoffen, dass diese Empfehlungen dazu beitragen, die Zusammenarbeit zwischen Krankenhaus und Apotheke zu verbessern und die ordnungsgemäße Zuordnung von Rezepten sicherzustellen.

## UI Empfehlungen
-   Rezeptanforderungen, die nach einer durch den Kunden definierten Bearbeitungszeit nicht bearbeitet wurden, sollten erkennbar markiert werden. 
-   Rezeptanforderung, die einem speziellen Arzt zugewiesen wurden, sollten im KIS deutlich aufzeigen, dass sie für dieses Arzt gedacht sind. (gilt auch bei Rezepte auf Signaturliste.)
    

## Eskalation bei ausbleibender Rezeptbearbeitung

### Zeitnahe Bearbeitung von Rezeptanforderungen im Krankenhaus (Eskalationsstufen)

**Ziel:**
Es ist sicherzustellen, dass Rezeptanforderungen im Krankenhaus effizient und zeitnah bearbeitet werden. Dafür können Eskalationsstufen hilfreich sein, um sicherzustellen, dass bei Verzögerungen der Kreis der zuständigen Bearbeiter erweitert wird.

1.  **Rezeptanforderung eingegangen:**
    -   Sobald eine Rezeptanforderung im Krankenhaus eingeht, sollte sie umgehend registriert werden.
    -   Die zuständige Person (z. B. Arzthelfer:in) prüft die Vollständigkeit der Informationen (Patientendaten, Medikamente, Dosierung usw.).
        
2.  **Bearbeitungsfrist:**
    -   Es sollte eine maximale Bearbeitungsfrist festgelegt werden (über individuelles Kundencustomizing, z. B. 24 Stunden ab Eingang der Anforderung).
    -   Falls die Bearbeitung nicht innerhalb dieser Frist erfolgt, greifen die Eskalationsstufen.
        
3.  **Eskalationsstufen:**
    -   **Stufe 1 (Standardbearbeitung):**
        -   Die zuständige Person (bestenfalls ist diese in der Rezeptanforderung benannt) bearbeitet die Anforderung gemäß den internen Vorgaben (asap).
    -   **Stufe 2 (Verzögerung):**
        -   Falls die Bearbeitungsfrist überschritten wird (ist über ein individuelles Kundencustomizing zu definieren), soll der Bearbeiterkreis automatisiert erweitert werden, sodass weitere Personen auf die Rezeptanforderung zugreifen können.
        -   Zusätzlich wird empfohlen die Dringlichkeit zu signalisieren (UI)
    -   **Stufe 3 (weitere Eskalation):**
        -   Wenn auch die zweite Frist nicht eingehalten wird, wird die Anforderung an die nächsthöhere Instanz (z. B. Chefarzt) weitergeleitet.
        -   Der Chefarzt oder eine andere befugte Person übernimmt kann die Bearbeitung übernehmen oder delegiert sie an eine andere Fachabteilung.
            
4.  **Dokumentation:**
    -   Alle Schritte und Kommunikation sollten sorgfältig dokumentiert werden.
    -   Die Gründe für Verzögerungen und die getroffenen Maßnahmen sollten ebenfalls festgehalten und bei weiterer Anpassung der Eskalationsstufen berücksichtigt werden.
        
5.  **Kommunikation mit der Apotheke:**
    -   Zusätzlich ist nicht ausgeschlossen, dass die Apotheke über eine Verzögerungen informiert wird.
        
6.  **Regelmäßige Überprüfung:**
    -   Die Wirksamkeit des Prozesses sollte regelmäßig überprüft und gegebenenfalls angepasst werden.
