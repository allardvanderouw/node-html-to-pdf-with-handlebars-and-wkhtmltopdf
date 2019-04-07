const fs = require('fs')
const express = require('express')
const Handlebars = require('handlebars')
const wkhtmltopdf = require('wkhtmltopdf')

const template = fs.readFileSync(`${__dirname}/template.hbs`, 'utf8')
const compiledTemplate = Handlebars.compile(template)

const app = express()
const port = process.env.PORT
const pdfCommand = process.env.PDF_COMMAND || 'wkhtmltopdf'

wkhtmltopdf.command = pdfCommand

app.get('/', (req, res) => {
  const { name = 'Alice' } = req.query
  const templateData = { name }
  const html = compiledTemplate(templateData)
  wkhtmltopdf(html).pipe(res)
})

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
