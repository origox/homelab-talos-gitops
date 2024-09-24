# Util Tools
Short info about different tools that can be used to improve setup, maintenance or anything else.

## - Run locally Github Actions workflows - act

```bash
# Install act tool
brew install act

# Secure that docker is installed

# Run a specific event (trigger on push)
act push

```

For more information see [how to use act to locally run github workflows](https://chatgpt.com/share/66ee85fb-dcb4-8008-aca2-d3384d109f40)


## - Use mdBook to display some good info - mdbook

```bash
# Install mdbook tool
brew install mdbook

# To create a new mdBook project
mdbook init docs

# Build book locally
mdbook build

# Create book
mdbook serve
```

For more information see [mdBook is a command line tool to create books with Markdown](https://chatgpt.com/share/66ee8867-b870-8008-b32b-637fda28f49a)

## - De/encrypt sops files
vscode plugin is not reliable working in wsl. 

[Encrypting Secrets The GitOps Way With sops And age - Mircea Anton](https://youtu.be/wqD7k5iNvqs)