Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D940449E
	for <lists+samba-technical@lfdr.de>; Thu,  9 Sep 2021 06:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=zh1c0UFKrcQkIErHKxrAfGvLs+7w8rdoQNbQ29mkLPA=; b=2Cgg/+5Iqq8XczalxYdPK+7ZRY
	IeLdkEy5YOoWkHXsuyLNwHXumDbcf8Y2a+dF9Iaq5fET7gfe/VV2W6dQuVCCaOZylF53ON1Ism/9q
	GdNXhz5DjbPXpN4H5+H9qnV+wj8UGQXdDNtBK4y8wLaBPlv0zbCmT+5JtYY9kjfibZ15T9vcsnQ1t
	4M/Fe0GqLsgSSZva3EpwWpatd/LjhDCr1W9OSCxEma1XxV7SyaBng4XIK1PGmDlMXOMn2vYfAZ/UO
	xG95UBjiRn+hrjb8KEWcsryTJ1mQ54Q+igUdiY5PXQAaXg2xwcQlzrGngt77/xeVW4nFO5bPh4sFL
	HA4kgoeg==;
Received: from ip6-localhost ([::1]:56532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mOC0h-00Dxq6-MQ; Thu, 09 Sep 2021 04:50:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39130) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mOC0Z-00Dxpx-Gr
 for samba-technical@lists.samba.org; Thu, 09 Sep 2021 04:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=zh1c0UFKrcQkIErHKxrAfGvLs+7w8rdoQNbQ29mkLPA=; b=Aq+JYZ9yTj+v7Z4rYZSAlgIy9x
 ZTbct8eTaP9OV/B5XZTyCOekf1d0n3t+fN2jcpuyy3DZ/0a88XXP5w9utPCF83u3F1DR7d104ULYw
 92Esc6duXGqllL2BvyqHHPiIo6SBwSMv+V+KzqJWyl4AZyCvKVWE5dH+LR6sDzxArc4OqgiP6Azr7
 yxqpsXV7FsAQ6VAff1+R4AyF5x94kHfJyctq2NxLwilNlAifLa9OZq+Uxu4lITp7cVLlDU8MYJFLI
 u+j8iK/RNOcFZfGFNzXc9Jl0ra37jOGLI8qjc3i3QlytG4/iSjlaI0bfe7HNKxDUwJ+BnKXRonuX+
 m/ClsLh39YbtnU3FmtlXK5MQnxZmMAAqlQLhucFIPiJe/yPsNRjMAorF0uIEWyoYf1wXiateZ/bBW
 MZj9l5twx7q2eQllYMJvjDSlerRaHAOq7L0ljVHoCkmhDQoZdZgEgxl+C36NIzHpuzouUp+T9cVYw
 fsZByC8O4yEBAzn+lAn7suHh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mOC0X-005KLf-98; Thu, 09 Sep 2021 04:49:53 +0000
Subject: Re: Is Samba's compile_commands.json useful?
To: Martin Schwenke <martin@meltin.net>,
 Samba Technical <samba-technical@lists.samba.org>
References: <20210909122517.5bc193cb@martins.ozlabs.org>
Message-ID: <877e249b-c99d-380d-45d1-d5950e2b50d4@samba.org>
Date: Thu, 9 Sep 2021 06:49:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909122517.5bc193cb@martins.ozlabs.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KpmG4lZBaPEyoifzJGKXJ0iqdUqfsR49B"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KpmG4lZBaPEyoifzJGKXJ0iqdUqfsR49B
Content-Type: multipart/mixed; boundary="LAJmF32lXr5LKdpTEVeB2EawvqUnVD6Gi";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Martin Schwenke <martin@meltin.net>,
 Samba Technical <samba-technical@lists.samba.org>
Message-ID: <877e249b-c99d-380d-45d1-d5950e2b50d4@samba.org>
Subject: Re: Is Samba's compile_commands.json useful?
References: <20210909122517.5bc193cb@martins.ozlabs.org>
In-Reply-To: <20210909122517.5bc193cb@martins.ozlabs.org>

--LAJmF32lXr5LKdpTEVeB2EawvqUnVD6Gi
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 09.09.21 um 04:25 schrieb Martin Schwenke via samba-technical:
> What am I missing?

I also noticed this a few days ago when using lsp im emacs as well.

It seems it's a regression introduced by=20
5d53b848f60efbb71e4cd2f51f33a06369ca9055. If I revert this change I get=20
a working compile database.

Looking...

-slow

--=20
Ralph Boehme, Samba Team                 https://samba.org/
Team Lead Samba@SerNet	    https://sernet.de/en/team-samba
Samba Development and Support, SerNet Professional Services


--LAJmF32lXr5LKdpTEVeB2EawvqUnVD6Gi--

--KpmG4lZBaPEyoifzJGKXJ0iqdUqfsR49B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmE5knAFAwAAAAAACgkQqh6bcSY5nkZ4
wBAApA6fv06sj63M0Vj6fQQAh3CjFU+1Ta14Sj3rm4MebGGMtuZ3AzB97QsWJuLrACr1umY+s44r
zzrWzUQdEQ7BxGYTG7X/cb5HmGDLLDFmZQYck01YcQ5dRtW+ZnWTZ8yG5RoQiKoWHagMMZX2ECHK
ylrmBZzF0Ikt10yj2bfmlsFf6bnm7ypIn8poW4+Ep05W6FUmB7pI0fodTrN9WcGKYi+mAyWDB4l3
qPKB18H9UvZfLdD07sZn/zSh+AH+ssFu4Ck9V9Fz6dCHbpfcL3wTuhI2FKCc52Kr1df259sSzMgC
IXZAUlSSLRVONpaYaphDzaRuWi7qlM3cxOwopNkZM/zv4tPOLNFShml34hLaOqaHsPvRlpajpUo0
wicBcGXUlwa+/I8oaGYerTKPLfZnPcV0YyXeEskF561An4PMBZEIiLcIkA/XIkme4SblFxA5A/d1
zRvaOHMa65GKKoO9rj5CtId1yo2BEYBNZEdIFetIl698A7zxMofVIpq9ElmPqtE5JiXwzGACkmhq
1GDUi8BrnMsTL8GuQjwSNBHJy7hwaqB3dUL6AIO5jWsODxBsEpfcgWO2OaZu1NSX2nKtytiyNdJu
O9CRnpSAk76fpDHxfrCW8/+kC6s9nstPgJlLazKVAyowfyN0kpoLpl5/hwnPemERdVGrRzPEizON
AZQ=
=Oiz3
-----END PGP SIGNATURE-----

--KpmG4lZBaPEyoifzJGKXJ0iqdUqfsR49B--

