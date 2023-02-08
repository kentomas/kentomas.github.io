# Markdown

## Markdown Extended Syntax

<https://www.markdownguide.org/extended-syntax/>

## Mermaid

This is used to create basic UML Diagrams.
<https://mermaid-js.github.io/mermaid/#/>

## Material for MkDocs

Source: <https://squidfunk.github.io/mkdocs-material/>

### 1. Install mkdocs-material

```PowerShell
pip install mkdocs-material
```

### 2. Create site

```PowerShell
mkdocs new .
```

This will create the following structure:

```mermaid
.
├─ docs/
│  └─ index.md
└─ mkdocs.yml
```

Put files and folders beneath `docs/` folder.

### 3. Update YAML Schema

```json title="<project_name>.code-workspace"
{
  "folders": [
    {
      "path": "."
    }
  ],
  "settings": {
    "yaml.schemas": {
      "https://squidfunk.github.io/mkdocs-material/schema.json": "mkdocs.yml"
    },
    "yaml.customTags": [
      "!ENV scalar",
      "!ENV sequence",
      "tag:yaml.org,2002:python/name:materialx.emoji.to_svg",
      "tag:yaml.org,2002:python/name:materialx.emoji.twemoji",
      "tag:yaml.org,2002:python/name:pymdownx.superfences.fence_code_format"
    ]
  }
}
```

### 4. Launch

```PowerShell
mkdocs serve 
```