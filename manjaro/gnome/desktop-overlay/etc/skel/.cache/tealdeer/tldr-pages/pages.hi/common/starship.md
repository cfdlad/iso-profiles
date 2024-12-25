# starship

> किसी भी शेल के लिए न्यूनतम, तेज़, और अनंत अनुकूलन योग्य प्रॉम्प्ट।
> कुछ उपकमांड जैसे `init` का अपना उपयोग दस्तावेज़ है।
> अधिक जानकारी: <https://starship.rs>।

- निर्दिष्ट शेल के लिए स्टारशिप एकीकरण कोड प्रिंट करें:

`starship init {{bash|elvish|fish|ion|powershell|tcsh|zsh|nu|xonsh|cmd}}`

- वर्तमान प्रॉम्प्ट के प्रत्येक भाग को समझाएं और उन्हें रेंडर करने में लगे समय को दिखाएं:

`starship explain`

- गणना की गई स्टारशिप कॉन्फ़िगरेशन प्रिंट करें (डिफ़ॉल्ट कॉन्फ़िगरेशन प्रिंट करने के लिए `--default` का उपयोग करें):

`starship print-config`

- समर्थित मॉड्यूल की सूची बनाएं:

`starship module --list`

- डिफ़ॉल्ट संपादक में स्टारशिप कॉन्फ़िगरेशन संपादित करें:

`starship configure`

- सिस्टम और स्टारशिप कॉन्फ़िगरेशन के बारे में जानकारी के साथ पूर्व-भरे हुए बग रिपोर्ट GitHub मुद्दा बनाएं:

`starship bug-report`

- निर्दिष्ट शेल के लिए पूर्णता स्क्रिप्ट प्रिंट करें:

`starship completions {{bash|elvish|fish|powershell|zsh}}`

- उपकमांड के लिए सहायता प्रदर्शित करें:

`starship {{उपकमांड}} --help`