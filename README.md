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

## LLM Providers & Cloud Free Tiers

By default, **PROCE55US** connects to a local **LM Studio** server (`http://localhost:1234` / `http://127.0.0.1:1234`). On the web editor (<https://editor.proce55us.com/>), Chrome/Edge users must allow the **“Apps on device”** (**« Applis sur l'appareil »**) permission and enable CORS in LM Studio; a temporary light-orange banner guides users and re-appears with a shortcut to cloud settings if local access is refused.

Users without a local model can switch in `⚙︎ Settings` to a free cloud API key:

| Provider | Model | Really Free ($0, No Card)? | Quotas & Coding Quality | Friction / Setup Notes |
| :--- | :--- | :--- | :--- | :--- |
| **Google AI Studio** | `gemini-3.8-flash` | **Yes** (no card for personal testing keys) | **Excellent for coding.** ~15 req/min, 250–1,500 req/day. | In **Switzerland / EEA / UK**, the console shows "Pay-as-you-go" banners, but personal keys created at <https://aistudio.google.com/apikey> without linking a Cloud Billing account still get free quotas. |
| **Groq** | `openai/gpt-oss-120b` | **Yes — 100% free** (no card, no phone) | **Very good & ultra-fast.** ~30 req/min, **1,000 req/day** (~200k tokens/day). | **Lowest friction:** sign in at <https://console.groq.com/keys> and copy the key immediately. |
| **Cohere** | `command-a-03-2025` | **Yes — 100% free** (Trial key, no card) | **Very good (256K context, 8K output, 23 languages).** **20 req/min, 1,000 req/month**. | Every new Cohere account gets a free Trial API key upon registration (<https://dashboard.cohere.com/api-keys>). |
| **OpenRouter** | `openrouter/free` | **Yes** (no card) | **Inconsistent** (random `:free` model). **20 req/min, 50 req/day** (1,000 req/day after a $10 lifetime top-up). | Routes randomly to any currently available `:free` model; quality varies and shared upstream providers may return `429` at peak hours (<https://openrouter.ai/keys>). |

### Other Cloud Alternatives & Notes (Browser CORS Verified for `editor.proce55us.com`)

- **Specific `:free` models on OpenRouter:** Pinning `qwen/qwen3-coder:free`, `deepseek/deepseek-chat-v3-0324:free`, or `meta-llama/llama-3.3-70b-instruct:free` instead of the random `openrouter/free` router (still capped at 50 req/day on $0 accounts).
- **Mistral (`https://api.mistral.ai` — removed, no longer free for API):** Discontinued its free "Experiment" API tier; *Mode gratuit / Free mode* no longer includes API access (<https://docs.mistral.ai/fr/admin/billing-usage/usage-limits>).
- **Cerebras (`https://cloud.cerebras.ai` — removed, requires credit card):** Replaced its free tier with a 30-day / $5 trial that requires adding a verified payment method upfront (<https://inference-docs.cerebras.ai/support/rate-limits>).
- **Hugging Face Inference Providers (`https://router.huggingface.co/v1`):** Discontinued free monthly inference credits for free accounts (<https://huggingface.co/docs/inference-providers/pricing>).
- **GitHub Models (`https://models.github.ai/inference`) & SambaNova Cloud (`https://api.sambanova.ai/v1`):** Free with no credit card, but **do not send `Access-Control-Allow-Origin` headers** on preflight requests (usable only via a local proxy/desktop app, not directly from the browser on `editor.proce55us.com`).
