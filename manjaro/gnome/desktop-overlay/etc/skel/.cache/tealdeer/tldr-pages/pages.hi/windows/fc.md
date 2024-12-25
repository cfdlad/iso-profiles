# fc

> दो फ़ाइलों या फ़ाइलों के सेट के बीच के अंतर की तुलना करें।
> फ़ाइलों के सेट की तुलना करने के लिए वाइल्डकार्ड (\*) का उपयोग करें।
> अधिक जानकारी: <https://learn.microsoft.com/windows-server/administration/windows-commands/fc>।

- 2 निर्दिष्ट फ़ाइलों की तुलना करें:

`fc {{फाइल1\का\पथ}} {{फाइल2\का\पथ}}`

- केस-इंसेंसिटिव तुलना करें:

`fc /c {{फाइल1\का\पथ}} {{फाइल2\का\पथ}}`

- फ़ाइलों की तुलना यूनिकोड टेक्स्ट के रूप में करें:

`fc /u {{फाइल1\का\पथ}} {{फाइल2\का\पथ}}`

- फ़ाइलों की तुलना ASCII टेक्स्ट के रूप में करें:

`fc /l {{फाइल1\का\पथ}} {{फाइल2\का\पथ}}`

- फ़ाइलों की तुलना बाइनरी के रूप में करें:

`fc /b {{फाइल1\का\पथ}} {{फाइल2\का\पथ}}`

- टैब-से-स्पेस विस्तार को अक्षम करें:

`fc /t {{फाइल1\का\पथ}} {{फाइल2\का\पथ}}`

- तुलना के लिए व्हाइटस्पेस (टैब और स्पेस) को संकुचित करें:

`fc /w {{फाइल1\का\पथ}} {{फाइल2\का\पथ}}`