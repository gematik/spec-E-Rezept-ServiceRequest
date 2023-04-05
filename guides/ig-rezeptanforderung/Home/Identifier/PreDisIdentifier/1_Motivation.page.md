## {{page-title}}

Dieser Identifier wird in `ServiceRequest.identifier[predisId]` verwendet, um eine Verknüpfung einer Verordungs- und Belieferungsanfrage zu der selben Medikation herzustellen.

Insbesondere wenn der Vorgang und die Erstellung der beiden Anfragen zeitversetzt erfolgt ist es für Systeme dann hilfreich diese Verknüpfung herzustellen und den Verlauf der Anfrage zu einem Medikament dann festzustellen.

Beispielsweise erstellt im Anwendungsfall {{pagelink:Home/Anwendungsfaelle/Rezeptanforderung-UC1}} das anfragende System zunächst nur die Verordnungsanfrage.
Nachdem der Verordnende das E-Rezept-Token übermittelt hat wird dann die Belieferungsanfrage zum gleichen Medikament gestellt. Diese erhält die gleiche predisId wie die Verordnungsanfrage. So kann bspw. der Status zur Anfrage eines Medikaments besser verfolgt werden.
