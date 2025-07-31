Extension: RemainingSupplyEX
Id: remaining-supply-ex
Title: "Restreichweite strukturiert"
Description: "Diese Extension gibt strukturiert darüber Auskunft, wie lange die Reichweite der Medikation noch dauert. Angabe erfolgt mit Wert und Einheit (z.B. 7 Stück)."
* insert Meta (remaining-supply-ex)
* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity.value 1..1 MS
* valueQuantity.unit 1..1 MS