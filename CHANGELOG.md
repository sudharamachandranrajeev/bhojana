# Changelog

## 0.2.0

Self-hosted sync and a guided setup.

- Sync server: a Cloudflare Worker + D1 in `server/`, deployed with `npm run setup`. End-to-end encrypted;
  the server holds only ciphertext. Owner creates the first account, invites others with one-time codes.
- Setup wizard on a fresh install: server address or setup link, account, recovery key, or join from a
  device you already use. Skippable, and available later in Settings.
- Settings, Sync: owner tools to invite people and reset a member's login.
- Still works with a PocketBase sync server.

## 0.1.0

First release.

- Shopping lists: add items with quantity, tick them off, reorder by aisle-free simple order.
- Shops: 20 UK grocers, discounters and high-street stores, from Tesco to Primark.
- Compare: search one item across shops in the in-app browser and keep every price found.
- Live prices: sign in to a shop and set your postcode inside the app; prices, offers and stock come from your own session.
- Basket: fill a shop's basket from your list, one item at a time; you check out yourself.
- Delivery slots: open the shop's slot page signed in.
