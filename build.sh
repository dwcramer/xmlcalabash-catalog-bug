echo "book-works.xml works:"

java -Xmx1024m -cp "/Applications/xmlcalabash-1.1.16-97/xmlcalabash-1.1.16-97.jar:./shared/catalog" com.xmlcalabash.drivers.Main -i source=doc/book-works.xml xpl/pipeline.xpl

echo " "
echo "==========================================="
echo "book-fails.xml fails:"

java -Xmx1024m -cp "/Applications/xmlcalabash-1.1.16-97/xmlcalabash-1.1.16-97.jar:./shared/catalog" com.xmlcalabash.drivers.Main -i source=doc/book-fails.xml xpl/pipeline.xpl

echo " "
echo "==========================================="
echo "Workaround book-fails.xml succeeds using Apache resolver:"

java -Xmx1024m  -cp "/Applications/xmlcalabash-1.1.16-97/xmlcalabash-1.1.16-97.jar:/Applications/Oxygen XML Editor/lib/resolver.jar:./shared/catalog" \
                com.xmlcalabash.drivers.Main \
                -i source=doc/book-fails.xml \
                -U org.apache.xml.resolver.tools.CatalogResolver \
                -E org.apache.xml.resolver.tools.CatalogResolver \
                xpl/pipeline.xpl