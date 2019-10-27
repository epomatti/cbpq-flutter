const express = require('express')
const app = express()
const port = 3000

json = {
  "status": "Regular",
  "cbpq": "90155",
  "categoria": "A",
  "atleta": "Evandro Pomatti",
  "clube": "Drop Zone 47 Clube Escola Paraquedismo",
  "federacao": "Federação Catarinense de Paraquedismo",
  "filiacao": "2018-05-10",
  "validade": "2020-06-27",
  "imagem": "90155.jpg",
  "emissao": "2018-05-13"
}

app.get('/site/api/request', function (req, res) {
  const { cbpq, cpf } = req.query
  if (cbpq) {
    if (cbpq === '90155') {
      res.send(atleta)
    } else {
      res.status(404).send("Nenhum Atleta registrado com este numero de cbpq")
    }
  } else if (cpf) {
    res.send(atleta)
  } else {
    res.status(400).send('CBPQ ou CPF devem ser informados.')
  }
});

app.listen(3000, () => console.log(`Mock listening on port ${port}!`))