const express = require('express')
const app = express()
const port = 3000

json = {
  "data":
  {
    "status": "1",
    "cbpq": "90155",
    "categoria": "2",
    "atleta": "Evandro Pomatti",
    "clube": "Drop Zone 47 Clube Escola Paraquedismo",
    "federacao": "Federação Catarinense de Paraquedismo",
    "filiacao": "2018-05-10",
    "validade": "2020-06-27",
    "imagem": "90155.jpg", // empty is ""
    "emissao": "2018-05-13" // empty is "0000-00-00"
  },
  "message": {
    "text": "Atleta encontrado"
  }
}

json_not_found = {
  "message": {
    "text": "Atleta não encontrado"
  }
}

app.get('/site/api/licenca', function (req, res) {
  const { cbpq, cpf } = req.query
  if (cbpq) {
    if (cbpq === '90155') {
      res.send(atleta)
    } else {
      res.status(404).send(json_not_found)
    }
  } else if (cpf) {
    res.send(atleta)
  } else {
    res.status(400).send('CBPQ ou CPF devem ser informados.')
  }
});

app.listen(3000, () => console.log(`Mock listening on port ${port}!`))