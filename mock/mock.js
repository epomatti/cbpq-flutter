const express = require('express')
const app = express()

atleta = {
  status: 'REGULAR',
  cbpq: '90155',
  categoria: 'A',
  atleta: 'Evandro Pomatti',
  clube: 'Droz Zone 47 Clube Escola Paraquedismo',
  federacao: 'Federação Catarinense de Paraqueismo',
  habilitacao: 'Atleta',
  filiacao: '10/05/2018',
  validade: '27/06/2020',
  emissao: '13/05/2018',
  imagem: 'https://www.cbpq.org.br/site/download/i/foto/90155.jpg'
}

app.get('/api/licenca', function (req, res) {
  const { cbpq, cpf } = req.query
  if (cbpq) {
    if (cbpq === '90155') {
      res.send(atleta)
    } else {
      res.status(404).send(`Atleta ${cbpq} não encontrado.`)
    }
  } else if (cpf) {
    res.send(atleta)
  } else {
    res.status(400).send('CBPQ ou CPF devem ser informados.')
  }
});

app.listen(3000)