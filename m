Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D96C3F60
	for <lists+samba-technical@lfdr.de>; Wed, 22 Mar 2023 01:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=zsNwUmxN7lmx5K9MiVVihrWyt/fAq5i7zJjIj8EAS7U=; b=6TEmP5WNROp+9HgeHM22WJR1qv
	D1TSnujaHfOtkUm2FJ13dUUmQi+SWtBk+br0IMWjEtZHCuHVane3l3urwd7fNgZIuok/lo4VU+Gig
	RyoFMyzvOSW/I0y6ycNyZ4nrNfIVPpy06p5p9fmc3WEMqPPxhDS2c2u/fhFRQkHgJBk11HCgrzotR
	W2gmEvYowHR0M5BvZM+c6k4UNy6ngUpp4Uj/tpauecoSU5/LcrxD3Pqsfs/2ZvPNymBcB3IN0eiA5
	ClK7CPTY32sCa9dBKh5Pp/B/r3ZFSUjP3QbaqZMFcPhxKaHqH2pDgoeD+6tGzOy047hhfXVQ57caO
	/dWes41A==;
Received: from ip6-localhost ([::1]:18960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pemkC-003oPK-Sk; Wed, 22 Mar 2023 00:54:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12440) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pemk3-003oOm-U3; Wed, 22 Mar 2023 00:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=zsNwUmxN7lmx5K9MiVVihrWyt/fAq5i7zJjIj8EAS7U=; b=0Z+X5Nhu7N0Vs8x9OwwsrasLae
 EYXm3YK4bmZvy6U4oMGO9lRnnrdpCssi0sgtMF3RKzsYgEO+uwKVX3EF5JehVGqjoCENilrOcb2qM
 StCfHiQVwjds75WxGqdwpiYW2vaX5ni+mC6tputely8x0S//usK7XSt9tvYXfPonWMga8A+bsp66U
 DXblQKYq1LdVX/XKmwgOUQZX7eDZmE8geaMnkNqTIw9enYlC5Vzhnjo3jR8Jobs2iUCmoDdH18dRI
 nLmaIaxzITD5LMkS0qXLkYF6I3RdP0XkGcxV3h8fUYJw0C8JXgtoXXwwtrWVUVv/WP55/qCjl8Deq
 +kUD+Z8v8IWo+MpLNtM7VlqBwod7IUJgIw/KGxDtlQoClr9e037zrqmvWWzQAObP/yedP3SpGj5gi
 cUJ7mG8zd/deXWcuxlid+Drt3kAIEAACBjM5qmxRHRHoPP4Zja/n6Ii/BETHp2MX4Tsu2UjTg69i/
 3FjgSEuKvk55PJ6uN3Y1yX/b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pemk0-004kig-Ph; Wed, 22 Mar 2023 00:54:13 +0000
Message-ID: <b9e0eed101e224500c3e665e8505052fc07b6501.camel@samba.org>
Subject: Re: mit-krb5 and heimdal binaries
To: Alexander Bokovoy <ab@samba.org>
Date: Wed, 22 Mar 2023 13:54:06 +1300
In-Reply-To: <ZBgbvnB76vjgkq/B@pinega.vda.li>
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <9b05bc0bbd74c3d8cb02bf2a59713bd5fb0b677d.camel@samba.org>
 <ZBgbvnB76vjgkq/B@pinega.vda.li>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Cc: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2023-03-20 at 10:39 +0200, Alexander Bokovoy wrote:
> Indeed. For the record, current set of tests not supported by
> 
> --with-system-mitkrb5 build:
> 
> 
> 
> ----------------------------------------
> 
> $ cat selftest/skip_mit_kdc
> 
> # We do not support RODC yet
> 
> .*rodc
> 
> .*RODC
> 
> ^samba4.ntvfs.cifs.ntlm.base.unlink
> 
> ^samba4.ntvfs.cifs.krb5.base.unlink
> 
> 
> 
> $ cat selftest/knownfail_mit_kdc_1_20 

...

The bulk of the failing tests are in the 'common'
selftest/knownfail_mit_kdc file, the file you mention above is only for
tests that are different between 1.20 and prior versions.

$ wc -l selftest/knownfail_mit_kdc
2207 selftest/knownfail_mit_kdc

It isn't as bad as it seems, and most of the differences simply won't
matter, which is why I felt confident to make the statement I did
earlier, but it isn't nearly done either. 

Thankfully most of the work is to write such a testsuite, and I'm very
grateful to Metze for starting that work and to Joseph for greatly
extending it, and in particular to those who funded the time spent. 

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions




