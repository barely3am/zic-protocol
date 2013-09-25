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
### 5.1 XML

```
<?xml version="1.00">
    <Person name="JimmyBob" id="1" email="jimmy@bob.com">
        <PhoneNumber number="+1 111-555-1212" type="MOBILE"/>
    </Person>
</xml>
```
### 5.2 JSON

```
{
    Person    => {
    	name	=> 'JimmyBob',
    	id		=> 1,
    	email	=> 'jimmy@bob.com'
    	PhoneNumber	=> [
    		{
    			number 	=> '+1 111-555-1212',
    			type	=> 'MOBILE',
    		}
    	]
]                     
```

### 5.3 Protocol Buffer

```
message Person {
  required string name = 1;
  required int32 id = 2;
  optional string email = 3;

  enum PhoneType {
    MOBILE = 0;
    HOME = 1;
    WORK = 2;
  }

  message PhoneNumber {
    required string number = 1;
    optional PhoneType type = 2 [default = HOME];
  }

  repeated PhoneNumber phone = 4;
}
```

6. Protocol
==
## 6.1 Person
```
+---------------+
| Person        |
+---------------+
| STRING name   |<>--{0..*}[ PhoneNumber    ]
| INT32 id      |
| STRING email  |
+---------------+
```

### PhoneNumber
Zero or many.

### name
Required. String. A free-form string representing the persons name.

### email
Optional. String. A free-form string representing the persons email address.

## 6.2 PhoneNumber
```
+------------------+
| PhoneNumber      |
+------------------+
| STRING number    |
| ENUM type        |
+------------------+
```

### number
Required. String. A free-form string representing the perons phone number.

### type
Optional. Enum. This attribute indicates the type of phone number being represented by number.

MOBILE

A persons mobile number.

HOME

A persons home number.

WORK

A persons work number.

## 6.3 PhoneType


6. Data Types
==

8. References
==
8.1. Implementations
--
1. Google Protocol Buffers Developer Guide - [developers.google.com](https://developers.google.com/protocol-buffers/docs/overview)

9. Bibliography
==
1. "Key words for use in RFCs to Indicate Requirement Levels" - [ietf.org](http://tools.ietf.org/html/rfc2119)
