## Motivation

Diese Extension enthält einen Wahrheitswert darüber, ob der Verordnende ein anderes Arzneimittel verordnet hat als angefragt wurde.

Sollte der Arzt nach Prüfung der Rezeptanforderung etwas anderes verordnen, als der Anfragende angefragt hat, ist das Feld `valueBoolean` mit `true` zu setzen. So kann das System des Anfragenden den Nutzer explizit darauf hinweisen, dass die Antwort von der Anfrage abweicht. Die Extension kann automatisch vom PVS gesetzt werden, wenn der Verordnende eine Angabe in dem Rezept ändert.
