# lassi
Repo del Progetto di LASSI. A cura di Andreani Andrea e De Carlo Gianluca

### Suddivisione del lavoro
Andreani:

- Autenticazione
- Gestione utenti

De Carlo:

- Gestione appunti
- Gestione commenti
- Gestione API

Il resto del lavoro è stato svolto in stretta collaborazione, anche per affrontare le difficoltà in due

### Controllo degli accessi

Il controllo degli accessi è basato su un sistema RBA, che prevede tre ruoli differenti:

- Visitatore: accesso limitato, con la possibilità di visionare gli appunti caricati
- Utente registrato: accesso completo alle funzionalità del sito
- Amministratore: accesso completo alle funzionalità del sito e possibilità di cancellare utenti, appunti e commenti.

### Test

I test sono stati implementati verticalmente svolgendo i test di implementazione con RSpec e di integrazione con Cucumber.

Le user stories rappresentative che sono state scelte per essere testate sono:

- La possibilità per l'amministratore di eliminare un utente
- La possibilità per un utente di filtrare gli appunti per categoria

Sono stati aggiunti anche piccoli test riguardanti l'implementazione dell'aggiunta di appunti e commenti, con RSpec. Con Cucumber sono stati implementati ulteriori test di integrazione relativi alla modifica di attributi dell'utente (saltati quelli di implementazione poiché gestiti dalla gemma 'Devise'). 