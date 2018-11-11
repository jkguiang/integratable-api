const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = process.env.PORT || 5000;
const exec = require('child_process').exec;
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/api/hello', (req, res) => {
  res.send({ express: 'Hello From Express' });
});
app.post('/api/world', (req, res) => {
  console.log(req.body);
  exec('maxima -r "float(integrate(x^2,x,1,2));"', function callback(error, stdout, stderr){
    res.send(
      `I received your POST request. This is what you sent me: ${stdout}`,
    );
  });
});

app.listen(port, () => console.log(`Listening on port ${port}`));
