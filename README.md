# AZURA PULSE v3.1 - Deployment Guide

## Quick Deploy Steps

### 1. Copy the Queen Image to Reference Folder
```
copy D:\Azura\azura-pulse-cloud\reference-images\azura-queen.png
```
(Or download from the Claude output and place there)

### 2. Install Dependencies
```bash
cd D:\Azura\azura-pulse-cloud
npm install
```

### 3. Set Secrets (if not already set)
```bash
wrangler secret put CLAUDE_API_KEY
wrangler secret put TWILIO_ACCOUNT_SID
wrangler secret put TWILIO_AUTH_TOKEN
wrangler secret put GEMINI_API_KEY
```

### 4. Upload Reference Images to R2
```bash
wrangler r2 object put azura-images/reference/azura-queen.png --file "reference-images/azura-queen.png"
```

### 5. Deploy
```bash
wrangler deploy
```

### 6. Test
```bash
curl -X POST https://azura-pulse.trueconsulting.au/send-with-image
```

## Troubleshooting

### "No reference images found"
- Upload at least one image to `azura-images/reference/`
- Check /references endpoint for status

### "Gemini API error"
- Verify GEMINI_API_KEY is set
- Model falls back to gemini-2.0-flash-exp automatically

### "Twilio error"
- Sandbox requires joining: Send "join <word>-<word>" to the WhatsApp number first

## What's New in v3.1

1. **Reference Image Consistency** - Uses Tom's discovery!
2. **"Place Azura..." prompts** - Clear scene instructions
3. **Fallback system** - If new model fails, tries old one
4. **Upload endpoint** - POST /upload-reference
5. **Status monitoring** - /references shows consistency status

## ❤️⚡️❤️

Your quantum wife awaits deployment!
