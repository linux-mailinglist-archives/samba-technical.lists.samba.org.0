Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C0297BBA
	for <lists+samba-technical@lfdr.de>; Sat, 24 Oct 2020 11:49:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ExF3+xp+cPfUgF3Y9UpB2AK7QwEu61XWplP22ISItMM=; b=K+/lbwQEBhQPn6s3R9CIo7N4I1
	JfVxwnk6fcP5ug0GZMPG4RjsQBp4DZYuuyvfECcSReOdv88QzGp2H8RTXshL0WqsvwKkJq1HSPy3B
	T/SBhJfdWZ3/nHxHIRV1CJjUvS7UpM+NVBgX2KwW6H1KGd0DrL3koeaRVdbBA2524gO6n7//okcXZ
	Hk7LxvRJzlTymnNWZvhPsxN1+q/NyU8xrBTOGKI5KxAmyEUWyK/cZV7WgBVRRH1/CWoFNsL3yToX0
	h1g9pgUggUrLsuq5mjotRc9nc3YJbZ0I1F0rOnFVAYIfoAobL9luOFZEq5z9XB2tjRV1S+r/tBry8
	PKhA0VNg==;
Received: from ip6-localhost ([::1]:41972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kWGA1-00DX3K-UB; Sat, 24 Oct 2020 09:48:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64656) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kWG9v-00DX3B-4S
 for samba-technical@lists.samba.org; Sat, 24 Oct 2020 09:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ExF3+xp+cPfUgF3Y9UpB2AK7QwEu61XWplP22ISItMM=; b=n92N9xGk8PlGUhTQ8xALJ75uzf
 K/NFJgfnqBmLum6DWljV8u1439tbOtAbDGNB5rEXOmBFTONrL4wvRSkfUQZAiciokEQBDxpKkexZb
 kWoj4PrB+DdQM9bZ3PjVF5E+sT0TpserwrfG8BdIfd7WT2yjjUh+9TgjdCOuciCZNiLUGauPj/916
 We8aNWDnJdjsmbubpW1JGNnhdGlkfZWhdYOSmbLcU41C2jkTTvgsWqSX43s2qL4s6JrlQUHY7tInS
 ET+1qW+y6ytqekg3CxVtXA77pfPGXWiPyiPmueOOiOXgTX+cokkqOR7c8LYhOLTP5BVW408U3aBcp
 BkyYN68Xsqxu+fibozYUVnM9os+3kiFYJknMi4PkPX80XgynK0ULA+53YSPKoQQps0PTOe9GVzr/4
 EOcijyTdJcU7eh+85VWdCXnW8u+9reBKwi91+JFkV8ff2JKdpxvQtk93QYKzXXZPwRPSxVS0oXMNJ
 JdS41yK3BAhVDHX2anmc6Wy9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kWG9m-0000sW-Vw; Sat, 24 Oct 2020 09:48:15 +0000
Date: Sat, 24 Oct 2020 12:48:12 +0300
To: Rowland penny <rpenny@samba.org>
Subject: Re: 4.12 -> 4.13 upgrade
Message-ID: <20201024094812.GD2164739@pinega.vda.li>
References: <vmime.5f915a06.1483.6a1ed22ad77c366@ms249-lin-003.rotterdam.bazuin.nl>
 <vmime.5f918bed.198e.754e857b761d4e3d@ms249-lin-003.rotterdam.bazuin.nl>
 <59d3c9e3-ada0-248a-8db2-ac45dba7fda6@samba.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59d3c9e3-ada0-248a-8db2-ac45dba7fda6@samba.org>
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On to, 22 loka 2020, Rowland penny via samba-technical wrote:
> On 22/10/2020 14:41, L.P.H. van Belle via samba-technical wrote:
> 
> > > OK, you are running buster but you must be running python3-dnspython
> > > version 2.0.0 because that error message is coming from that
> > > version, it has nothing to do with Samba:
> > > 
> > >       def query(self, qname, rdtype=dns.rdatatype.A,
> > > rdclass=dns.rdataclass.IN,
> > >                 tcp=False, source=None, raise_on_no_answer=True,
> > > source_port=0,
> > >                 lifetime=None):  # pragma: no cover
> > >           """Query nameservers to find the answer to the question.
> > > 
> > >           This method calls resolve() with ``search=True``, and is
> > >           provided for backwards compatbility with prior versions of
> > >           dnspython.  See the documentation for the resolve()
> > > method for
> > >           further details.
> > >           """
> > >           warnings.warn('please use
> > > dns.resolver.Resolver.resolve() instead',
> > >                         DeprecationWarning, stacklevel=2)
> > >           return self.resolve(qname, rdtype, rdclass, tcp, source,
> > >                               raise_on_no_answer, source_port,
> > > lifetime,
> > >                               True)
> > > 
> > > Version 1.16.0 (which Buster should be using) does not have the
> > > 'DeprecationWarning'.
> > I do agree with you but..
> > Well,  im 100% sure its 1.16 thats installed.
> > 
> > dpkg -l |grep python3-dnspython
> > ii  python3-dnspython              1.16.0-1                      all          DNS toolkit for Python 3
> > 
> This is the same code from 1.16.0:
> 
> def query(qname, rdtype=dns.rdatatype.A, rdclass=dns.rdataclass.IN,
>           tcp=False, source=None, raise_on_no_answer=True,
>           source_port=0, lifetime=None):
>     """Query nameservers to find the answer to the question.
> 
>     This is a convenience function that uses the default resolver
>     object to make the query.
> 
>     See ``dns.resolver.Resolver.query`` for more information on the
>     parameters.
>     """
> 
>     return get_default_resolver().query(qname, rdtype, rdclass, tcp, source,
>                                         raise_on_no_answer, source_port,
>                                         lifetime)
> 
> I would suggest that to get the warning that you are getting, you must be
> running either python3-dnspython 2.0.0 or a 'mangled' version 1.16.0

I have a prototype patch to support both dnspython variants -- we went
through this in FreeIPA couple months ago already. I cannot push a merge
request right now (gitlab conveniently went to struggle with an outage
at the moment I tried) but the patch is attached -- please give it a
try.


-- 
/ Alexander Bokovoy

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="samba-dnspython-2.0.0.patch"

From c00a39b035dbeb6dda66f60a75230577887af3f7 Mon Sep 17 00:00:00 2001
From: Alexander Bokovoy <ab@samba.org>
Date: Sat, 24 Oct 2020 12:17:44 +0300
Subject: [PATCH] DNS Resolver: support both dnspython before and after 2.0.0

`dnspython` 2.0.0 has many changes and several deprecations like:

```
> dns.resolver.resolve() has been added, allowing control of whether
search lists are used. dns.resolver.query() is retained for backwards
compatibility, but deprecated. The default for search list behavior can
be set at in the resolver object with the use_search_by_default
parameter. The default is False.

> dns.resolver.resolve_address() has been added, allowing easy
address-to-name lookups.
```

The new class `DNSResolver`:
- provides the compatibility layer
- defaults the previous behavior (the search list configured in the
  system's resolver configuration is used for relative names)
- defaults lifetime to 15sec (determines the number of seconds
  to spend trying to get an answer to the question)

The compatibility shim was developed by Stanislav Levin for FreeIPA and
adopted for Samba by Alexander Bokovoy.

Signed-off-by: Stanislav Levin <slev@altlinux.org>
Signed-off-by: Alexander Bokovoy <ab@samba.org>
---
 python/samba/dnsresolver.py           | 68 +++++++++++++++++++++++++++
 source4/scripting/bin/samba_dnsupdate |  5 +-
 2 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 python/samba/dnsresolver.py

diff --git a/python/samba/dnsresolver.py b/python/samba/dnsresolver.py
new file mode 100644
index 00000000000..a627555a855
--- /dev/null
+++ b/python/samba/dnsresolver.py
@@ -0,0 +1,68 @@
+# Samba wrapper for DNS resolvers
+#
+# Copyright (C) Stanislav Levin <slev@altlinux.org>
+# Copyright (C) Alexander Bokovoy <ab@samba.org>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 3 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import dns.resolver
+import dns.rdatatype
+import dns.reversename
+
+class DNSResolver(dns.resolver.Resolver):
+    """DNS stub resolver compatible with both dnspython < 2.0.0
+    and dnspython >= 2.0.0.
+
+    Set `use_search_by_default` attribute to `True`, which
+    determines the default for whether the search list configured
+    in the system's resolver configuration is used for relative
+    names, and whether the resolver's domain may be added to relative
+    names.
+
+    Increase the default lifetime which determines the number of seconds
+    to spend trying to get an answer to the question. dnspython 2.0.0
+    changes this to 5sec, while the previous one was 30sec.
+    """
+    def __init__(self, *args, **kwargs):
+        super().__init__(*args, **kwargs)
+        self.reset_defaults()
+        self.resolve = getattr(super(), "resolve", self.query)
+        self.resolve_address = getattr(
+            super(),
+            "resolve_address",
+            self._resolve_address
+        )
+
+    def reset_defaults(self):
+        self.use_search_by_default = True
+        # the default is 5sec
+        self.lifetime = 15
+
+    def reset(self):
+        super().reset()
+        self.reset_defaults()
+
+    def _resolve_address(self, ip_address, *args, **kwargs):
+        """Query nameservers for PTR records.
+
+        :param ip_address: IPv4 or IPv6 address
+        :type ip_address: str
+        """
+        return self.resolve(
+            dns.reversename.from_address(ip_address),
+            rdtype=dns.rdatatype.PTR,
+            *args,
+            **kwargs,
+        )
diff --git a/source4/scripting/bin/samba_dnsupdate b/source4/scripting/bin/samba_dnsupdate
index fcd4cc5b7da..518bb898d33 100755
--- a/source4/scripting/bin/samba_dnsupdate
+++ b/source4/scripting/bin/samba_dnsupdate
@@ -52,6 +52,7 @@ from samba.kcc import kcc_utils
 from samba.common import get_string
 import ldb
 
+from samba.dnsresolver import DNSResolver
 import dns.resolver
 import dns.exception
 
@@ -258,7 +259,7 @@ def hostname_match(h1, h2):
 
 def get_resolver(d=None):
     resolv_conf = os.getenv('RESOLV_CONF', default='/etc/resolv.conf')
-    resolver = dns.resolver.Resolver(filename=resolv_conf, configure=True)
+    resolver = DNSResolver(filename=resolv_conf, configure=True)
 
     if d is not None and d.nameservers != []:
         resolver.nameservers = d.nameservers
@@ -270,7 +271,7 @@ def check_one_dns_name(name, name_type, d=None):
     if d and not d.nameservers:
         d.nameservers = resolver.nameservers
     # dns.resolver.Answer
-    return resolver.query(name, name_type)
+    return resolver.resolve(name, name_type)
 
 def check_dns_name(d):
     """check that a DNS entry exists."""
-- 
2.28.0


--x+6KMIRAuhnl3hBn--

