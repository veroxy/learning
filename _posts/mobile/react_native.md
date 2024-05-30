---
layout: default
title: react native
parent: mobile
---
# React native
>  [facebook support]('https://facebook.github.io/react-native/docs/props')

## Installation globale
prérequis : node - npm
```shell
npm install -g start
npm install -g create-react-native-app
create-react-native-app monProjet
```


## Running APP
on peut avoir l'aperçu en faisant tourner l'app.js en lançant la cmd npm `start` que l'on a installé préallablement qui installe en même temps le dossier

```shell
npm start

 › Press a to open Android device or emulator.
 › Press s to send the app URL to your phone number or email address
 › Press q to display QR code.
 › Press r to restart packager, or R to restart packager and clear cache.
 › Press d to toggle development mode. (current mode: development)
```

### TextInput
- il faut ajouter dabord un param "style" pour que le composant soit visible
- on donne une valaeur par default "placeholder" > "valeur initiale"
- on lui donne un "event" ici un onChange(state) -> ici on a une écoute sur la saisie mais on peu avoir un event sur btn "onPress"
- il faut penser à stock dans une variable afin de ne pas perdre les données de la même qu'en AJAX qui retourne la valeur de la saisie "POST" stock dans une "var" ASYNCHRON

```javascript
 <TextInput
          style={% raw %}{{height: 40, height : 20, width: 200}}{% endraw %}

          placeholder="Type here to transl ate!"

          onChangeText={(text) => this.setState({text})}
        />
```

### ScrollView
> une scroll view est une balise ibnline elle n'a pas de taille définie ; elle prend la taille de ses enfants :
- height
```typescript
 <ScrollView>
          <Text style={% raw %}{{fontSize:96}}{% endraw %}>Scroll me plz</Text>
          <Image source={% raw %}{{ %uri: "https://facebook.github.io/react-native/img/favicon.png", width: 64, height: 64}}{% endraw %} />
          <Image source={% raw %}{{uri: "https://facebook.github.io/react-native/img/favicon.png", width: 64, height: 64}}{% endraw %} />
          <Text style={% raw %}{{fontSize:96}}{% endraw %}>If you like</Text>

   </ScrollView>

```

### FlatList
> Ul li ; liste d'informations dont les clefs sqont similaires
- data : un tableau / object [clef :  valeur]
-  renderItem : qui applique un foreach avec la var à retourner dans la vue  ou comme une `.map` en prenant la   `var.nomdelaclef`

nom
    titre
    rue
    img
    def


```typescript
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
```typescript
<SectionList
  renderItem={({item, index, section}) => <Text key={index}>{item}</Text>}

  renderSectionHeader={({section: {title}
  }) => (
    <Text style={% raw %}{{fontWeight: 'bold'}}{% endraw %}>{title}</Text>
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
```typescript
<WebView
        source={% raw %}{{uri: 'https://github.com/facebook/react-native'}}{% endraw %}
        style={% raw %}{{marginTop: 20}}{% endraw %}
      />
```

### Modal
> affiche une tooltips qui peut être personnalisé contrairement  "Alert"
- êut contenir un style et contenu personnalisé
- animation
- visibilite est le déclencheur (true/false) => state
- un event => state
```typescript
        <Modal
          animationType="slide"
          transparent={false}
          visible={this.state.modalVisible}
          onRequestClose={() => {
            alert('Modal has been closed.');
          }
          }>

          <View style={% raw %}{{marginTop: 22}}{% endraw %}>
            <View>
              <Text>Hello World!</Text>

              <TouchableHighlight
                onPress={() => {
                  this.setModalVisible(!this.state.modalVisible);
                }
                }>
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

```typescript
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


### Dimension
> est une class qui possède des methode static qui ecoute unn evenement
- get()
- set()
```typescript
const dim = Dimensions.get('window');

  <View>

<Text>{dim.height}</Text>
<Text>{dim.width}</Text>
  </View>

ou
var {height, width} = Dimensions.get('window');

```


## Dependnces

- deux références:
  - [npmjs](https://www.npmjs.com/package/react-native-css)
  - [github](https://github.com/)
- node.js == js : [moment.js](https://momentjs.com/)
    - installation d'un dependances(pkg) npm pas en `--general` contrairement à un pkg utilitaire
```
    npm install react-native-css --save
```

- warning de demande d'installation manuel de pkg : c'est souvent qu'une autre dependance peut avoir besoin d'installer un pkg des versions de pkg de version différentes et donc laisser le choix à l'utilisateur de choisir sa version

- en react-native JS + NATIF (ios/androoid)
    - lors de la visu du repo d'un pkg (sur github) on peu voir s'il est natif sur le dossier racine où  il sera indiqué que ios/android

## Export :  Fonction, constante,  class
> download: [npm icon](https://github.com/oblador/react-native-vector-icons) qui rapatrie FontAwesome, Fondation,  les  [apercu](https://oblador.github.io/react-native-vector-icons/)
**`export default`** permet d'importer tout le contenu du fichier  et l'import se fait par **`import Style from '../components/Style'`**
```typescript
const Style = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#374046',
        alignItems: 'center',
    },
    });
export default Style;
```

**`export`** peut s'appliquer sur une Class / Var dans ce cas on peut importer unique la fonction / var / class et selon la sintax **`import { StyleSheet, Text, View } from 'react-native';`**
```typescript
function style(){
return "style toto";
}
export style();
```

## Navigation
[react-navigation](https://reactnavigation.org/)
- Menu
    - onglet
    - tiroir
    - barre
- Hierarchie entre les écrans
- les transition
> il y a des API rattaché à à la navigation qui sont directement rattachés aux API d'origine

### asynchrone
- objet (Class) "Promise" intégré par defautl
> c'est une classe qui possède une fonctin qui prends deux paramètres qui sont des fonction
```typescript
maMethodeAsyn(){
    const maPromise = new Promise((success, failure )=>{
    const toto  = 40;
    success(toto)
    failure("erreur - long")
    });
    maPromise.then(()=>{
    console.log(returnValue);
    })
 }

```

```typescript
async maMethodeAsyn(){
    const maPromise = new Promise((success, failure )=>{
    const toto  = 40;

    success(toto)
    failure("erreur - long")
    });
    maPromise.then(()=>{
    console.log(returnValue);
    })
 }

```

```typescript
metAsyn(tot, tat){
    console.warn("ma met tata tot);
    toto("42)
}
metReturn(param){
    console.warn(param)
}
metPromise(){
    const maPromise = new Promise(this.metAsync).then(this.metReturn)
}
```

ici param == au echo de la fonction tata tot
```typescript
metAsynFleche(tot, tat){
 const maPromise = new Promise((tot, tat) =>{
    console.warn("ma met tata tot);
 }).then((param) => {

 }).catch((error)=>{});

```


```typescript
metAsyn(){
const metFetch = fetch('url.json')
metFetch.then(()=> {
const resPromise =  titi.jon();
    resPromise.then((retour)=>{
            retour
        }).catche(()=>{
        error
        });
    }).catch((error)=>{error});
}
```

>lors d'un appel de fonction commençant par `async` on peut envoyer une gestion des erreurs via un try-catch dans l'exemple suivant on aurati donc pu se passer du try catch si la valeur retour  ne renvois pas d'erreur sinon il ne passerai jamais dans le tryc catch
```typescript
async metAsyn(){
    const metFetch = await fetch('url.json') //promesse1
    const retour = await titi.json; // promesse

   // ne gère pas l'erreur et il faut le faire manuelleme en un try-catch

    try{
    const retour = await titi.json; // promesse
}catch(e){e}
    console.warn(retour);
    return 42;
}
```





### api rest

[fetch ](https://facebook.github.io/react-native/docs/network) (integré par defaul, pas d'import
   - ne gère pas de timeout
   - ne gère pas les errerus
   - ne gère pas progression de gestion d'envoie fichier  contenu
 pour ça choisir Axios
> on lui passe des une valeur


## stockage
- [asyncStorage](https://facebook.github.io/react-native/docs/asyncstorage) possède des méthodes static, elle s'importe `{ AsyncStorage } from "react-native"`, cette fonction récupère un
- orm (externe) [sqlite](),  [realm]()


## cycle de vie
will & did mount permet de voir les différente étape avant après que le render soit envoyé


stateless
> un composant qui est une fonction elle retourn un élement qui est un composant, la diff dans avec le composant dans la clsse c'est que cette méthode est ooptimisée

```typescript
 maStatlessText(props){
    return <Text>props.name</Text>
 }

 // dans la class on apple la props "name via le "l'atrtibut name="

 <maStatlessTex name={this.state.content}/>
```

on peut implémenter un élémet "block" avec plusieur element jsx

## géololocalisation
- geolocalisation de l'appareil
- maj position
- coordoné postal

avec react-native-maps
& [location EXPO](https://docs.expo.io/versions/latest/sdk/location) & [geoloca REACT](https://facebook.github.io/react-native/docs/geolocation)

[service google avec expo](Expo.Location.setApiKey(apiKey))

