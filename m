Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7391DC334
	for <lists+samba-technical@lfdr.de>; Thu, 21 May 2020 01:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=bBLFt3CxTTVwDIPRVMYroczMw68dhdziqmOTPSSv1k8=; b=U/YrZDX04IouXFv4FxOhWqISYm
	DpVF8RiaaNIa6cqnrdbymwzg7k1OspeT1R4i1SOfpIUM6Es0RUaZ/zD/zqsQSBeGI8BzNwxyWmktF
	wGp9xjRrtNkw+8HHJKyMTW71TLhL/NnNtX4vHbalRdjl4J6B2af5POBa2Yd46RbF7+MrA7j3IcfOL
	B7i0SZ10WzA951K/9KCVzHGStiA0MPF6+m7rkkKZ7KTGKFJnPuTDwiD68xo8kA5wqbWKPq6vexMBi
	QjAx9p4AbI5b9CmZBsEo1jIc+p36+f5i67XBzVcNjZQ7fGGKMohBNo5ZDknWQIFtQk0qMUCOGy4fM
	Uxlg888w==;
Received: from localhost ([::1]:63464 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbYRP-005JZ8-DD; Wed, 20 May 2020 23:48:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbYRK-005JYz-7d
 for samba-technical@lists.samba.org; Wed, 20 May 2020 23:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=bBLFt3CxTTVwDIPRVMYroczMw68dhdziqmOTPSSv1k8=; b=2eIDkJbWYSPpzNxS4EFa1XdSZW
 2zROZW3mblubx/8rxOXm8KzQ5DLS7eJF4x+fkm/eGCFKbtrKC0M+TQUa7Avd6rC7OfSAo7mWT7plc
 wei4RgiaiiUEJKX+jsO/qOFVRkxwdohg2r8RfVQcipBiMlB+fO1e316Gm4H/NbvJ/JM4EVoL3YbzT
 /j2Nri1/tC3mOkY4SeWs1vt1n235rXKAvCOWopw4fLsIBwG9ZRK6lQ0dyeYgATrKzuhM0Q1n+PxRu
 M6mZ73vr5wKN8VmSbUpsvk6QAl32KTfDTJNnuEqjZ+BNPKqCAv4r68jqQ964Xsz/kJJkazBOpMPjy
 fdm+NVU7AzMX5Q4QHqJb6iN8W648H9XfTcd0EIPcXJ91Zx8M0M8saZZ5mhODkJNEVONqdxgJGQXl2
 egsNO9XyyvfOSsXqim9/C2yKFM9BgxM750PxCIUgO8rMSZun/D9cpjLfvg3H7MbATAiR3YROwt+hn
 lb/v4pEB4J9ODZ77qXuoOsdE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbYRH-00065g-KG; Wed, 20 May 2020 23:47:56 +0000
Message-ID: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
Subject: Avoiding further (LDAP) stack proliferation in Samba
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 21 May 2020 11:47:50 +1200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: swen@linux.ibm.com, cs@samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day Sswen and Christian,

As this is a more 'meta' question, I wanted to write to the broader
mailing list in regard to: 
https://gitlab.com/samba-team/samba/-/merge_requests/1351#note_346327256
which is following on from Jermey's comment: https://gitlab.com/samba-team/samba/-/merge_requests/1258#note_320352109

I'm really sorry this discussion has come up on what might, in other
circumstances been a great demonstration of showing the broader design
that started the tldap changes.

Jermey asked earlier to see the broader designs and given the broader
implications I think it is appropriate to have that raised on the list
here.  

Explaining our plans in public before we have code is not something we
do well in Samba - we fear (and this mail shows that is a genuine fear)
that others will jump in and suggest things.  Much easier to have the
code finished and put any questions to bed with: well, this is written
and works!

However, I quite strongly feel that we should not further proliferate
the new or substantial new use of tldap in Samba without:
 - offsetting work to reduce, not increase the number of LDAP protocol
stacks
and
 - substantial sharing of structures, ASN.1 parsing and other utility
code

My preference, as these are all sync or local callback based calls is
that you implement this with LDB.  LDB is a mature, extensively used
LDAP client library (not just the directory store for the AD DC).  

The routines you would need are ldb_search() and ldb_request().  The
timeout can be easily set on each request and I can assist with further
guidance if need be.

It might be that LDB as a whole is not suitable.  If so then I would
ask you instead implement other offsetting measures between all our
LDAP client libs.

We have seen in many other areas of Samba the incredible cost of code
duplication.  The efforts needed to merge the s3 and s4 RPC stacks has
been monumental.  The gap between the s3 and s4 loadparm systems
continues to create headaches that make it significantly harder than it
should be to just select and use the best of Samba's library code!

We have also seen this done well, where the new better API is
introduced on the basis that it also provide an emulation for and often
eventual elimination of the old API.  As examples:
 - Andreas introduced a new set of macros (PULL_LE_U32 et al) for
reading and writing integers, and the old macros (SIVALX et al) use
those.  The NDR callers have already been converted.
 - The python3 comparability API was introduced for the py2/py3
transition and is now almost totally removed.
 - gensec wrapped the old source3 authentication code first as a 'no
change' and then slowly the parts under it were merged.
 - the datagram messaging system is now common, underpinning both
messaging APIs.

You might ask why I didn't make this comment in 2015 when the idmap_ad
code was written, and why that prior art isn't a good enough guide?

I'll just say that the history of LDB in the Samba Team has been
fraught, and it would not have been wise of me to make a criticism to
those involved, at that time.

But I must raise this now, before we end up with three fully-fledged
LDAP client stacks in Samba!

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




