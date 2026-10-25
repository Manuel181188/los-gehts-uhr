// Offline-Speicher: alle App-Dateien werden beim ersten Öffnen gespeichert.
const CACHE = "losgehtsuhr-20261025080619";
const FILES = ["./", "fonts.css", "fonts/Baloo2-latin-1.woff2", "fonts/Baloo2-latin-ext-0.woff2", "fonts/Nunito-latin-3.woff2", "fonts/Nunito-latin-ext-2.woff2", "icons/icon-180.png", "icons/icon-192.png", "icons/icon-512.png", "index.html", "manifest.webmanifest"];
self.addEventListener("install", (e) => {
  e.waitUntil(caches.open(CACHE).then((c) => c.addAll(FILES)).then(() => self.skipWaiting()));
});
self.addEventListener("activate", (e) => {
  e.waitUntil(caches.keys().then((keys) => Promise.all(keys.filter((k) => k !== CACHE).map((k) => caches.delete(k)))).then(() => self.clients.claim()));
});
self.addEventListener("fetch", (e) => {
  if (e.request.method !== "GET") return;
  e.respondWith(caches.match(e.request, { ignoreSearch: true }).then((hit) => hit || fetch(e.request)));
});
