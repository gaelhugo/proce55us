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
| **Groq** | `openai/gpt-oss-120b` | **Yes — 100% free** (no card, no phone) | **Very good & ultra-fast.** ~30 req/min, **1,000 req/day** (~200k tokens/day). | **Lowest friction (#1 recommended):** sign in at <https://console.groq.com/keys> and copy the key immediately. |
| **Google AI Studio** | `gemini-3.8-flash` | **Yes** (no card for personal testing keys) | **Excellent for coding.** ~15 req/min, 250–1,500 req/day. | In **Switzerland / EEA / UK**, the console shows "Pay-as-you-go" banners, but personal keys created at <https://aistudio.google.com/apikey> without linking a Cloud Billing account still get free quotas. |
| **OpenRouter** | `openrouter/free` | **Yes** (no card) | **Inconsistent** (random `:free` model). **20 req/min, 50 req/day** (1,000 req/day after a $10 lifetime top-up). | Routes randomly to any currently available `:free` model; quality varies and shared upstream providers may return `429` at peak hours (<https://openrouter.ai/keys>). |
| **Mistral** | `mistral-small-latest` | **No longer free for API** (paid credits or Pro plan required) | **Good**, paid per token or included in Pro ($15/mo API credits). | Mistral **discontinued** its old free "Experiment" API tier. On the current platform (<https://mistral.ai/fr/pricing/>), the **Gratuit / Free** plan only covers Vibe chat/CLI and includes **$0 in API credits** (`HTTP 402`). Using API keys (<https://console.mistral.ai/api-keys>) requires adding prepaid credits (<https://admin.mistral.ai/billing>) or a **Pro / Education** plan (<https://admin.mistral.ai/subscription>). |

### Other Free Cloud Alternatives (Browser CORS Verified for `editor.proce55us.com`)

- **Cerebras Cloud (`https://api.cerebras.ai/v1`) — Best Alternative:** $0, **no credit card**, instant signup (<https://cloud.cerebras.ai/>), **30 req/min & 1,000,000 free tokens/day**, >2,000 tokens/sec (`gpt-oss-120b`, `qwen-3-32b` / `qwen-3.8-27b`, `llama-3.3-70b`). OpenAI-compatible and sends `Access-Control-Allow-Origin: *`.
- **Hugging Face Inference Providers (`https://router.huggingface.co/v1`):** Free HF account (<https://huggingface.co/settings/tokens>), no credit card, serves `Qwen/Qwen2.5-Coder-32B-Instruct`, OpenAI-compatible and CORS-enabled (small monthly free credit cap).
- **Specific `:free` models on OpenRouter:** Pinning `qwen/qwen3-coder:free`, `deepseek/deepseek-chat-v3-0324:free`, or `meta-llama/llama-3.3-70b-instruct:free` instead of the random `openrouter/free` router (still capped at 50 req/day on $0 accounts).
- **GitHub Models (`https://models.github.ai/inference`) & SambaNova Cloud (`https://api.sambanova.ai/v1`):** Free with no credit card, but **do not send `Access-Control-Allow-Origin` headers** on preflight requests (usable only via a local proxy/desktop app, not directly from the browser on `editor.proce55us.com`).
