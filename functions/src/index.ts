// the backend to connect to hashpack, to create and send transactions
import * as functions from "firebase-functions";

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
import { HashConnect, HashConnectTypes } from 'hashconnect';
let hashconnect = new HashConnect();
let appMetadata: HashConnectTypes.AppMetadata = {
    name: "Karbon Basar",
    description: "An example hedera dApp",
    icon: "https://absolute.url/to/icon.png"
}

