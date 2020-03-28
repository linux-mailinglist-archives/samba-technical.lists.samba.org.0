Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28D19695C
	for <lists+samba-technical@lfdr.de>; Sat, 28 Mar 2020 21:57:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=C7te3ehZtxS6LsJQHHzuNsukXgsJXQWNXNl+sgVHSkA=; b=0E3eaLkruOjVp/ZW2WPfJBSn0F
	Ddw0nj0aP9EEoX1670Py179vHMTXSjOUcx7P/Vu5JUNvntC4q6zHwkBbxkBEsdBBuaUQUeFLnMWOS
	UyzqU9O9FJ0kdlZ4elUKVby9nL7aDV0/THs4b6Msa1yTjCQwFFGciDxmkLu4jWsnC0ANMqYrrL7FB
	981PnuCz9sLpSVb2+S4wi1l5988zOZlO2hRRVw+SMy+hZNIQaMaKxrGHHTiUqN52FTGxLwGzxRuyU
	P87Mm2+CJ8z2PXS+nNUiR4Fhsa7EQ1liOLTlXC37rE0hbdkY2UBPGjbGnGX5qashVsNq3S1F7LZ/3
	JxkLJNWg==;
Received: from localhost ([::1]:59224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jIIVv-000v7I-Cy; Sat, 28 Mar 2020 20:57:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46916) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jIIVq-000v7B-00
 for samba-technical@lists.samba.org; Sat, 28 Mar 2020 20:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=C7te3ehZtxS6LsJQHHzuNsukXgsJXQWNXNl+sgVHSkA=; b=yzTojfx2/f9jCkMX9ky3kpP8sp
 GZAmRZNt/uj+eESOdt9TmiS+wm0lC2fb0hM+ZFhUHklSMb5SNQXG7EZKqBzWSodTk+FwvlCOvAUR3
 W4XBiNrKOl1TFMOsf02XMj8r8tX2h3Xhohwk2CCJjYVALJuXRaH5GiKwhZvSunK7U3geCE0iXyXlF
 qswLrs67W22/sENaXqc5x7jmcaDUpUyBVOTFoSAw6w4ySQ/C4m7ieASxFGxPwoAnjMD5BoQ/JKjnx
 D1IEh8JLZR0O5wNbm35ubyjJ+16BAr82+q+umVZFWqBc1BRbtXXW+jz77ulmXDdGW123l7FQ3YYxB
 52OFJ0kIt0Mf/QtZprsL8E7mipp7cHsZ9xlhyfFDvHEElwDszUW16B4ybX4jZOdm9Td2ECm80oR7j
 yrXf+DiRJbdFdVXTHroHvbEAk5TDjazgd6lrTyik23lf33O13aUPb56GACZc0gdxll068DgPR7kVv
 RUFu2kDmEdtrhOaQQPsZ+md3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jIIVn-0007rv-L5; Sat, 28 Mar 2020 20:56:59 +0000
Subject: Re: [RFC PATCH RESEND] vfs_ceph: allow mounting a named filesystem
To: Jeff Layton <jlayton@samba.org>, Jeremy Allison <jra@samba.org>
References: <20200327162950.94545-1-jlayton@samba.org>
 <20200327175458.314ac804@samba.org>
 <2482855b759f39c2c7fe2c31966d8f4184b58d97.camel@samba.org>
 <20200328174754.GB2323@jeremy-acer>
 <53cee256c7ba658fa51771fec9c91296fd5eac81.camel@samba.org>
Message-ID: <f6ec73d4-c3f7-ed2e-cd52-5b8f0172be9f@samba.org>
Date: Sat, 28 Mar 2020 21:56:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <53cee256c7ba658fa51771fec9c91296fd5eac81.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GsuyPVfwquOeHea4vILahEpnoeIOpOJxp"
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
Cc: Marco Savoca <quaternionma@gmail.com>,
 Jeff Layton via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GsuyPVfwquOeHea4vILahEpnoeIOpOJxp
Content-Type: multipart/mixed; boundary="xnEzC22sD2alZsaXh0bKuGd1pHDUMJHqk"

--xnEzC22sD2alZsaXh0bKuGd1pHDUMJHqk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 3/28/20 um 9:45 PM schrieb Jeff Layton via samba-technical:
> On Sat, 2020-03-28 at 10:47 -0700, Jeremy Allison wrote:
>> Yes, you can hang a private pointer off the connection (per share
>> instance) handle.
>=20
> I assume you mean the connection_struct? Which field is the private
> pointer?

cf SMB_VFS_HANDLE_[S|G]ET_DATA

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--xnEzC22sD2alZsaXh0bKuGd1pHDUMJHqk--

--GsuyPVfwquOeHea4vILahEpnoeIOpOJxp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl5/uhoACgkQqh6bcSY5
nkYdSQ//YsowxYQKnAQto+V6HA9aBBQfRmV5eDEvzmxGayluNJmXVtvp2/3/hvb3
KzSMK1Du947XAXDX4aUxgP2dEhwLkwu8QGLV+3tEPg/ML0H1SX6KFBWxszms8XcF
KTUcY54A5Lbxcup21SXY61+6iNMVftv7AMDWkKpbawhOmGSzqdtyiZlInFA1xwrL
fOBQtfxIS3QZaqMb2gbz8NgBdvqKePcQQf5CYtsENBDocvOTGcQcfINsab3KN75u
cts1k+kh/L8ALYVqRbLlhf2Cmgvzd9t5WYZJ36J/bZulgvW6laylwj3qlGV5eIUo
4L8qp0yCTmS1HGLpgw9XcT9uHp5fIX3Db/lhOmaepzGleHm/afF3LrsyvijViqc2
V/2kQD7OIGfOBfAaWU7XCOGR6lS1Y+ZvZgKDUN5+T5QZwT9Gam17jGd0EDTo6Y4o
re/piJM3VPFZqsCCbxEtQPu0Bu99KpBSadkBBWZvqboPGWygc6IQvx1p8HUbpZWy
R2i/AeGEMl5Z0nuP3JM/+25Ztz8Qgrzo7vEYGZLhRzaKn6R6F25Vracc0E5XJXZj
ktGQo1ajPsD7xvHBy+Cdb/2W6WfaqbelR1xaJyhL+NtNSMrkvPV1WYwppd1PYf29
3NaaQE6fL+aDzNcQEDkLTsTdij0+LwIcSwX3FqEAfW+K5rX0wg8=
=KaQ+
-----END PGP SIGNATURE-----

--GsuyPVfwquOeHea4vILahEpnoeIOpOJxp--

