# svcadm

> सेवा उदाहरणों को प्रबंधित करें।
> अधिक जानकारी: <https://www.unix.com/man-page/linux/1m/svcadm>।

- सेवा डेटाबेस में एक सेवा को सक्षम करें:

`svcadm enable {{सेवा नाम}}`

- सेवा को निष्क्रिय करें:

`svcadm disable {{सेवा नाम}}`

- चल रही सेवा को पुनः प्रारंभ करें:

`svcadm restart {{सेवा नाम}}`

- सेवा को कॉन्फ़िगरेशन फ़ाइलों को फिर से पढ़ने के लिए आदेश दें:

`svcadm refresh {{सेवा नाम}}`

- एक सेवा को रखरखाव स्थिति से हटा दें और इसे प्रारंभ करने का आदेश दें:

`svcadm clear {{सेवा नाम}}`