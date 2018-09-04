# React native
>  [facebook support]('https://facebook.github.io/react-native/docs/props')

## Installation globale
prérequis : node - npm
```
npm install -g start
npm install -g create-react-native-app
create-react-native-app monProjet
```

### TextInput
- il faut ajouter dabord un param "style" pour que le composant soit visible
- on donne une valaeur par default "placeholder" > "valeur initiale"
- on lui donne un "event" ici un onChange(state) -> ici on a une écoute sur la saisie mais on peu avoir un event sur btn "onPress"
- il faut penser à stock dans une variable afin de ne pas perdre les données de la même qu'en AJAX qui retourne la valeur de la saisie "POST" stock dans une "var" ASYNCHRON
```
 <TextInput
          style={{height: 40, height : 20, width: 200}}

          placeholder="Type here to transl ate!"

          onChangeText={(text) => this.setState({text})}
        />
```

### ScrollView
> une scroll view est une balise ibnline elle n'a pas de taille définie ; elle prend la taille de ses enfants :
- height
- width
```
 <ScrollView>
          <Text style={{fontSize:96}}>Scroll me plz</Text>
          <Image source={{uri: "https://facebook.github.io/react-native/img/favicon.png", width: 64, height: 64}} />
          <Image source={{uri: "https://facebook.github.io/react-native/img/favicon.png", width: 64, height: 64}} />
          <Text style={{fontSize:96}}>If you like</Text>

   </ScrollView>

```

### FlatList
> Ul li ; liste d'informations dont les clefs sqont similaires
- data : un tableau / object [clef :  valeur]
-  renderItem : qui applique un foreach avec la var à retourner dans la vue  ou comme une .map en prenant la var.nomdelaclef

```
<FlatList
  data={[{key: 'a'}, {key: 'b'}]}
  renderItem={({item}) => <Text>{item.key}</Text>}

   data=[1,2,3,4]
   renderItem={({item}) => <Text>{item}</Text>}
/>
```

### SectionList
> est un tableau d'objet qui est mappé ou un foreach(tableau, cle, retour)
- un tableau d'object qui seront les ("sections")
- ce tableau est traité par la fonction de map "renderItem"
- et un nommage auto unique pour identifier le composant "renderItem"
```
<SectionList
  renderItem={({item, index, section}) => <Text key={index}>{item}</Text>}

  renderSectionHeader={({section: {title}}) => (
    <Text style={{fontWeight: 'bold'}}>{title}</Text>
  )}

  sections={[
    {title: 'Title1', data: ['item1', 'item2']},
    {title: 'Title2', data: ['item3', 'item4']},
    {title: 'Title3', data: ['item5', 'item6']},
  ]}
  keyExtractor={(item, index) => item + index}
/>
```

### WebView
> affiche le contenu d'une page web
- à bannir / mauvaise pratique du dev web app
```
<WebView
        source={{uri: 'https://github.com/facebook/react-native'}}
        style={{marginTop: 20}}
      />
```

### Modal
> affiche une tooltips qui peut être personnalisé contrairement  "Alert"
- êut contenir un style et contenu personnalisé
- animation
- visibilite est le déclencheur (true/false) => state
- un event => state
```
        <Modal
          animationType="slide"
          transparent={false}
          visible={this.state.modalVisible}
          onRequestClose={() => {
            alert('Modal has been closed.');
          }}>

          <View style={{marginTop: 22}}>
            <View>
              <Text>Hello World!</Text>

              <TouchableHighlight
                onPress={() => {
                  this.setModalVisible(!this.state.modalVisible);
                }}>
                <Text>Hide Modal</Text>
              </TouchableHighlight>
            </View>
          </View>
        </Modal>
```

### Alert
> propriétés restraintes: pas de style , pas de contenu
c'est un methode static on accède donc pas à this.
- gestion error / warning

- "'Alert Title'," => header
- 'My Alert Msg' => content
- 'Ask me later' | text: 'Cancel' | text: 'OK' => tableau /list obj qui retourne diff action

```
   Alert.alert(
     'Alert Title',
     'My Alert Msg',
     [
       {text: 'Ask me later', onPress: () => console.log('Ask me later pressed')},
       {text: 'Cancel', onPress: () => console.log('Cancel Pressed'), style: 'cancel'},
       {text: 'OK', onPress: () => console.log('OK Pressed')},
     ],
     { cancelable: false }
   )
```


### TouchableOpacity
>
-
-
```
```


### Dimension
> est une class qui possède des methode static qui ecoute unn evenement
- get()
- set()
```
const dim = Dimensions.get('window');

  <View>

<Text>{dim.height}</Text>
<Text>{dim.width}</Text>
  </View>

ou
var {height, width} = Dimensions.get('window');

```


### SectionList
>
-
-
```
```

