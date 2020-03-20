Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E772318CB60
	for <lists+samba-technical@lfdr.de>; Fri, 20 Mar 2020 11:20:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WVl0FKgB7rU9y9zgPh5U3iOu4euwYASaIhXNb87x8IA=; b=S89NEyUKUnxYYaHaFNWHcjsC3r
	yW3CG53ytAOL4DbilOYLblrhsqjYJK3xIpic1FTWVmKriGrEcZH+ysBzcOF0ixpOuaWY3o+xsjvam
	//7RxHaKbfBWYoWVU5pe44V+N2Ix4BQ2YpO4Ps5xk0Bmr7J3yoabsmjT3mqP9AFygwf9ZTRjMWXEx
	dUcc7+XrncKwK3BnttWEUWYRBJjKKlhk43FdYEIUeTg+pEn53RXnH3yZcIysdn3ziv8iyoWbhHTav
	d6abL9F/TPfy9scBv3yIWlWQRavt57wMo0LO4ZYg85pzysRWzWhFlg8APP4le5xCJenM1txukrPAm
	Bpayb3Zw==;
Received: from localhost ([::1]:40202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jFEks-000H07-Op; Fri, 20 Mar 2020 10:19:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12214) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFEkn-000H00-2i
 for samba-technical@lists.samba.org; Fri, 20 Mar 2020 10:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=WVl0FKgB7rU9y9zgPh5U3iOu4euwYASaIhXNb87x8IA=; b=WUA+csx11e6YNOqp6336UvPZqV
 GdvjPGtmGOlMCG5x9JiR/7VUfTM6s6fWt3EXX320WXH4tgIFAcXcVlF/aZFHUx40+Vs9pDFvtRW9G
 ad0mV2J0DL8GilzveY+H1MfG2nXpa79gAebBe6JYcukGvDoC7XS+HpMKOtrEnY9zvygVMWW9rSGNx
 6arXCOjFUTnhEHoWNqgCO/d/FDv8ELLUHOBk0dRUpgBZQII/VSjSiI4Q2iH0ImmJxJaZAUhu7HE7J
 seuM0dnT0E2UNnEbTuNlVK0mpl0RY8BU8eLCJeFrHMYhBciQAHUJQcUvSFuBFu8chh/PoTfZAOSiY
 7NU2A9CKbY+VN/OaOyQIyJFcvUMiNKjMdYZVn3zHtEuO8NU5hN3Wi82+SjlETEWK0aWX7OqzFGApc
 yu0Ter7gFkKvLP5/MhRqMPXtvKoa4ryoQGfm7FXTUwFcBjmzR8m3rLM8fEeAMeKrsFRRk/DhjtMfQ
 kOvlokGMKnAUUniAEc55xjCK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFEkm-0006HK-Et; Fri, 20 Mar 2020 10:19:48 +0000
To: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Subject: Linux Mint 4.15 Kernel and NTLMv2 account lockout with empty string
 password.
Message-ID: <a3921636-89bb-e184-1dc5-fd8d224b55fe@samba.org>
Date: Fri, 20 Mar 2020 11:19:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="s611RQI6hRjbG7k0AGw765nqo7LP9VzC6"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--s611RQI6hRjbG7k0AGw765nqo7LP9VzC6
Content-Type: multipart/mixed; boundary="thRxZ9SC7v8LNCRGZjJS4V2fovHfw19hw";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <a3921636-89bb-e184-1dc5-fd8d224b55fe@samba.org>
Subject: Linux Mint 4.15 Kernel and NTLMv2 account lockout with empty string
 password.

--thRxZ9SC7v8LNCRGZjJS4V2fovHfw19hw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I recently noticed the following problem with a 4.15 Kernel
on Linux Mint:

/etc/fstab has something like this:

> //172.31.9.132/share1           /media/cifs/share1      cifs vers=3D1.0=
,credentials=3D/media/cifs/cifsmount.creds.txt 0 1
> //172.31.9.132/share2           /media/cifs/share2      cifs vers=3D1.0=
,credentials=3D/media/cifs/cifsmount.creds.txt 0 1
> //172.31.9.132/share3           /media/cifs/share3      cifs vers=3D1.0=
,credentials=3D/media/cifs/cifsmount.creds.txt 0 1
> //172.31.9.132/share4           /media/cifs/share4      cifs vers=3D1.0=
,credentials=3D/media/cifs/cifsmount.creds.txt 0 1

172.31.9.132 is a Windows Server in a Domain with Samba AD-DCs.

The initial mounting works fine, but after some time Samba
logs WRONG_PASSWORD and finally ACCOUNT_LOCKED_OUT.

=46rom various clients this happens about once per hour!

In order to debug this I extended wireshark.
wireshark was already able to decrypt NTLMSSP encryption
when an NTLMSSP password and/or a keytab is provided.
I extended that in order add some useful expert info
that shows which NTHASH was used for a given authentication.
That is also available with an Schannel encrypted Netr_LogonSamLogon*
call. This landed in wiresharks master branch a few days ago.

The customers capture didn't show that information,
which meant that the client used a wrong password
when it got LOGON_FAILURE from the Windows fileserver
(because that got WRONG_PASSWORD or ACCOUNT_LOCKED_OUT
from the AD-DC).

I cross checked that with smbclient and there wireshark
showed the correct password was used.

This is very strange and I had the idea to just check
if maybe an empty string password was used by the client.
So I created a keytab with the NTHASH of an empty string.
And wireshark showed that this NTHASH was actually used...

Has anybody seen this before? We'll retry this with a newer
kernel next week...

Otherwise any idea how to debug that?

metze


--thRxZ9SC7v8LNCRGZjJS4V2fovHfw19hw--

--s611RQI6hRjbG7k0AGw765nqo7LP9VzC6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl50mMAACgkQDbX1YShp
vVZ8Xg/8C9jxFPlCcfhWmQFSjv+8DQy7wOiix2rb7T364JYDPxoh72RhmxP1QrVB
q4M227AvTzqerweRR4eHJBIbVxpKMfFlIv6SP4cwj6jCdjY1NpJ8f6WXlYH0YaHY
K9mSdNj5k0Jbo1VeGxx4uW/sxMnnt9REYUzYWu5S4L6t8bCf9spbo+dpsPcbBjh3
eAjY4dYKXX3K8R9Z5isirFAV2BwzhsF0zSLMFJMssAe6QO9ZHiY1kb2YD4nIiXqK
tROUocXQRcQOVTf4zJVrBcrjE0FJB2mZOxldESRG+/Fr8ZR22htdbEGnD3fdf56/
XfuQxXYJkiVfw+g71cRjpyaZvowrrvK0g7BevcadaS9AyQEr7RTA5bbxFwURX+iY
7oIK9pEbxrG5dgUAZxhwEiTaPqgeo2OA0I4u0tFk63IaYKAtJS+RZrnyRGv8puQh
UyTBEKQqXDfyUhKNmsiy4B+6+9y8v1WcJsy+5Uc/llwt9ln3A/Ya+zxMtJM1rQIy
CzDe0RyNIgnGlOoqZbi5NNHD2bgkwoOHxS2Ar5nuQiPJb2dJUgkwWjgnRrHFf+Qw
Behn7Ef/y/NDTR5qjOP0MztbWlM5x9ZVz8TTPh86FfxLH78odywkRUCEQ/Sn/NdQ
PCkyTriVkQlHjFwO3cPXzygI2qq97KC+1xOAetytzRtylU1yF1E=
=2JDL
-----END PGP SIGNATURE-----

--s611RQI6hRjbG7k0AGw765nqo7LP9VzC6--

