Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 12732889C6
	for <lists+samba-technical@lfdr.de>; Sat, 10 Aug 2019 10:07:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=G078Nar2pCqq0xiK9VU8s4L3s+xRuCEdY2cMwFJonBA=; b=aMyWkK/NRASQhuGBEBnLMDIUfe
	4s6XEzfDhj1u/LJYrXmOlsCxtOiwY7qzxpDGjzeUC+n20u9A4F5ybd89bT4vLjsunr7kWVkd9U9h0
	X6MnYbHQsdLOeLnpJPdhdmp9XYlkKVsOJ4Gs0eHbfq0l0HnH33+0SOfYkjzDClA7lp8SBjh7tmEcf
	hVW4dOnKzQkTC6ZB/+FYfZup+mwOH1MGj8caOm1Vw1zXi5OFTZMA/wXZJ6Q9Ij6Bdq6EAHa3GErLs
	sBIhZks9YHgj/nLkvVJ4BMjGYWTxp3biC9QmsUAvPAjdT20AUZ3cMY74GppkKXzsHe0I1QNU4aAYA
	0DKGzUoQ==;
Received: from localhost ([::1]:45414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hwMP3-005ZFw-By; Sat, 10 Aug 2019 08:07:05 +0000
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:9840) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hw79J-005QcI-Jf
 for samba-technical@lists.samba.org; Fri, 09 Aug 2019 15:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1565365789; x=1596901789;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version; bh=G078Nar2pCqq0xiK9VU8s4L3s+xRuCEdY2cMwFJonBA=;
 b=K/lZCkaLP13mx2jiNjL+CYdjVBmujVvA4Y/6PNzeSOCVi03OWWm+745r
 JylngoD2BxwZawt65VyvFZSV/L+/L4CJ5nYWEfZlUiRukMqCrb5dfuD29
 dPDnApjKr85jAg1PHE/W1HafA0aHfkVu/9ANZpPhyJD0lhZFbVGhPslYm g=;
X-Amazon-filename: signature.asc
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 09 Aug 2019 15:33:37 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id EF2A6A219F; Fri,  9 Aug 2019 15:33:36 +0000 (UTC)
Received: from EX13D27UWA002.ant.amazon.com (10.43.160.30) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 9 Aug 2019 15:33:37 +0000
Received: from u33b4e6d89a065e.ant.amazon.com (10.43.162.197) by
 EX13D27UWA002.ant.amazon.com (10.43.160.30) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 9 Aug 2019 15:33:36 +0000
To: <samba-technical@lists.samba.org>, Richard Sharpe
 <realrichardsharpe@gmail.com>
Subject: Re: net ads join seems to restrict itself to the first 5 DCs of those
 it finds
Date: Fri, 9 Aug 2019 08:33:29 -0700
Message-ID: <1803836.RimPDrGzcC@u33b4e6d89a065e.ant.amazon.com>
Organization: WorkSpaces Linux Desktop
In-Reply-To: <CACyXjPyxsrrTkD7dBtLuQiwrTh=o+8k9vJPKYfrMtrAe592hwA@mail.gmail.com>
References: <CACyXjPyxsrrTkD7dBtLuQiwrTh=o+8k9vJPKYfrMtrAe592hwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3277317.UgExmbmc4b";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [10.43.162.197]
Precedence: Bulk
X-Mailman-Approved-At: Sat, 10 Aug 2019 08:07:03 +0000
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
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
From: Alexey A Nikitin via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexey A Nikitin <nikitin@amazon.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--nextPart3277317.UgExmbmc4b
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Thursday, 8 August 2019 15:26:43 PDT Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> We are finding that net ads join is unable to join because it only
> issues cldap requests for the first five DCs it finds when looking up
> _ldap._tcp.realm ...
> 
> Is this correct?
> 
> The problem seems to be that sites and services is not correctly
> configured to return the closest DC first in the list and the one they
> should be contacting is around 16 out of 29 returned.
> 
> 

I cannot confirm (yet) seeing this issue in `net ads join`, but I have seen something similar in `adcli info`, where the code selects only the first five entries among the SRV RR for _ldap._tcp, leading to domain discovery failure in some setups where DNS is configured to return non-site-specific DCs yet firewalls block communications from clients to those DCs. One could rightfully say that the setup itself is broken, yet Windows is robust enough to handle that, but adcli wasn't.

I wrote a patch that fixes that behavior in adcli, it got accepted upstream some time ago. If someone can confirm this behavior with `net ads join` (or with Winbind in general - I have seen plenty cases where it fails to locate DCs, just haven't yet had time to pinpoint the root cause) then I imagine the patch for `net ads join` shouldn't be too difficult to write either.

--nextPart3277317.UgExmbmc4b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEpRZyqYrXfmxeMjWyd71YSxgxbEgFAl1NkkkACgkQd71YSxgx
bEg+/xAAqb8xEN6oo4fBISP/7eZXxSI6hIyCk95/0G7g95iesrR2lQzZngMIMbvi
9wCtK/k0X6s4uxTuaOoofuMbii6/sBQyXKMxlNKPDqIFsaRtB4MrMoYGs1VpDxJM
59RNQFXCl8+HykqXCnrOSFPomWRlu5yg3/ebU4sMdGWBPGOtiHXXIKQq9QLnDZnj
82LF5w5WBnM9PTFBzTs8GTNn9iZru5bfSQkYMztraFrtR9DSpe0cNQxNb/X3BvhJ
HqzJnRmgAW81b1K0qNvECpnlZsIVyWtqT1F7CBrodncC9YifC/hy064wYwxOLY2u
SXmchEL4bj6xOfeJHxL4E4ThlmaN8krRSw92p7kFOiulaFgTlM6TnkMRWPcr5PWx
4rBsRWkHyIgrVt4Xne11ickWhDCuU6mlWrzkXTCWm+XWfnlABWCf55N0paJAcL8y
0rdXHquZUjqUjb3TTNg6NLRg+RIwce4bK0pxRu0VxPIC7VhlUanNksYLd7XzX39D
2AR/8iZq6InCWPezrJIXfA65J3j5jPH1X7MJj6J2aeXyfWhYwoywsaB20iOXmkxE
eDI7H5XSdUTXIK8uvY0jwvpLQuTfVPX+a+qi5kRTLMDdxcTNdqIwgo3g+wGZHmEy
m1GegOVRtUGRYHsLn09SfhUIlXBgvbGZZZzMIAyqZTC0dBBQxuU=
=1l/N
-----END PGP SIGNATURE-----

--nextPart3277317.UgExmbmc4b--

