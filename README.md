# 1. Goals

The Zic protocol is a magical protocol that enables you to track people's phone numbers, just like the government!

* To enable nerds to stalk their love interests
* To help you listen in on your loved-ones conversations more easily
* To re-invent the need for Facebook

# 2. License

This Specification is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

This Specification is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this program; if not, see <http://www.gnu.org/licenses>.

# 3. Change Process

This document is governed by the [Consensus-Oriented Specification System (COSS)](http://www.digistan.org/spec:1/COSS). In addition:

* Comments MUST be logged as [new issues](https://github.com/blog/411-github-issue-tracker).
* Contributions MUST be logged as [new pull-requests](https://help.github.com/articles/creating-a-pull-request).

# 4. Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](http://www.ietf.org/rfc/rfc2119.txt).

# 5. Protocol
## Person Class
The Person class is the top level class for stalking your loved ones. For each class, the semantics will be described and the relationship with other classes will be depicted with UML. 

```
+---------------+
| Person        |
+---------------+
| REAL version  |<>----------[ Name           ]
| INT32 id      |<>--{0..*}--[ PhoneNumber    ]
|               |<>--{0..*}--[ Email          ]
+---------------+
```

#####*The aggregate class that constitute Person is:*

### PhoneNumber
Zero or many. STRING. A free-form string representing the person's phone number.

### Name
Exactly One. STRING. A free-form string representing the person's name.

### Email
Zero or many. STRING. A free-form string representing the person's email address.

#####*The Person class has the following attributes:*

### version
Required. [REAL](#real-numbers). The specification version number to which this class conforms. While the protocol itself conforms to a [semantic versioning](http://semver.org/), implemented, the protocol version should conform to a REAL (float/double) number using "tenths", to the right of the decimal as a placeholder. Examples:

Semver | REAL
-------|-------
```0.0.1```  | ```0.0010```
```1.0.01``` | ```1.0001```
```2.1.2```  | ```2.1020```
```0.01.01```| ```0.0101```

### id
Required. INT32. A unique identifier representing the person.

## PhoneNumber Class
The PhoneNumber class is all about storing meta-data, phone numbers about people in the Person class.

```
+------------------+
| PhoneNumber      |
+------------------+
| STRING           |
|                  |
| ENUM ptype       |
+------------------+
```

#####*The PhoneNumber class has two attributes:*

### number
Required. STRING. A free-form string representing the persons phone number.

### ptype
Optional. ENUM. This attribute indicates the type of phone number being represented by number.

1. **mobile**. A person's mobile number.
2. **home**. A person's home number.
3. **work**. A person's work number.

# 6. Examples
## XML

```
<?xml version="1.0" encoding="UTF-8"?>
<person version="0.0001" id="1">
    <name>Jimmybob</name>
    <email>jimmy@bob.com</email>
    <phonenumber ptype="mobile">+1 111-555-1212</phonenumber>
</person>
</xml>
```
## JSON

```
"Person": [{
    "@version": "0.0001",
    "@id": 1,
    "Name": "JimmyBob",
    "Email":["jimmy@bob.com"],
    "PhoneNumber": [
        {
             "#text": "+1 111-555-1212",
             "@ptype": "mobile"
        }
    ]
}]
```

# 7. Data Types
## Real Numbers

Real (floating-point) attributes are represented by the REAL data type. Real data MUST be encoded in Base 10.

## Enumerated Types

Enumerated types are represented by the ENUM data type, and consist of an ordered list of acceptable values.  Each value has a representative keyword.  Within the schema, the enumerated type keywords are used as attribute values.

# 8. References
## Known Implementations

* libzic - [github.com/csirtgadgets](https://github.com/csirtgadgets/libzic)
* Google Protocol Buffers Developer Guide - [developers.google.com](https://developers.google.com/protocol-buffers/docs/overview)

## Other Examples
* [krenk-protocol](https://github.com/csirtgadgets/krenk-protocol) - information disclosure
* [nrang-protocol](https://github.com/csirtgadgets/krenk-protocol) - passive dns intelligence
* [heri-protocol](https://github.com/csirtgadgets/krenk-protocol) - reusable generic objects
* [sofur-protocol](https://github.com/csirtgadgets/krenk-protocol) - reusable filesystem objects
* [sligo-protocol](https://github.com/csirtgadgets/krenk-protocol) - reusable network metat-data objects
* [sagar-protocol](https://github.com/csirtgadgets/krenk-protocol) - an intelligence exchange protocols


## Misc
* CSIRT Gadgets Protocols - [csirtgadgets.org](http://csirtgadgets.org/rfc)
* Licenses for Protocols - [hintjens.com](http://hintjens.com/blog:41)
* Consensus Oriented Specification System - [digistan.org](http://www.digistan.org/)
* ZeroMQ RFC - [rfc.zeromq.org](http://rfc.zeromq.org/
* Freeformatter (xml to xsd, json validation, etc) - [freeformatter.com](http://www.freeformatter.com/)
* JSON Schema Generator [jsonschema.net](http://www.jsonschema.net/)
