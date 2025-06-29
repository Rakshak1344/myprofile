'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"manifest.json": "8b6c9bfa34e3a85781250220d5e4dd99",
"main.dart.mjs": "65464af98298c9a3ad3d68c437a30378",
"main.dart.js": "b5eb500570c9758252d692d5e5d83c8f",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"404.html": "eaad42cf713219c5b5c8e64f78e38442",
"index.html": "6c5878c970f427adcfa3fdb48085c6bf",
"/": "6c5878c970f427adcfa3fdb48085c6bf",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "d10ac4ee5ebe8c8fff90505150ba2a76",
"assets/AssetManifest.bin.json": "a6d111b600c4eef4d91fa9c66896e630",
"assets/AssetManifest.bin": "d690f7bd24abf92ba33fe82025213595",
"assets/NOTICES": "8350e944846d4a3edd7c83c501d74da2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/logos/r.webp": "42850dd0c8a70b5b7aea7b85f439dd68",
"assets/assets/logos/indipe.webp": "df4f0a8106e0f20b6dc6056b0d42d6b0",
"assets/assets/logos/superpay.webp": "f85c74f59bcd207190bd967d2f8f9b1d",
"assets/assets/logos/zenya.webp": "880ae56e2cbe17f0200357de0c5b75a5",
"assets/assets/logos/tezsure.webp": "25de5c04d937609eec9e9b9ad3bbf9fd",
"assets/assets/tech/mongo_db.webp": "a7137d4a14e06b90a528de65c395c107",
"assets/assets/tech/flutter.webp": "448baef9821e78d1cab2b3e0586f82d7",
"assets/assets/tech/dart.webp": "04c8015f91aaab8aeaaed945b1d44904",
"assets/assets/tech/pgsql.webp": "e758de706219e61110b2b8a161a56082",
"assets/assets/tech/sentry.webp": "a85627bbd5086046fa51119151480894",
"assets/assets/education/svpuc.webp": "61c40b442b2af9213997c6b921a755d3",
"assets/assets/education/acharya.webp": "79bbca60ec7dc1ec0ffc0cefb834a4ad",
"assets/assets/education/aims.webp": "249b60170234f7b233f2f76be6199a6d",
"assets/assets/education/st_marys_convent.webp": "6d2b83cdeb8cb66daed98f6533790f53",
"assets/assets/lottie/animation.json": "d3f61196e63d1de74a96e8333ee5672e",
"assets/assets/projects/indipe_consumer_4.webp": "327a491da7e5deac6727c21dcccd1941",
"assets/assets/projects/indipe_business_3.webp": "9c147f1faf79cc17e7b2a07820f97722",
"assets/assets/projects/indipe_business_6.webp": "02cbe38e165998dd5803b8a30e7f315c",
"assets/assets/projects/indipe_business_1.webp": "07a40828c359f408f1350ac16836daca",
"assets/assets/projects/indipe_consumer_2.webp": "7bab582f7f7f8ea836d74300d002d0c1",
"assets/assets/projects/indipe_consumer_3.webp": "f14fcf5261054c1379e11e68824a418b",
"assets/assets/projects/indipe_consumer_app_logo.png": "cbfd18abefd21224f699c2636ab83de5",
"assets/assets/projects/indipe_business_4.webp": "c1bca3c77e75210eb488d834b390d9dc",
"assets/assets/projects/indipe_consumer_5.webp": "dadcd929faad7b723564b849bf823bbd",
"assets/assets/projects/indipe_business_app_logo.webp": "d6efbaa866266dd1f07dcbc5ea1ea3aa",
"assets/assets/projects/Indipe_business_5.webp": "dfeff5e60cbf59d0511ede0bfe72c5d6",
"assets/assets/projects/indipe_business_2.webp": "6372f949b6c24f8fe264f35761b7021c",
"assets/assets/projects/indipe_consumer_1.webp": "14149afd1558dfe9a38f488e079d17b9",
"assets/AssetManifest.json": "473428dc8c6134a27717ceffe1bb8a80",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/FontManifest.json": "1b1e7812d9eb9f666db8444d7dde1b20",
"favicon.png": "f0cbe14f58b43cc393defa6e45f58973",
"icons/Icon-512.png": "e44cd78e97f1c073d0f9f09cd0c968f3",
"icons/Icon-maskable-192.png": "67bb1c79bf331d551df39c2b37348277",
"icons/apple-touch-icon.png": "fad81e21f5956373e8d46c7c2929dfa1",
"icons/favicon-32x32.png": "f0cbe14f58b43cc393defa6e45f58973",
"icons/Icon-192.png": "67bb1c79bf331d551df39c2b37348277",
"icons/favicon-16x16.png": "69c84e506d613411844717d66f3f4eda",
"icons/Icon-maskable-512.png": "e44cd78e97f1c073d0f9f09cd0c968f3",
"flutter_bootstrap.js": "c1fc8306091f254390b8c86fc4a4abda",
"main.dart.wasm": "0a44aac9ec78aa78673c22413e5dafda",
"version.json": "ed4196a263a7919322bbf877a1c4ca63"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
