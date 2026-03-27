# 🎯 Context and needs

## 📌 Need description

The project is to **record user scenarios on a web application** (Liferay DXP in our case) and then **automatically replay these scenarios on multiple identical environments** (DEV, INT, REC, PROD), or on other sites within the same environment.

A scenario corresponds to a sequence of actions performed in the browser:
- Navigation between pages
- Clicks on buttons / menus
- Form input (login, content creation, etc.)
- Advanced interactions (iframes, drag & drop, dynamic menus)

The main goal is **not functional testing**, but rather:
- **Reproducibility of business journeys**
- **Fast validation after deployment**
- The ability to **record & playback** to speed up scenario creation

---

## 🧩 Technical constraints from the context

- Modern web application (SPA, JavaScript, iframes)
- Use of **Liferay** (dynamic DOM, Shadow DOM, iframes, drag & drop)
- Execution in **Docker environments**
- Scenarios replayed across multiple URLs (via the `BASE_URL` variable)
- Need for a **maintainable**, readable, and scalable tool

---

# 🛠️ Tools evaluated

The following three tools are compared:
- **Playwright**
- **Selenium (IDE / WebDriver)**
- **Robot Framework**

The comparison considers **record & playback**, ease of use, and fit for the need.

---

# 📊 Overall comparison table

| Criteria | Playwright | Selenium | Robot Framework |
|------|-----------|----------|-----------------|
| Supported languages | JS / TS / Python / Java / C# | Multi-language | Python / keywords |
| Record & Playback | ✅ Playwright Codegen | ⚠️ Selenium IDE only | ❌ Not native |
| Generated code quality | ⭐⭐⭐⭐ | ⭐⭐ | ❌ |
| SPA / modern JS support | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| Iframe / Shadow DOM handling | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐ |
| Drag & Drop | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐ |
| Test stability | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| Execution speed | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| Docker installation | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| Long-term maintenance | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| Learning curve | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |

---

# 🎥 Focus: Record & Playback

## ▶️ Playwright

- Native tool: **Playwright Codegen**
- Real-time recording via Chromium / Firefox / WebKit
- Generates **clean, maintainable code** (`test()`, `locator`, `getByRole`)
- The recorded scenario can be:
  - Cleaned up
  - Parameterized (`BASE_URL`, dynamic data)
  - Reused across multiple environments

👉 Very well suited to our need.

---

## ▶️ Selenium

- Main tool: **Selenium IDE** (browser extension)
- Recording is possible but:
  - Code is hard to maintain
  - Not robust on a dynamic DOM
  - Poor handling of iframes and SPAs

👉 Acceptable for simple demos, **not reliable for Liferay**.

---

## ▶️ Robot Framework

- No native record & playback
- Scenarios are written manually using keywords
- Very readable for non-developer profiles

👉 Excellent for structured functional tests, **less suited to recording complex journeys**.

---

# ✅ Pros and cons by tool

## 🟢 Playwright

**Pros**
- Automatic recording (Codegen)
- Very robust on modern applications
- Excellent handling of iframes, SPAs, drag & drop
- Fast, stable, well maintained
- Ideal for Docker & CI/CD

**Cons**
- Requires JavaScript / TypeScript basics
- Record & playback is a starting point, not the end goal

---

## 🟠 Selenium

**Pros**
- Long history and widely used
- Multi-language

**Cons**
- Selenium IDE is limited
- Fragile tests
- Costly maintenance
- Less suited to modern applications

---

## 🔵 Robot Framework

**Pros**
- Readable syntax
- Widely used in functional QA
- Easy to read for non-developers

**Cons**
- No real record & playback
- Less flexible for complex interactions
- Extra layer on top of Selenium

---

# 🏁 Conclusion

## 🎯 Best fit for the need

### ✅ **Playwright** is clearly the best choice

**Why?**
- It **natively** meets the **record & playback** need via Codegen
- It is perfectly suited to **modern applications like Liferay**
- It quickly turns a recorded scenario into a **robust, maintainable, and parameterized test**
- It integrates naturally with **Docker and CI/CD**

👉 **Final conclusion**:

>We will use **Playwright + Codegen** to record scenarios, then structure them as reusable E2E tests across all environments.

---

📌 *Selenium can be considered for legacy contexts, Robot Framework for QA teams focused on business workflows, but for our specific need, Playwright is the most relevant and durable choice.*

