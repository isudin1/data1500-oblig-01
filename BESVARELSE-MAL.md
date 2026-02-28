# Besvarelse - Refleksjon og Analyse

**Student:** [Isudin abdulaahi ahmed]

**Studentnummer:** [407466]

**Dato:** [Innleveringsdato]

---

## Del 1: Datamodellering

### Oppgave 1.1: Entiteter og attributter

**Identifiserte entiteter:**


* Kunde
* Sykkel
* Stasjon
* Lås
* utleie

jeg valgte disse fordi de er ganske sentrale eniteter som trengs for å forstå og løse denne oppgaven.

1. Kunder registrerer seg

2. Sykler står på stasjoner

3. Stasjoner har låser

4. Kunder leier sykler

5. Utleie har starttid og sluttid

6. Det registreres et beløp

**Attributter for hver entitet:**



* Kunde
 - Kunde_Id     
 - Fornavn
 - Etternavn
 - E-post
 - Mobilnummer

 (kunde_id brukes som unik identifikator)
 (fornavn, etternavn, epost og mobilnummer brukes for identifikasjon og kontakt.)






* Sykkel
 - Sykkel_id
 - stasjon_id foreign key
 - lås id foreign key

 (sykkel_id identifiserer hver sykkel unikt.)
 (lås_id og stasjon_id brukes for å registrere hvor sykkelen befinner seg når den ikke er utleid.)


* stasjon
- stasjon_id
- navn

(stasjon_id identifiserer stasjonen unikt.)

(navn brukes for å beskrive eller identifisere stedet.)





* lås
- lås_id 
- stasjon_id

(lås_id identifiserer låsen unikt.)

(stasjon_id kobler låsen til riktig stasjon.)



* utleie
- utleie_id
- sykkel_id
- kunde_id
- starttid
- slutttid
- beløp

(utleie_id identifiserer hver utleie unikt.)

(kunde_id kobler utleien til en kunde.)

(sykkel_id kobler utleien til en sykkel.)

(starttid og sluttid brukes for å registrere leieperioden og avgjøre om utleien er aktiv.)

(beløp lagrer betalingsinformasjon for den spesifikke utleien.)







---

### Oppgave 1.2: Datatyper og `CHECK`-constraints

**Valgte datatyper og begrunnelser:**

* int: jeg valgte denne for de ulike primærnøklene og fremmednøklene fordi de representerer heltall
* varchar: valget jeg fordi de lagrer tekst som navn, epost og mobilnummer og jeg kan begrense lengden på teksten
* timestamp: fordi jeg må lagre starttid og slutttid for å beregne utleieperioden
* numeric: valgte jeg for beløp fordi det representerer penger numeric gir presis lagring av desimaltall og unngår avrundingsfeil som kan oppstå med float

**`CHECK`-constraints:**

[Skriv ditt svar her - list opp alle CHECK-constraints du har lagt til og forklar hvorfor de er nødvendige]

1. CHECK (length(mobilnummer) = 8) denne må jeg ha så folk skriver faktiske telefonnummer på 8 sifre men jeg vet ikke hvordan man tvinger folk til å skrive faktiske tall og ikke bokstaver.

2. CHECK (epost LIKE '%@%') denne har jeg fordi eposten må inneholde @.

3. CHECK (beløp >= 0) denne er nødvendig fordi det går ikke ann å ha ett negativt beløp enten så er det gratis ellers så koster det noe

4. CHECK (sluttid IS NULL OR sluttid > starttid) denne er sentral fordi den sjekker om syklen er utleid eller at slutttiden må være mer enn starttiden fordi det går ikke ann gå ned i tid i dette tilfellet.
 

 






**ER-diagram:**



erDiagram

Kunde{
    int kunde_id PK
    varchar fornavn
    varchar etternavn
    varchar epost
    varchar mobilnummer
    
}
    
Sykkel {
        int sykkel_id PK
        int lås_id FK
    }

Stasjon {
        int stasjon_id PK
        varchar navn
    }

 Lås {
        int lås_id PK
        int stasjon_id FK
    }

    Utleie {
        int utleie_id PK
        int kunde_id FK
        int sykkel_id FK
        timestamp starttid
        timestamp sluttid
        numeric beløp
    }

Kunde ||--o{ Utleie : har
Sykkel ||--o{ Utleie : leies_i
Stasjon ||--o{ Lås : har
Lås ||--o| Sykkel : inneholder




### Oppgave 1.3: Primærnøkler

**Valgte primærnøkler og begrunnelser:**


* primær nøkler

- kunde_id

- sykkel_id

- stasjon_id

- lås_id

- utleie_id


jeg valgte disse primærnøklene fordi de identifiserer en rad unikt i tabellen, og det kan ikke være flere av den samme





**Naturlige vs. surrogatnøkler:**



* Surrogatnøkler

- kunde_id

- sykkel_id

- stasjon_id

- lås_id

- utleie_id

dette er surrogatnøkler fordi de har ingen betydning utenfor systemet, er bare ID-er internt som ikke finnes i virkeligheten

hvis jeg hadde hatt naturlige nøkler hadde disse to vært kandidater

* naturlige nøkler
- epost
- mobilnummer

fordi de finnes i virkeligheten, og de identifiserer en person og de eksisterer uten databasen

jeg har brukt begge fordi du trenger både noe unikt som surrogatnøkler og noe naturlig som naturlige nøkler


**Oppdatert ER-diagram:**



erDiagram

Kunde{
    int kunde_id PK
    varchar fornavn
    varchar etternavn
    varchar epost
    varchar mobilnummer
    
}
    
Sykkel {
        int sykkel_id PK
        int lås_id FK
    }

Stasjon {
        int stasjon_id PK
        varchar navn
    }

 Lås {
        int lås_id PK
        int stasjon_id FK
    }

    Utleie {
        int utleie_id PK
        int kunde_id FK
        int sykkel_id FK
        timestamp starttid
        timestamp sluttid
        numeric beløp
    }

Kunde ||--o{ Utleie : har
Sykkel ||--o{ Utleie : leies_i
Stasjon ||--o{ Lås : har
Lås ||--o| Sykkel : inneholder




### Oppgave 1.4: Forhold og fremmednøkler

**Identifiserte forhold og kardinalitet:**



det er mye bruk av 1 til mange forholdet og 1-1 forholdet som vi ser i :

* kunde til utleie :  1 kunde kan ha mange utleier så vi ser dette forholdet. (1-mange)
* sykkel til utleie: 1 sykkel kan bli leid ut flere ganger, men en utleie gjelder bare en sykkel.(1-mange)
* stasjon til lås: 1 stasjon har mange forskjellige låser men en lås kan ikke ha flere stasjoner(1-mange)
* lås til sykkel: bare en sykkel kan stå i 1 lås samtidig og bare en lås kan stå på en sykkel noe som gjør den (1-1)


**Fremmednøkler:**

[Skriv ditt svar her - list opp alle fremmednøklene og forklar hvordan de implementerer forholdene]

* utleie.kunde_id som peker til kunde.kunde_id som implementerer 1-mange forholdet mellom kunde og utleie
* Utleie.sykkel_id so peker til sykkel.sykkel_id som implementerer 1-mange forholdet mellom utleie og sykkel
* Lås.stasjon_id som peker til stasjon.stasjon_id som implementerer 1-mange forholdet mellom stasjon og lås
* Sykkel.lås_id som peker til lås.lås_id som implementerer 1–til–1 forholdet mellom Lås og Sykkel.

**Oppdatert ER-diagram:**

erDiagram

Kunde{
    int kunde_id PK
    varchar fornavn
    varchar etternavn
    varchar epost
    varchar mobilnummer
    
}
    
Sykkel {
        int sykkel_id PK
        int lås_id FK
    }

Stasjon {
        int stasjon_id PK
        varchar navn
    }

 Lås {
        int lås_id PK
        int stasjon_id FK
    }

    Utleie {
        int utleie_id PK
        int kunde_id FK
        int sykkel_id FK
        timestamp starttid
        timestamp sluttid
        numeric beløp
    }

Kunde ||--o{ Utleie : har
Sykkel ||--o{ Utleie : leies_i
Stasjon ||--o{ Lås : har
Lås ||--o| Sykkel : inneholder




---

### Oppgave 1.5: Normalisering

**Vurdering av 1. normalform (1NF):**



* Den faller under 1nf fordi hver kolonne har bare 1 verdi spesifikt som er unik for tabellen så den tilfredstiller 1nf.

* Alle rader kan identifiseres med en primærnøkkel (kunde_id, utleie_id, osv.).

**Vurdering av 2. normalform (2NF):**
* den er allerede i 1nf 
* alt avhenger av selve hele primærnøkkelen


**Vurdering av 3. normalform (3NF):**

* ingen kolonner avhenger av en annen kolonne, hver tabell har en egen designert primærnøkkel

**Eventuelle justeringer:**

[Skriv ditt svar her - hvis modellen ikke var på 3NF, forklar hvilke justeringer du har gjort]

---

## Del 2: Database-implementering

### Oppgave 2.1: SQL-skript for database-initialisering

**Plassering av SQL-skript:**

[Bekreft at du har lagt SQL-skriptet i `init-scripts/01-init-database.sql`]
SQL-skriptet er plassert i mappen init-scripts med filnavnet 01-init-database.sql.
**Antall testdata:**

- Kunder: [antall]
- Sykler: [antall]
- Sykkelstasjoner: [antall]
- Låser: [antall]
- Utleier: [antall]

 tabell   | antall 
-----------+--------
 station   |      5
 bike_lock |    100
 bike      |    100
 customer  |      5
 rental    |     50
(5 rows)

---

### Oppgave 2.2: Kjøre initialiseringsskriptet

**Dokumentasjon av vellykket kjøring:**

[Skriv ditt svar her - f.eks. skjermbilder eller output fra terminalen som viser at databasen ble opprettet uten feil]

1500-postgres  |          status         
data1500-postgres  | ------------------------
data1500-postgres  |  Database initialisert!
data1500-postgres  | (1 row)
data1500-postgres  | 
data1500-postgres  | 
data1500-postgres  | 

**Spørring mot systemkatalogen:**

```sql
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
```

**Resultat:**

```
[Skriv resultatet av spørringen her - list opp alle tabellene som ble opprettet]

table_name 
------------
 bike
 bike_lock
 customer
 rental
 station
(5 rows)

```
 table_name 
------------
 bike
 bike_lock
 customer
 rental
 station
(5 rows)


## Del 3: Tilgangskontroll

### Oppgave 3.1: Roller og brukere

**SQL for å opprette rolle:**

```sql
[Skriv din SQL-kode for å opprette rollen 'kunde' her]

CREATE ROLE kunde;


```

**SQL for å opprette bruker:**

```sql
[Skriv din SQL-kode for å opprette brukeren 'kunde_1' her]

CREATE ROLE kunde_1 WITH LOGIN PASSWORD '1234';
```

**SQL for å tildele rettigheter:**

```sql
[Skriv din SQL-kode for å tildele rettigheter til rollen her]
-- gjør brukeren medlem av rollen
GRANT kunde TO kunde_1;

-- tilgang til databasen
GRANT CONNECT ON DATABASE oblig01 TO kunde;

-- tilgang til schema som er mappe inni databasen som har tabellene
GRANT USAGE ON SCHEMA public TO kunde;

-- gi bare tilgang til å lese tabellen
GRANT SELECT ON station TO kunde;
GRANT SELECT ON bike_lock TO kunde;
GRANT SELECT ON bike TO kunde;
GRANT SELECT ON customer TO kunde;
GRANT SELECT ON rental TO kunde;
```

---

### Oppgave 3.2: Begrenset visning for kunder

**SQL for VIEW:**

```sql
[Skriv din SQL-kode for VIEW her]
REVOKE ALL ON rental FROM customer;

CREATE VIEW my_rentals AS
SELECT *
FROM rental
WHERE customer_id = 1;

GRANT SELECT ON my_rentals TO customer;

```

**Ulempe med VIEW vs. POLICIES:**

[Skriv ditt svar her - diskuter minst én ulempe med å bruke VIEW for autorisasjon sammenlignet med POLICIES]

det som er negativt med view er at om en person får tak i selve rental tabellen så kan en se alt sammen viewen stopper dem ikke og den er ganske dårlig dynamisk den funker med færre brukere men med engang det blir mange brukere så blir logikken komplisert.
---

## Del 4: Analyse og Refleksjon

### Oppgave 4.1: Lagringskapasitet

**Gitte tall for utleierate:**

- Høysesong (mai-september): 20000 utleier/måned
- Mellomsesong (mars, april, oktober, november): 5000 utleier/måned
- Lavsesong (desember-februar): 500 utleier/måned

**Totalt antall utleier per år:**

[Skriv din utregning her]

20 000 x 5 = 100 000
5000 x 4 = 20 000
500 x 3 = 1500

det er totalt 121 500 utleier på ett år og så mange antall rader


**Estimat for lagringskapasitet:**

[Skriv din utregning her - vis hvordan du har beregnet lagringskapasiteten for hver tabell]



CREATE TABLE rental(
    rental_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    bike_id INTEGER,
    start_time TIMESTAMP,
    end_time TIMESTAMP CHECK (end_time IS NULL OR end_time > start_time),
    belop NUMERIC CHECK (belop >= 0),

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (bike_id) REFERENCES bike(bike_id)
);


INTEGERS = 4 bytes (3 stykker)
NUMERIC = 8 bytes (1 stykk)
TIMESTAMP = 8 bytes (2 stykker)


4 + 4 + 4 + 8 + 8 + 8 = 36 bytes

20-24 bytes med meta data

36 + 24 = 60 bytes


121 500 * 60 = 7 290 000 bytes 

1 mb = 1 048 576 bytes

7 290 000 / 1 048 576 = 6.95 mb








**Totalt for første år:**

[Skriv ditt estimat her]

ca 7 mb det første året
---

### Oppgave 4.2: Flat fil vs. relasjonsdatabase

**Analyse av CSV-filen (`data/utleier.csv`):**

**Problem 1: Redundans**

[Skriv ditt svar her - gi konkrete eksempler fra CSV-filen som viser redundans]

ett konkret eksempel på redundans i csv filen er at Ole,Hansen,+4791234567,ole.hansen@example.com blir lagret 3 ganger i csv filen 

det er nødvendig at vi har med alle tre utleiene men konto informasjonen hans er med for mange ganger noe som kan føre til inkonsistens.



**Problem 2: Inkonsistens**

[Skriv ditt svar her - forklar hvordan redundans kan føre til inkonsistens med eksempler]

Ole,Hansen,+4791234567,ole.hansen@example.com ved at kontaktinformasjon som dette eller Majorstuen Stasjon,Bogstadveien 50 Oslo, dette så kan det oppstå inkonsistens fordi det samme er gjentatt så mange ganger

**Problem 3: Oppdateringsanomalier**

[Skriv ditt svar her - diskuter slette-, innsettings- og oppdateringsanomalier]

Oppdateringsanomali:
Kundeinformasjon og stasjonsinformasjon lagres flere ganger hvis en kunde endrer e-post eller en stasjon endrer adresse, må alle rader oppdateres.

innsetninganomali:
Det er ikke mulig å registrere en ny kunde uten at kunden også har en utleie, det kreves at alle felter må bli fylt ut.

sletteanomali:
Hvis en kunde kun har én utleie og denne raden slettes så vil all informasjon om kunden også forsvinne.

**Fordeler med en indeks:**

[Skriv ditt svar her - forklar hvorfor en indeks ville gjort spørringen mer effektiv]

hvis vi bruker full table scan vil den gå gjennom masse rader før den finner det vi leter etter, som tidligere oppgaven fant vi ut at det var 121 500 rader så det tar lengre tid enn bruk av indeks hvis vi kan hoppe direkte til spesifikk rad som tar mye kortere tid

**Case 1: Indeks passer i RAM**

[Skriv ditt svar her - forklar hvordan indeksen fungerer når den passer i minnet]

det funker best fordi dette er drømmesituasjonen når indeks finnes i ram så går det lynraskt å funne fram til den dataen i tabellen du er ute etter. dette er den raskeste og beste muligheten av disse alternativene, men når indeks er i disk er dette fortsatt raskere og bedre enn en tabellscan på disk, men det er fortsatt 100 ganger treigere i disk en ram.

**Case 2: Indeks passer ikke i RAM**

[Skriv ditt svar her - forklar hvordan flettesortering kan brukes]

når indeksen er større enn tilgjengelig for RAM så må DBMS lese deler av dataen fra disk. disk alene i seg selv tar ganske lang tid så derfor tar den ibruk RAM samtidig så den kan dele opp og sortere data som er det mest effektive valg når datasettet eller indekseringen er større en ram.

**Datastrukturer i DBMS:**

[Skriv ditt svar her - diskuter B+-tre og hash-indekser]

b+- tre er effektivt fordi sorteringen på dataen bevares så det bruk av  = > < og alt er sortert så det er ganske effektivt å finne frem til data.


hash indekser er også effektivt den finner verdien gjennom en hash-funksjon, hash funksjonen ødelegger sorteringsrekkefølgen så man kan kun bruke  = på spesifikke intervaller


så b+- tre brukes oftes fordi den støtter intervallsøk og er bedre enn hash-funksjoner som ødelegger sorteringen.


---

### Oppgave 4.3: Datastrukturer for logging

**Foreslått datastruktur:**

[Skriv ditt svar her - f.eks. heap-fil, LSM-tree, eller annen egnet datastruktur]

Heap-fil og LSM-tree


**Begrunnelse:**

**Skrive-operasjoner:**

[Skriv ditt svar her - forklar hvorfor datastrukturen er egnet for mange skrive-operasjoner]

heap fil skriver loggingen sekvensielt noe som er effektivt og ganske bra ikke sortert men i direkte rekkefølge, og dewt skrives en og en om gangen, mens LSM-tree gjør mye av det saqmme bare at bruk av RAM sendes dataen inn dit og når den blir full sendes den og slås sammen i blokker. så begge disse data strukturene er append only workloads.

disse datastrukturene passer skrive operasjoner godt

**Lese-operasjoner:**

[Skriv ditt svar her - forklar hvordan datastrukturen håndterer sjeldne lese-operasjoner]

de håndeterer ikke lese operasjoner like godt som b+- tree, men den er tregere men fortsatt ganske bra fordi den tar i bruk sekvensielle søk noe som er tregere enn indeksering, men også kan være effektivt

---

### Oppgave 4.4: Validering i flerlags-systemer

**Hvor bør validering gjøres:**

[Skriv ditt svar her - argumenter for validering i ett eller flere lag]

validering i flere lag er veldig viktig for å sikre brukeropplevelsen til brukeren samtidig at det er sikkerhet for brukeren, gjennom constraints som f.eks CHECK og UNIQUE så kan det sikre dataintegriteten og fungere som det siste sikkerhetsnivået

**Validering i nettleseren:**

[Skriv ditt svar her - diskuter fordeler og ulemper]

* fordeler
- rask tilbakemelding på f.eks "epost er ugyldig" med engang
- bedre bruker opplevelse siden frontend er det brukeren ser


* ulemper
- ikke sikkert nok
- en angriper kan sende direkte hva han vil til serveren

så man kan ikke bare stole på frontend validering alene


**Validering i applikasjonslaget:**

[Skriv ditt svar her - diskuter fordeler og ulemper]


* fordeler
- kan stoles på siden serveren kontrollerer systemet
- stopper hacking og manipulerte forespørsler
- hovedsikkerheten i systemet

* ulemper
- tar litt lengre tid enn frontend
- mer belastning på serveren

**Validering i databasen:**

[Skriv ditt svar her - diskuter fordeler og ulemper]

* fordeler
- garanterer sikkerhet og dataintegritet
- stopper feil som applikasjonen ikke får med seg
- siste sikkerhets vegg/barriere


* ulemper
- gir dårlig bruker opplevelse fordi feil oppdages sent fordi det er siste sikkergetsbarriere
- det er treigere
-

**Konklusjon:**

[Skriv ditt svar her - oppsummer hvor validering bør gjøres og hvorfor]

validering burde gjøres i flere lag fordi nettleseren gir rask tilbakemelding til brukeren, og er ikke sikker alene. Applikasjonslaget er det viktigste stedet for validering fordi serveren kan kontrollere at dataene er riktige og stoppe falske forespørsler.

---

### Oppgave 4.5: Refleksjon over læringsutbytte

**Hva har du lært så langt i emnet:**

[Skriv din refleksjon her - diskuter sentrale konsepter du har lært]


* Så langt i emnet har jeg fått en mye bedre forståelse av hva et databasesystem faktisk er og hva det består av. Før tenkte jeg mest på databaser som bare et sted man lagrer data, men nå forstår jeg at det handler om struktur, regler og hvordan data behandles på en trygg og effektiv måte. 


* jeg har også lært om ER-modellering, normalisering, primær- og fremmednøkler og hvorfor disse er viktige for å unngå feil og duplikater i data. 

* I tillegg har jeg lært hvordan indekser gjør spørringer raskere, og at hvordan data lagres fysisk faktisk påvirker ytelsen. 


Generelt føler jeg at jeg nå forstår bedre hvordan systemer som nettbanker, apper og nettsider klarer å håndtere store mengder informasjon uten at data blir kaotisk.

**Hvordan har denne oppgaven bidratt til å oppnå læringsmålene:**

[Skriv din refleksjon her - koble oppgaven til læringsmålene i emnet]

Denne oppgaven gjorde teorien mye mer konkret. Ved å lage en database for et bysykkelsystem måtte jeg selv identifisere entiteter, lage tabeller og koble dem sammen med fremmednøkler. 


Jeg merket at ER-modellering og normalformer ikke bare er teori, men faktisk nødvendig for å få databasen til å fungere riktig. 



Da jeg brukte databasen i PostgreSQL og brukte constraints, forstod jeg hvorfor databasen må beskytte dataintegritet. 


Arbeidet med indekser og spørringer gjorde også at jeg så hvordan strukturen påvirker ytelsen. Oppgaven gjorde derfor at læringsmålene ikke bare ble noe jeg leste om, men noe jeg faktisk brukte i praksis.

Se oversikt over læringsmålene i en PDF-fil i Canvas https://oslomet.instructure.com/courses/33293/files/folder/Plan%20v%C3%A5ren%202026?preview=4370886

**Hva var mest utfordrende:**

[Skriv din refleksjon her - diskuter hvilke deler av oppgaven som var mest krevende]

Det som var mest krevende ville jeg sagt var å programmere og jobbe med SQL det var ganske å lære og huske det fra forelesningene, mange av grunnene til hvorfor dette var mest krevende var også problemer som oppstod med dockeren min men ellers var dette ganske gode og lærerike oppgaver som hjalp meg med å forstå faget enda dypere

**Hva har du lært om databasedesign:**

[Skriv din refleksjon her - reflekter over prosessen med å designe en database fra bunnen av]

Jeg har lært at god databasedesign må planlegges før man begynner å kode. En ryddig modell med riktige nøkler og normalisering gjør både spørringer enklere og hindrer feil i dataene.

---

## Del 5: SQL-spørringer og Automatisk Testing

**Plassering av SQL-spørringer:**

[Bekreft at du har lagt SQL-spørringene i `test-scripts/queries.sql`]
jeg har gjort det


**Eventuelle feil og rettelser:**

[Skriv ditt svar her - hvis noen tester feilet, forklar hva som var feil og hvordan du rettet det]

---

## Del 6: Bonusoppgaver (Valgfri)

### Oppgave 6.1: Trigger for lagerbeholdning

**SQL for trigger:**

```sql
[Skriv din SQL-kode for trigger her, hvis du har løst denne oppgaven]
```

**Forklaring:**

[Skriv ditt svar her - forklar hvordan triggeren fungerer]

**Testing:**

[Skriv ditt svar her - vis hvordan du har testet at triggeren fungerer som forventet]

---

### Oppgave 6.2: Presentasjon

**Lenke til presentasjon:**

[Legg inn lenke til video eller presentasjonsfiler her, hvis du har løst denne oppgaven]

**Hovedpunkter i presentasjonen:**

[Skriv ditt svar her - oppsummer de viktigste punktene du dekket i presentasjonen]

---

**Slutt på besvarelse**
