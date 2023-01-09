# Inhalt

- [KIM DSN (Zustellbestätigung)](#kim-zustellbestaetigung)
  - [KIM DSN (Zustellbestätigung) Beispielnachricht](#kim-zustellbestaetigung-beispielnachricht)

## KIM DSN (Zustellbestätigung)

Zustellbestätigungen für übertragene Nachrichten aus dem Kontext der Rezeptanforderungen gehören zur KIM Standardkommunikation (Rückgabewert `Status`) des KIM Use Cases `KIM-Mail senden`, welche in den Use Cases des technischen Konzepts beschrieben sind. Diese Zustellbestätigungen sind KIM Standardfunktionalität, beschrieben in [API-KIM](https://github.com/gematik/api-kim/blob/92ed556ff6c49fd6c003b6a3b625319af367107c/docs/faq.adoc#faq-generierung-von-zustellbest%C3%A4tigungen-dsn) sowie [KOM-LE-A_2147] der gemSpec_FD_KOMLE.

Sie besitzen keine eigene Dienstkennung.

### KIM DSN (Zustellbestätigung) Beispielnachricht

    Date: Thu, 15 Dez 2022 11:55:11 +0100
    From: Mail Delivery Subsystem <mds@xyz.kim.telematik>
    Message-Id: 456146547.1541684416611
    Subject: Zustellbestaetigung
    To: Pflegeheim@xyz.kim.telematik
    MIME-Version: 1.0
    Content-Type: multipart/report; report-type=delivery-status;
    boundary="456146547.1541654416816"

    --456146547.1541654416816

    Nachricht zugestellt

    --456146547.1541654416816
    content-type: message/delivery-status
    Original-Recipient: Pflegeheim@xyz.kim.telematik
    Final-Recipient: Pflegeheim@xyz.kim.telematik
    Action: delivered
    Status: 4.0.0
    Arrival-Date: Thu, 15 Dez 2022 11:51:21 +0100

    --456146547.1541654416816
