# pdf-seiten_umsortieren
Mit diesem Skript kann man beliebige Seiten aus einer vorhandenen PDF-Datei in einer beliebigen Reihenfolge zu einer neuen PDF-Datei verpacken.

Wenn man eine PDF-Datei hat, in der 3 Seiten sind und beispielsweise die 3. Seite in der Mitte ist aber ans Ende gehört und die 2. Seite am Ende ist aber in die Mitte gehört, dann kann man das so wie in diesem Beispiel reparieren:

~/bin/pdf-seiten_umsortieren.sh unsortiert.pdf 1 3 2

Wenn man eine PDF-Datei hat, in der 9 Seiten sind man aber beispielsweise nur die ersten 3 Seiten haben möchte, dann geht das so:

~/bin/pdf-seiten_umsortieren.sh unsortiert.pdf 1 2 3
