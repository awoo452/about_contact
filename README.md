# About Contact

Rails app for standard About, Contact, and FAQ pages with a working email form.

## Pages
- `/` (root) renders About
- `/about`
- `/contact`
- `/faq`

## Content
All copy lives in `config/site_content.json`. Update the JSON and the pages will reflect it.

## Setup
```bash
bin/setup
```

## Run
```bash
bin/rails s
```

## Contact Form Email Setup
The contact form sends email via Action Mailer. It will show an error if delivery
is not configured. At minimum, set `CONTACT_TO_EMAIL`.

Required
- `CONTACT_TO_EMAIL` (destination inbox)

Optional
- `CONTACT_FROM_EMAIL` (default `no-reply@example.com`)
- `CONTACT_SUBJECT_PREFIX` (default `[Contact]`)

SMTP (if you want real delivery)
- `SMTP_ADDRESS`
- `SMTP_PORT` (default `587`)
- `SMTP_DOMAIN`
- `SMTP_USERNAME`
- `SMTP_PASSWORD`
- `SMTP_AUTHENTICATION` (default `plain`)
- `SMTP_ENABLE_STARTTLS_AUTO` (default `true`)

Example environment setup
```bash
export CONTACT_TO_EMAIL="hello@example.com"
export CONTACT_FROM_EMAIL="no-reply@example.com"
export CONTACT_SUBJECT_PREFIX="[AboutContact]"
export SMTP_ADDRESS="smtp.example.com"
export SMTP_PORT="587"
export SMTP_DOMAIN="example.com"
export SMTP_USERNAME="smtp-user"
export SMTP_PASSWORD="smtp-pass"
export SMTP_AUTHENTICATION="plain"
export SMTP_ENABLE_STARTTLS_AUTO="true"
```

## Tests
```bash
bin/rails test
bin/rails test:system
```

System tests run with `rack_test` for CI compatibility.
