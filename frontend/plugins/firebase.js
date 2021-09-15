import firebase from 'firebase'

let app = null;
var firebaseConfig = {
  apiKey:"AIzaSyAtj-FPOUkzOZ3fj6f2zDB57s1kc9wzQtY",
  authDomain:"imagesservice-445d5.firebaseapp.com",
  projectId:"imagesservice-445d5",
  storageBucket:"imagesservice-445d5.appspot.com",
  messagingSenderId:"164211610621",
  appId:"1:164211610621:web:6ea2949f434e357cc43f94",
  measurementId:"G-T0KBJ81NY5"

};

app = firebase.apps.length
    ? firebase.app()
    : firebase.initializeApp(firebaseConfig)

export const db = app.database()