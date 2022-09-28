EDITOR="code --wait" bin/rails credentials:edit
EDITOR="code --wait" bin/rails credentials:edit --environment production
EDITOR="code --wait" bin/rails credentials:edit --environment development

EDITOR="code --wait" bin/rails credentials:edit


email_provider:
  user: "petfinder.mailer@gmail.com"
  password: "srikeszmoeaylqju"
  host: 'http://localhost:3000'
  domain: 'exmpale.com'
  port: 587
  address: 'smtp.gmail.com'
