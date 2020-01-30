'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets\AssetManifest.json": "de4a40444183eff507a5982f7a6bd386",
"/assets\FontManifest.json": "0621fb7723859a382fc19210904f6578",
"/assets\fonts\MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets\LICENSE": "904d5c6212170df616b9c87c1c067e0f",
"/assets\packages\cupertino_icons\assets\CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets\packages\material_design_icons_flutter\lib\fonts\materialdesignicons-webfont.ttf": "1618c77b6c5c11926819a8868a083031",
"/assets\Ubuntu-Regular.ttf": "2505bfbd9bde14a7829cc8c242a0d25c",
"/icons\face-stroke.png": "8aae19f788519cc0f2efeef396eed4f5",
"/icons\face.png": "f8e762d5e5c7f9d99bda38e2356f3566",
"/icons\Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons\Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/icons\R.png": "c6e239ed758029931d0781eb1c1c9f6c",
"/index.html": "67390881935030ffea2a6093b9ffbfa2",
"/main.dart.js": "c9a87f7d3e576d2b2eae79c70fcb12e6",
"/manifest.json": "611a1812bce43efe9b7c7790645bdaed"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
