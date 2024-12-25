# prstat

> सक्रिय प्रक्रिया सांख्यिकी की रिपोर्ट करें।
> अधिक जानकारी: <https://www.unix.com/man-page/sunos/1m/prstat>।

- सभी प्रक्रियाओं की जांच करें और सीपीयू उपयोग के अनुसार सांख्यिकी की रिपोर्ट करें:

`prstat`

- सभी प्रक्रियाओं की जांच करें और मेमोरी उपयोग के अनुसार सांख्यिकी की रिपोर्ट करें:

`prstat -s rss`

- प्रत्येक उपयोगकर्ता के लिए कुल उपयोग सारांश की रिपोर्ट करें:

`prstat -t`

- माइक्रोस्टेट प्रक्रिया लेखांकन जानकारी की रिपोर्ट करें:

`prstat -m`

- हर सेकंड शीर्ष 5 सीपीयू उपयोग करने वाली प्रक्रियाओं की सूची प्रिंट करें:

`prstat -c -n 5 -s cpu 1`