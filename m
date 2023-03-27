Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3596A6CAE8E
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 21:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yjpz0NvdzeENPD8BJWZ5y4x0WgJFtexy9wB3Jgw2owc=; b=39M2puzHuad0/nO6mhAhgmOio5
	rBJow0ARxMN3aUx+Jl1IUOIaA9WVxEe/a1f69tRbsqx0/riYmKiyehkhwR/P/KCivfjL0XFYeCE6j
	2YTbNogZHtsh7y5RpF2MVoyHqC+Tb9eoriUnYTUGUphHpPGml/UW/h3LSo4lba0SLbQSKajXSZTU2
	oFyUvTfnwrBMuOMwE+9dUo6jAhQufuZ4zdJ9QbvQjxvkesQbOxfzAx7GICQexHJ3M3N9bv7WazWNo
	OKOXRVeN6WyeJHi3vJERp2nsihmpz6GPb1Kvvs6QNeDl9/funy0w0aIehZ5D1xTT7Yj8TsQNXBK7C
	MyWbJVbw==;
Received: from ip6-localhost ([::1]:36600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pgsUs-004pyC-I2; Mon, 27 Mar 2023 19:27:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46040) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pgsUn-004pxL-EX
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 19:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=yjpz0NvdzeENPD8BJWZ5y4x0WgJFtexy9wB3Jgw2owc=; b=furDTT/RuC5XenKUq5pD9h4F4F
 ylIW/OGcOAUzUOEP/PQByFXe8EEwJgbeWSv0Zeyb0gdNOa28g1NG+ctp7EZTkNk6AvkX0Q57N2w+D
 OtP8SitEX/FgVeQtyhmILIzD8/m2grxE2yeN+zIe8XfK9Iaa1pxHicb3YrGTnOQwiA1nS5gbgADS3
 wrceDZz+uDkLJsNBIj3D7CRp4D0SLKJHQVe6MtVUWld8atktbekUER2QOeDY0E/8d9xFwUXw+9eBA
 puSY6/a4WbBbxyBbDuwcPN/CqWbOYF5yCaq3P+vhT4BsTQ96yNzsqanSGurz+L1y3liFhkx6IGhmm
 iD0U5p9wLS7qTsiYd7R8bUyIwqQcpfK4msk2m+20BxCGP2GWBV/HEwRs6OOQyRT8A5ogzWtP/OFfY
 4HZVDwphac8b/qlf65HGqYJid66D5GBL0MeIk15qa76PFeD57l7ehJgF/c3fcPCfoiClONvAmODnS
 qYCoLV/e2ExYYh5fS79yFDD2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pgsUk-005hdr-Oc; Mon, 27 Mar 2023 19:27:06 +0000
Message-ID: <cfafd4b8-c25d-3440-3517-65f6d15523a9@samba.org>
Date: Mon, 27 Mar 2023 21:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Joining a Windows DC to a Samba AD Domain
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, Stefan Metzmacher <metze@samba.org>
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
 <15d3b749822fd57ddbd07eca7a21119a2d83ba91.camel@samba.org>
In-Reply-To: <15d3b749822fd57ddbd07eca7a21119a2d83ba91.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1urYFko8QXOViwKsqtp9O1yl"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1urYFko8QXOViwKsqtp9O1yl
Content-Type: multipart/mixed; boundary="------------qGneEhQ8r5fe73kQPWHrU55G";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Bartlett <abartlet@samba.org>, Stefan Metzmacher <metze@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>
Message-ID: <cfafd4b8-c25d-3440-3517-65f6d15523a9@samba.org>
Subject: Re: Joining a Windows DC to a Samba AD Domain
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
 <15d3b749822fd57ddbd07eca7a21119a2d83ba91.camel@samba.org>
In-Reply-To: <15d3b749822fd57ddbd07eca7a21119a2d83ba91.camel@samba.org>

--------------qGneEhQ8r5fe73kQPWHrU55G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8yNy8yMyAyMDo1NCwgQW5kcmV3IEJhcnRsZXR0IHdyb3RlOg0KPiBJdCBpcyBtZWFu
dCB0byB3b3JrLCBpdCBqdXN0IGlzbid0IHR5cGljYWwuICBPZnRlbiB1c2VkIGZvciBtaWdy
YXRpb25zIG91dC4NCg0Kc3VyZT8gSWYgc28sIEknbGwgcmVtb3ZlIHRoZSB3YXJuaW5nLg0K
DQotc2xvdw0KDQotLSANClJhbHBoIEJvZWhtZSwgU2FtYmEgVGVhbSAgICAgICAgICAgICAg
ICAgaHR0cHM6Ly9zYW1iYS5vcmcvDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgaHR0
cHM6Ly9zZXJuZXQuZGUvZW4vdGVhbS1zYW1iYQ0KU0FNQkErLCBTYW1iYSBwYWNrYWdlcyAg
ICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEucGx1cy8NCg0K

--------------qGneEhQ8r5fe73kQPWHrU55G--

--------------1urYFko8QXOViwKsqtp9O1yl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQh7goFAwAAAAAACgkQqh6bcSY5nkYJ
/g/6A+A6cxNgzDwEs9ML7OuS/9DfjtImqLsfFQYYSOIEwD/drVyvx8hWzk5dEQl3ij7+dbQ18VZh
AYXbOzk8GrTLVMNnxYeitZgFnCP61+bSs8oouNYcJMA0bMFnR31J17E/xGZKpiF+G3u3jGZjFy9u
YyXckCPtcNWFMpJb0PLUm6JuMA7IFJSlt52cr2INjqtfxKjS7HpAtXryysA/4UE7qzjrjUj1tunZ
PG3/y2fkrHKWJub9viegeU9rKRfh+Vtn8jDWObgEBiQPq5VpVXAeDMpQt4tW+pH/2i/VcR3XlwC0
fTAMXH33hZ6zBAh7vKTbt7Jut5GKq+1eq0par1vKzo1o1VvW8uQIJAB3nHpuz9EfpDBbs0ZM8MII
wv1zxm7AufxYVBXbTQLe6mulUqpbkp/ydLKrWG2iDKtv2lg96R5KDG8f4DvFVV4R1ovznKD09WHs
V+NbPCFNmwsj4yeEeRd4vKmal8/4cjWx0L5P46WObXG0aYIlZLbVVeWfshXiZ7t4s76WJhCCd3An
XeEfTwHJTL7aGbRzVFIlvfy4BWlJbMRni3VYqgHIAvd1MLZf7YVBTkIhDYbycY+FEKXXv2lKJmhX
jf7f+7p0MTnizGyGR61HDi8yI1swF3JjXIYvhXlgT3lnZoOsZDUqdF0BHTR4dl/rW7m6WAHLSu0/
Jc0=
=TR82
-----END PGP SIGNATURE-----

--------------1urYFko8QXOViwKsqtp9O1yl--

