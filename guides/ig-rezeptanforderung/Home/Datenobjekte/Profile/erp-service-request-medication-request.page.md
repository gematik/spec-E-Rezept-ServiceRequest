---
canonical: https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-medication-request
expand: 2
---

# {{page-title}}

## Übersicht über das Profil

<fql output="table">
	from
		StructureDefinition
	where
		url = %canonical
	select
		Name: name,
		Description: description,
		Canonical_URL: url,
		Status: status,
		Version: version,
    'Basiert auf': baseDefinition
</fql>

## Über das Profil

### Motivation

//TODO
Dieses Profil wird in den Anwendungsfällen genutzt, um angefragte, verordnete oder dispensierte Arzneimittelinformationen zu übertragen.

Als Anfragender möchte ich angeben können, welche Medikation ich für einen Patienten anfragen möchte. Eine Einrichtung/ Person, die eine Verordnung anfragt nutzt dieses Profil, um strukturiert anzugeben, welche Medikation benötigt wird.
Hierzu muss in ERPServiceRequestPrescriptionRequest.basedOn ein ERPServiceRequestMedicationRequest mit angegeben werden. Dieser enthält die medizinische Information, die der Verordnende benötigt, um ein entsprechendes Rezept auszustellen.

Analog kann der Verordnende angeben, welches Arzneimittel er verordnet hat, sowie ein abgebender LE welches Arzneimittel geliefert wird.

Die anzugebende Medication entspricht dabei den [Medication Profilen](https://simplifier.net/erezept/~resources?category=Profile&corebasetype=Medication&sortBy=RankScore_desc) aus dem eRezept Projekt der KBV.

Da die [KBV_PR_ERP_Prescription](https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription) Informationen voraussetzt, die u.U. im Moment der Anfrage nicht bekannt sind, wurde dieses Profil spezifiziert. Es lehnt sich an die Spezifikation der KBV_PR_ERP_Prescription an, ist aber offener, erlaubt also auch dass die fehlenden Informationen nicht angegeben werden müssen.

## Inhalt des Profils

Folgende Ansichten existieren auf das Profil:

<tabs>
<tab title="Overview">
	{{tree, buttons}}
</tab>
<tab title="Detailed view">
	{{dict}}
</tab>
<tab title="XML">
	{{xml}}
</tab>
<tab title="JSON">	
	{{json}}
</tab>
<tab title="Link">
	{{link}}
</tab>
</tabs>

## Terminologie Bindings

Folgende Bindings sind für diese Ressource spezifiziert:

<fql>
	from
    	StructureDefinition
	where
    	url = %canonical
	select
    	join for differential.element
      		select {
				Path: id,
				join
				for binding
				where valueSet.exists()
				select {
					Conformance: strength,
					ValueSet: valueSet}
        	}
</fql>

## Constraints

Folgende Constraints sind für diese Ressource spezifiziert:

<fql>
    from
		StructureDefinition
    where
		url = %canonical
    for differential.element where constraint.exists()
    select
    Pfad: id,
    join for constraint
        select {
				Id: key,
				Grade: severity,
				Details: human,
				Expression: expression
				}
</fql>