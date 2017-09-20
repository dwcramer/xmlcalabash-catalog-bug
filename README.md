# Resolving entities via rewriteURI/rewriteSystem

My ultimate goal is to user xinclude 1.1, which is supported by Calabash. 

This project demonstrates a possible bug (or user-error on my part) with xmlcalabash 
when using a catalog file to resolve the path to an entities file via rewriteURI/rewriteSystem
rules in the catalog.

Note: The `build.sh` file assumes you have xmlcalabash-1.1.16-97 installed in the default 
location on a mac `/Applications/xmlcalabash-1.1.16-97/xmlcalabash-1.1.16-97.jar` and that 
you are sourcing `build.sh` from the directory in which it resides. 

* BOTH files are valid with all content resolved if I open them in Oxygen and configure 
  `shared/catalog/catalog.xml` as one of my catalogs. 

* `book-works.xml` demonstrates that catalogs are working in some cases:
    * Calabash resolves &uri-test; by mapping urn:entityset to 
      `../entities/entities.ent` (relative to `catalog.xml`).
    * Calabash resolves the href to `file://docshared/content/content.xml` using 
      the rewriteURI/rewriteSystem rules in the catalog that maps `file://docshared` 
      to '../' (relative to the catalog).
      
* `book-fails.xml` works fine in Oxygen, but fails with the error:

   ```
   ERROR: It is a dynamic error if the resource referenced by a p:document element does not exist, cannot be accessed, or is not a well-formed XML document.
   ERROR: Underlying exception: I/O error reported by XML parser processing file:/Users/dcramer/Downloads/Top-xyz/catalog-bug/doc/book-fails.xml: docshared
   ```
   
   It appears that Calabash is unable to resolve the following: 
   
   ```
   <!ENTITY % myents SYSTEM "file://docshared/entities/rewrite-this.ent" >
   %myents;
   ```
   
# Bonus bug in Oxygen 19.0

To reproduce:

1. Open Oxygen 19.0
2. In Preferences, configure Oxygen to use `shared/catalog/catalog.xml` as one of its catalogs.
3. Open `doc/oxygen-gets-confused.xml` in Oxygen
4. Click Validate
5. Note that Oxygen reports that "The entity "bar" was referenced, but not declared" 
   but fails to notice that foo was also referenced but not declared in: `<chapter role="&foo;">`