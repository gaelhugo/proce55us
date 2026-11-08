# PROCE55US — landing page

The project's homepage: <https://proce55us.com/> (web editor: <https://editor.proce55us.com/>)

A static bilingual landing page (`index.html`, no build step) served by GitHub Pages from `main` (`/` root):

- `index.html` — Landing page with interactive step showcase, header download button scrolling to `#download`, collapsible **"App blocked ?"** (**"App bloquée ?"**) Gatekeeper guide, and **"Direct installation"** (**"Installation directe"**) Terminal one-liners (`curl` & Homebrew).
- `lang/en.json` & `lang/fr.json` — English and French translations (auto-detected from browser language, switchable via `EN / FR` toggle).
- `install` — One-line macOS installer script (`curl -fsSL https://proce55us.com/install | sh`) that downloads the latest universal `.zip`, installs `/Applications/proce55us.app`, removes quarantine (`xattr -cr`), and opens the app.
- `assets/` — App icons, editor screenshots, and localized macOS Gatekeeper alert screenshots (`gatekeeper-en.png`, `gatekeeper-fr.png`).

The app itself lives in the
[ECAL_MID_1_2027](https://github.com/gaelhugo/ECAL_MID_1_2027/tree/main/Tools/AgentCodingWithLMStudio) monorepo
(`Tools/AgentCodingWithLMStudio/` for the web app,
`Tools/AgentCodingWithLMStudio-mac/` for the macOS build); downloads are its
[releases](https://github.com/gaelhugo/ECAL_MID_1_2027/releases).
