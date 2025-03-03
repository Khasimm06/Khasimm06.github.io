'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "cbb5172acf06a1d7c4c7e186df557145",
"assets/AssetManifest.bin.json": "df000d7a67c40f0563ebeeebb84675d9",
"assets/AssetManifest.json": "0bced6222ea61e0c11f22f41ecab3be4",
"assets/assets/animal.jpeg": "99344673c6761bbd0f7455f326478f7e",
"assets/assets/arts.jpeg": "1425a499e31a02324f08175561a9572f",
"assets/assets/books.jpeg": "11247e66ecc5abe5ea6523db1918ce70",
"assets/assets/business.jpeg": "a62cd50e97123842d13466e2db4a3192",
"assets/assets/community.jpeg": "6212e5a3b4eddafa69db2f6978f79304",
"assets/assets/concert.jpg": "4fe471a2e197d3c5574af1547f1d0884",
"assets/assets/digital.jpeg": "1be27ea84d8d20dc14a7400f04b71058",
"assets/assets/disaster%2520relif.jpeg": "f674e96fb655c7ef06c1891d8976e569",
"assets/assets/education.jpeg": "1ab9690203e6d1e1a36b3c619fee1807",
"assets/assets/engineering.png": "9354a258b6f30ca9cac5b333c8465ace",
"assets/assets/environment.jpeg": "41b00c6837ad01afeb3d04a470cd87f2",
"assets/assets/environmentalV.jpeg": "78cf89065326066e47d17371cab8323e",
"assets/assets/facebook.png": "9ddb6dc5445f52761301d9ae3e474fc3",
"assets/assets/fashion.jpeg": "9fc67564859b5caaef148af4e2d92512",
"assets/assets/gaming.jpeg": "d1762165c6e517e8d4f3d2cf2575e9de",
"assets/assets/humanity.png": "e1d545cfe3d207bd4917049002f8f565",
"assets/assets/instagram.png": "34e485cfcd67b423cc73f6f168c31a7a",
"assets/assets/law.jpeg": "549d65c8eb7c73d0a8d1dca042280fa8",
"assets/assets/logo.jpg": "e93ea98c236c4fc0bd896d3119e1441c",
"assets/assets/logo1.png": "f6ba4636c17322eb4e77e2bc28411681",
"assets/assets/maths.png": "67491061464fefd83de5a0cbb4cc9739",
"assets/assets/medical.jpeg": "6c24eb83fb786b011a60f7cd9c1387dc",
"assets/assets/medicalV.png": "93ed6c0190c55eae0a2105520870318d",
"assets/assets/movies.jpeg": "a1f09a9870028a01bac7c40e5938ac78",
"assets/assets/music.jpeg": "d05144d467ea4bbc60a774843061f6ba",
"assets/assets/online.jpeg": "7d6f1541c6ee8fa1ea7934cfaadd5ddb",
"assets/assets/popular1.png": "6da8c58af82e3108930b54d59ca62532",
"assets/assets/popular2.jpg": "d7db0bd48fc8713902a382d6c43e487a",
"assets/assets/popular3.jpeg": "36d5d8e58d61e7be3f5fa2da7c381522",
"assets/assets/popular4.jpg": "d4aa31eca558cb2b112f625d0c29f20d",
"assets/assets/science.png": "338615111ad3c56828fc6631d7079bba",
"assets/assets/social.png": "c60b81ad158948ba24d58c97fb8dc18c",
"assets/assets/sports.png": "50d60638cc207e9d60b1ebafc66a3b94",
"assets/assets/teaching.jpeg": "fa0b8d4361fd1b7cc9039bbc4f825cec",
"assets/assets/twitter.png": "732705d4a689fe62b12120d077981c5e",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/fonts/MaterialIcons-Regular.otf": "0cd40ce63d29a93774845b5936cd847b",
"assets/NOTICES": "e7465cce2c39b3ea7a9aed8af034b3f6",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "ba51fce8d48b601e06e94b802ae8723c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "faf95e1e8f897dcce933f4cdb94bd041",
"/": "faf95e1e8f897dcce933f4cdb94bd041",
"main.dart.js": "1a58ffd2a9acf6420f2895ae4bbad61f",
"manifest.json": "6be190bb2fea8730b98e34398f95f630",
"version.json": "2e13d35904e2477b92e7a222941c4663"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
