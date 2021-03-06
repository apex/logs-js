

JavaScript client for [Apex Logs](https://apex.sh/logs/) with support for Node.js, Deno, and the browser.

## Installation

```
npm install --save apex-logs
```

## Node

Here's an example of usage in Node or the browser using the `apex-logs` NPM package:

```js
const { Client } = require('apex-logs')

const client = new Client({
  url: '<ENDPOINT>',
  authToken: '<TOKEN>'
})

async function run() {
  const { projects } = await client.getProjects()
  console.log(projects)
  
  const { alerts } = await client.getAlerts({ projectId: 'production' })
  console.log(alerts)
}

run()
```

## Deno

Here's an example of usage in Deno:

```js
import { Client } from 'https://deno.land/x/apex_logs/client.ts'

const client = new Client({
  url: '<ENDPOINT>',
  authToken: '<TOKEN>'
})

const { projects } = await client.getProjects()
console.log(projects)

const { alerts } = await client.getAlerts({ projectId: 'ping_production' })
console.log(alerts)
```


## Resources

To learn more about Apex Logs visit the [documentation](https://apex.sh/docs/logs/), and to contribute to this client visit the [github.com/apex/rpc](https://github.com/apex/rpc/) project which is used to generate this client.
