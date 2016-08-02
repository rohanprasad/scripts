echo "Entry: main.js"

npm init

npm install react \
    react-dom \
    babel-cli \
    webpack \
    webpack-dev-server
    --save

npm install babel-loader \
     babel-core \
     babel-preset-es2015 \
     babel-preset-react 

touch index.html \
    App.js \
    main.js \
    webpack.config.js \
    .babelrc

echo "module.exports = { 
    entry: './main.js',
    output: {
        path: __dirname,
        filename: 'index.js'
    },
    devserver: {
        inline: true,
        port: 8080
    },
    module:{
        loaders:[
            {
                test: /\.js$/,
                exclude: /node_modules/,
                loader: 'babel'
            }
        ]
    }
};" > webpack.config.js

echo "{
    'presets': ['es2015', 'react']
}" > .babelrc

echo "<!DOCTYPE html>
<html>
<head>
    <title></title>
    </head>
    <body>
        <div id="app"></div>
        <script type="text/javascript" src="index.js"></script>
    </body>
</html>" > index.html

echo "import React from 'react';
class App extends React.Component {
    render(){
        return <div>Hello</div>
    }
}

export default App" > App.js

echo "import React from 'react';
import ReactDOM from 'react-dom'; 
import App from './App';
ReactDOM.render(<App />, document.getElementById('app'));" > main.js

echo "\n\nAdd 'start': 'webpack-dev-server' to scripts in package.json"
echo "run 'npm start' to start the dev server" 

