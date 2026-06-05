'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/asset/doctor/doc.png": "43b0c0f1baf365c0b6791584d626d80c",
"assets/asset/doctor/doc22.png": "235177eb2319654d6c55c06274519c3e",
"assets/asset/doctor/docicon.png": "79d413475c2156255057a77a259941d3",
"assets/asset/halak/booking.png": "f4c73afdafb0e3db8c6f34448ca56a7d",
"assets/asset/halak/icon.png": "6c5da4ca888f87a52a48da161156dcf6",
"assets/asset/halak/screens.png": "5e44686c0992dcde19c8a1315e72a5f3",
"assets/asset/images/3.jpg": "0d9c5be95034328df37467f310a467d0",
"assets/asset/images/app_store_badge.png": "9f4bcdcbd6ed549cf7c364225097a247",
"assets/asset/images/play_store_badge.png": "fdf8fe5c09ccfcb8a8105e385c5529bd",
"assets/asset/iti/adminview.png": "c16ee16c6c17682eac55d689b4b95ab0",
"assets/asset/iti/app_icon.jpg": "570f297b77c550e6d978d7b1f2e97507",
"assets/asset/iti/mangerview.png": "d12f4acdaa97f40de3e468cb7a6ea1c0",
"assets/asset/iti/st1.png": "fccacac344aeda55f74cac9c82ace8ea",
"assets/asset/iti/st2.png": "edc237ec6cd92e330ec99e50da6bc74f",
"assets/asset/iti/st3.png": "20601df386cf3f30628df6da54702556",
"assets/asset/pos/ca1.png": "462aaa30b0ef71dd8669461e4b71ccc0",
"assets/asset/pos/ca2.png": "4afff9f11673273756598bdd682fc9fa",
"assets/asset/pos/p1.png": "8de082383fab86be22dc7027d6b65224",
"assets/asset/pos/p2.png": "1080f84b86543f3ab8fc9a833a47581f",
"assets/asset/pos/p3.png": "2573b4cecfc846102bafc2532f7769dd",
"assets/asset/pos/panda_logo.jpg": "210f6584b9df0ab0d46121cd47ee7136",
"assets/asset/routiner/r1.jpg": "991b108c739b9d5929a4d2036b8a3fd9",
"assets/asset/routiner/r2.jpg": "3f20c7d7df5a6c751d8db87a42245eff",
"assets/asset/routiner/r3.jpg": "938061ed72aed6ac203702d8badbc596",
"assets/asset/routiner/r4.jpg": "ab237ea77922bc8634d0a2b4a8600967",
"assets/asset/routiner/r5.jpg": "9ba914228e84089219dc24403bfca46b",
"assets/asset/routiner/r6.jpg": "9dca7308f697fb7e331d6ca007e6712e",
"assets/asset/routiner/rIcon.jpg": "25a323fa1126c21a367915860f73933b",
"assets/asset/takka/dashboard.png": "f53190b18909c4206e3b885bbe2cecde",
"assets/asset/takka/eats.png": "6d75a9bedf52a58bc8b8fd073ec9be08",
"assets/asset/takka/info.png": "90a7c74998c3de282ebde55f3cd425d5",
"assets/asset/takka/login.png": "d40bef2ec2ef746cda42f807e42a44c4",
"assets/asset/takka/social.png": "b3c50585e39f6b041dd82a15c364fa2b",
"assets/asset/tazkira/10.png": "a37c8a7ad091c1b0e1d3614baae8572c",
"assets/asset/tazkira/7.png": "0a92c49e248a5d494395e6bf5d6a5c8e",
"assets/asset/tazkira/8.png": "55499703bc6b2db1eda12fed190632c7",
"assets/asset/tazkira/9.png": "5e5d18cb5032d8ba3cbaf2c85da1d919",
"assets/asset/tazkira/icon.png": "398bb6e3f38ebbf9e237182f41cae3e3",
"assets/AssetManifest.bin": "2456bbf7acda0a4f757211a910135473",
"assets/AssetManifest.bin.json": "e5f79942f64eada5bf90b02bf4bfdd93",
"assets/AssetManifest.json": "82b2fb7c1872f926c000c02a29fee51d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "3f6938297d7ea7cdd069797eab63e5c6",
"assets/NOTICES": "e52fb57baa8a2e44a5927b7b3f80ff9b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "7322c754cbed596b3f4777cfc4e226cb",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/pp.png": "fdaaddd38cfe3e814fea52299639dc9e",
"index.html": "d838679e4b9891c771eabcf5f3a81d29",
"/": "d838679e4b9891c771eabcf5f3a81d29",
"main.dart.js": "592ec0a7d8dee6126f2b6339c2563cf4",
"manifest.json": "2b8a5577aa2643f162a7e8c2e553ffb6",
"version.json": "cc1fa9cce5af273c0909d105387fee89"};
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
