---
layout: default
title: reactive native révision
parent: mobile
---
# revision React Native

STATE :  variable de class dans le constructeur (`this.state:{}`)
> il partout, et est modifiable tout au long de la Class par la ft `setState({stdClass})`
```javascript
constructor(props) {
        super(props);
        this.state = {
            navigationOptions: 'Home',

            position: "Rogers Arena, Vancouver",
            errorMessage: null,
            mapItems: {
                text: "legend img",
                img: "https://facebook.github.io/react-native/img/favicon.png",
            },
        }
    }
```

> pour modifier dans le setter
```
onPress={()=>{
    title = {this.state.position}
    const newState =
        position:"Lyon"
    }
    return this.setState(newState)
}
```

> on peut appeler un composant
```
class MonComposant extends React.Component {
    render(){

        return(){
            <Text>{this.props.content}</Text> // permet d'acceder à la prorpriété "content"
        }
    }
}
```

```
<MonComposant content="this.state.position" /> // la
```
 on peut envoyer des FT dans des composants externe à la class export