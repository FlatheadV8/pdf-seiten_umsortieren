#!/bin/bash

#------------------------------------------------------------------------------#
#
# Mit diesem Skript kann man beliebige Seiten aus einer vorhandenen PDF-Datei
# in einer beliebigen Reihenfolge zu einer neuen PDF-Datei verpacken.
#
#------------------------------------------------------------------------------#

Z="$(head -c 100 /dev/urandom | base64 | tr -cd '[:alnum:]' | cut -b-12)"

if [ -r "${1}" ] ; then
        DATEINAME="$(echo "${1}" | sed 's/[.][Pp][Dd][Ff]$//;s/[ ][ ]*/_/g')"
        shift
        echo "pdf2ps ${DATEINAME}.pdf ${DATEINAME}_${Z}_%04d.ps"
        pdf2ps ${DATEINAME}.pdf ${DATEINAME}_${Z}_%04d.ps

        NEU_SORTIERT="$(for i in ${@}
        do
                INTEGER="$(echo "${i}" | awk '{printf("%.4u\n", $1)}')"

                echo "${DATEINAME}_${Z}_${INTEGER}.ps"

                #ps2eps -f -s a4 "${DATEINAME}_${Z}_${INTEGER}.ps" >/dev/null
                #rm -f "${DATEINAME}_${Z}_${INTEGER}.ps" >/dev/null
                #echo "${DATEINAME}_${Z}_${INTEGER}.eps"
        done)"

        echo
        echo "gs -dSAFER -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=\"${DATEINAME}_${Z}.pdf\" -f" ${NEU_SORTIERT}
        echo
        gs -dSAFER -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="${DATEINAME}_${Z}.pdf" -f ${NEU_SORTIERT}
        rm -f ${NEU_SORTIERT}
else
        echo "${0} Datei.pdf [Seiten in gewünschter Reihenfolge]"
        echo "${0} Datei.pdf 2 3 4 5 6 7 8 9 1"
fi
