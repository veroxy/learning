# les logs

retourne le journal de connexion (modifications, ajouts, errors)
il est conseillé quelque soit le langage d'utiliser une API de log
> api de log pour Java: Log4J
les retours se font par décrémentation , du plus FORT au MONT IMPORTANT
- error: qui fait planter ou non l'app
- warning: indique une anomalie
- info: informatifs
- config:
- FINE / debug: retour technique
- FINEST / debug: retour technique verbeux
> fr.houseofcode.dap est un dossier
**fr.houseofcode.dap.[client]**  est une categorie et
**fr.houseofcode.dap.[admin]** en est une autre
 1. category
 2. appender
> retouner les logs dans un contexte pas unique une phrase "banale" , un complement précis permet de voir là où l'app fails.
