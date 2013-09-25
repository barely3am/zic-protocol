1. Goals
==
The Zic protocol is a magical protocol that enables you to track people's phone numbers, just like the government!

* To enable nerds to stalk their love interests
* To help you listen in on your loved-ones conversations more easily
* To re-invent the need for Facebook

2. License
==

This Specification is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

This Specification is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this program; if not, see <http://www.gnu.org/licenses>.

3. Change Process
==
This document is governed by the [Consensus-Oriented Specification System (COSS)](http://www.digistan.org/spec:1/COSS).


4. Language
==
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC [2119](http://www.ietf.org/rfc/rfc2119.txt).

## 5. Examples
### 5.1 [XML](https://github.com/csirtgadgets/zic-protocol/blob/master/src/xml/main.xsd)

```
<?xml version="1.0" encoding="UTF-8"?>
    <Person id="1">
        <Name>Jimmybob</Name>
        <Email>jimmy@bob.com</Email>
        <PhoneNumber ptype="mobile">+1 111-555-1212</PhoneNumber>
    </Person>
</xml>
```
### 5.2 JSON

```
{
    "Person": {
        "@id": 1,
        "Name": "JimmyBob",
        "Email":["jimmy@bob.com"],
        "PhoneNumber": [
            {
                "content": "+1 111-555-1212",
                "@ptype": "mobile"
            }
        ]
    }
}
```

### 5.3 [Protocol Buffer](https://github.com/csirtgadgets/zic-protocol/blob/master/src/pb/main.proto)

```
message Person {
  required string name  = 1;
  required int32 id     = 2;
  repeated string Email = 3;

  message PhoneNumberType {
      enum ptype_type {
        mobile  = 0;
        home    = 1;
        work    = 2;
    }
    required string content = 1;
    optional ptype_type ptype = 2 [ default = home ];
  }

  repeated PhoneNumberType PhoneNumber = 4;
}
```

6. Protocol
==
## 6.1 Person
```
+---------------+
| Person        |
+---------------+
| INT32 id      |<>--------[ Name           ]
|               |<>--{0..*}[ PhoneNumber    ]
|               |<>--{0..*}[ Email          ]
+---------------+
```

The aggregate class that constitute Person is:

### 6.1.1 PhoneNumber
Zero or many. STRING. A free-form string representing the person's phone number.

### 6.1.2 Name
Exactly One. STRING. A free-form string representing the person's name.

### 6.1.3 Email
Zero or many. STRING. A free-form string representing the person's email address.

The Person class has one attribute:

### 6.1.4 id
Required. A unique identifier representing the person.

## 6.2 PhoneNumber
```
+------------------+
| PhoneNumber      |
+------------------+
| STRING           |
|                  |
| ENUM ptype       |
+------------------+
```

The PhoneNumber class has two attributes:

### number
Required. STRING. A free-form string representing the persons phone number.

### ptype
Optional. ENUM. This attribute indicates the type of phone number being represented by number.

1. **mobile**. A persons mobile number.
1. **home**. A persons home number.
1. **work**. A persons work number.

6. Data Types
==

8. References
==
8.1. Implementations
--
1. Google Protocol Buffers Developer Guide - [developers.google.com](https://developers.google.com/protocol-buffers/docs/overview)

8.2 References
--
1. Freeformatter (xml to xsd, json validation, etc) - [freeformatter.com](http://www.freeformatter.com/)