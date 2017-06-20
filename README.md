# CorrectTranslationsIds
Bash script to correct all translations ids in a Symfony project

## Usage
```
bash ./correctTranslationsIds YOUR-BUNDLE-PATH/
```

## Requirement

1 - Use the XLIFF format for translations.
2 - Respect the structure below.

```
---/MyBundle/
------/Resources
---------/translations
------------messages.fr.xlf
------------form.en.xlf
------------*.*.xlf

```
