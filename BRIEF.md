# BRIEF — CAIA Cosmetics (caiacosmetics-7)

Draft for Demo QA port. Research date: **12 September 2026**. English (skills). App UI: **Swedish**.

**Build gate:** CLOSED — awaiting Demo QA port / Pål open.

**Track:** **design-bakeoff / Cursor-only** (Composer High; Max only if first fold fails). Soft depth. Gold bar: **caiacosmetics-4**. Splash + 3–5 tab roots; functions need not work. No Opus §6 / UI-review. No Mail 1 from Scout (bakeoff). No full Scout→Mail2 inbound.

**New project.** Slug `caiacosmetics-7`, repo `third-act/caiacosmetics-7`. Do **not** reuse `caiacosmetics` / `-2` / `-3` / `-5` / `-6` code, seed, photos, or URLs. QA: https://www.thirdact.no/demo/caiacosmetics-7. Customer: https://www.thirdact.se/caiacosmetics-7 (form/market **SE** → `.se`). Skills pin: `303bc63` (`design-bakeoff/` PR #24).

Do **not** contact the brand. Never put `info@caiacosmetics.com` in the UI. Form To `pal@thirdact.se` — never in UI.

---

## 0. HARD REQUIREMENT — onske (verbatim)

Confirmed character-for-character with Norway Scout **12 Sep 2026** (91 chars):

> **Man ska kunna scanna ansiktet och få rekommendationer på vilka produkter som passar min hud**

Must ship visually: **face scan** → **resultat** → **rekommendationer** → **produkt-detalj**, plus **favoritter** and **profil**. Swedish UI. Brand from caiacosmetics.se. Elevate with KIT. Do not paraphrase. Do not dump raw onske as a labeled Hem section (design-bakeoff STOP).

---

## 1. Client

| | |
|---|---|
| Name | Beauty Icons AB (CAIA Cosmetics) |
| Org | 559153-2493 |
| Site | https://caiacosmetics.se/ |
| Audience | KUNDE — shoppers; mer-salg via ansiktsscan → produktanbefaling |
| Slug | caiacosmetics-7 |
| Market | **SE** (Swedish UI) |
| Form To | pal@thirdact.se — never in UI |
| Customer URL | https://www.thirdact.se/caiacosmetics-7 |
| QA | https://www.thirdact.no/demo/caiacosmetics-7 |

Founded by Bianca Ingrosso with beauty experts. SE D2C: makeup, skincare, hair, fragrance. Soft cream/blush photography; Scandi-minimal white chrome with dusty-rose accents.

**Brand tokens:** primary blush `#E0CCC7`, cream `#FFFCF7`, ink `#333333`, hover `#6F6464`. Type: Artico-close sans (bundled). Tone: informal *du*.

---

## 2. Audience

Logged-in CAIA customer (mock). Primary job: scan face and get product recommendations for their skin. Not staff/admin.

---

## 2c. Art direction

| Soft depth | ☑ LOCKED |
| Editorial light | ☐ |
| Warm document | ☐ |
| Dark luxury | ☐ |
| High-contrast sport | ☐ |

**Soft depth** — cream `#FFFCF7`, blush `#E0CCC7`, ink `#333333`. Soft depth ≠ sparse: compact first fold (hero + ≥2 blocks over fold).

---

## 5. Job flows (visual)

**A.** Face scan → resultat → rekommendationer  
**B.** Rekommendation → produkt-detalj  

Favoritter / profil = shallow under Mina.

---

## 6. Features (design-bakeoff — thin)

**Bakeoff tabs (4):** Hem · Hudscan · För dig · Mina  
Signature mock: Hudscan (static OK). Product-detalj optional push. Functions need not work; screens must look finished.

**design-bakeoff STOPs (PR #22–#24):** no black frame before fullscreen; Hem not text/onske dump; no nested photo scroll; distinct bundled images; TabPill clearance + compact first fold; AppShadows on cards (not chips); break-the-stack once per screen.

**§6e art:** Soft depth LOCKED. One accent-owned surface. Bar: caiacosmetics-4.

---

## Screens

face scan · resultat · rekommendationer · produkt-detalj · favoritter · profil

Splash → straight in as logged-in. No login route. No Firebase / Azure / TestFlight / Codemagic.
