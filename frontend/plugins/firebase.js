import firebase from 'firebase'

let app = null;
var firebaseConfig = {
  apiKey: "AIzaSyANwhUPitFhinKUYAoILMhf334oJwrnQJg",
  authDomain: "gift-city-8195c.firebaseapp.com",
  projectId: "gift-city-8195c",
  storageBucket: "gift-city-8195c.appspot.com",
  messagingSenderId: "795593112967",
  appId: "1:795593112967:web:99c5f32aeb9e553040a722",
  measurementId: "G-5TDH687SN1"

};

app = firebase.apps.length
    ? firebase.app()
    : firebase.initializeApp(firebaseConfig)

export const db = app.database()