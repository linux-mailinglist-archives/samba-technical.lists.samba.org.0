Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC45F2AD17E
	for <lists+samba-technical@lfdr.de>; Tue, 10 Nov 2020 09:42:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lppjaCLGy/hYGx4kbgZnreEXYDjkYXdwfYp0uhM3g9I=; b=YLJW2XJmGdesAr6V4YM5g2YSHV
	qQzFcBA7gI+4F32ZPSNKuOrLMLbdzP6tCBko3m5309fNOOQ0bNIsOO1xhfo0UGmI1dmyBBOxZROuw
	cvbo6i+nTc8AWgHOKfXQYNUM0k7YK7GQy9v5QZ7KLV4H0Vc91DeGbjCPeRLmG3kKyh+bT8gP35n3V
	jmGm1JBmCaSKN2+aGNc4XHnxgZJ1x5pZGA8/uogeLORjBFFUoKc4M9vle2atbRCruZyMyBYesVVTz
	ukw444S+WGnQ0itotIywrBMcOE8ZE+PcX0c2zPTM3ho/ljGMDxWztIZSygez1SUoiqJorVNHp1koP
	cESVP3Xw==;
Received: from ip6-localhost ([::1]:21948 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kcPET-000dKL-If; Tue, 10 Nov 2020 08:42:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50238) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kcPEO-000dKE-7O
 for samba-technical@lists.samba.org; Tue, 10 Nov 2020 08:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=lppjaCLGy/hYGx4kbgZnreEXYDjkYXdwfYp0uhM3g9I=; b=KitSsIP8iMjfwHATh2GqHoV0wo
 ytCRnrnEkK0TK9gtBZy8c1rj+z9rOz4VpFrlPlHGWJVIEdWwLgyWLJQ0ZFXC++Eie0xVMMzqSeF2K
 pIYm6UkxPuuyXbTXA2J/5cwBLM1YmHjAPdsQwcB3yb/NkwQTi0/YqjfG38Vf7PKn7kOvMOA6vZGzB
 xYJXZYgQOUwYrsxY+k+TdGnb0SPc9CnMmDAwweXHabJLMR0YFBPt42sJb3kGgNuho/n3e5LLaUUpz
 rT3FSyoS4DU4ln6XDaJhafm1fs+FgmtqDo4E8GCxN5DHZjfG2Ykcj+YAtUkR6y5vqF/temGitfyQ4
 gdV9mmoOZzDdLW+jJnxwp7IrHPqOikbWC+dvsEZK2zPEAs5qLB6Qo46cdlB94mrJZ7DuHaj2rwCX3
 ostW4bnZ77bWlj+u4XHSeDe1dtJrMXkCWuBhcHL2OmhgEYBw1vu97RRyTLvqmNoWuJW39G2aPoguu
 4uFtw5XxmW08yycmOwf8LFqV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kcPEN-0002l5-Ir; Tue, 10 Nov 2020 08:42:23 +0000
To: Tom Talpey <tom@talpey.com>, =?UTF-8?Q?Aur=c3=a9lien_Aptel?=
 <aaptel@suse.com>, Steve French <smfrench@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
 <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org> <87r1q3hixr.fsf@suse.com>
 <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
Message-ID: <0b223e01-3c95-15a2-4050-9752a2f9a2ab@samba.org>
Date: Tue, 10 Nov 2020 09:42:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="eLiVE8Mqx5tx10Ho6Z9K4H1jhJ4jZvKnU"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eLiVE8Mqx5tx10Ho6Z9K4H1jhJ4jZvKnU
Content-Type: multipart/mixed; boundary="8IMNyfy208fx1XnbmI1YRQIItrUTDAVUG";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Tom Talpey <tom@talpey.com>, =?UTF-8?Q?Aur=c3=a9lien_Aptel?=
 <aaptel@suse.com>, Steve French <smfrench@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <0b223e01-3c95-15a2-4050-9752a2f9a2ab@samba.org>
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
 <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org> <87r1q3hixr.fsf@suse.com>
 <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>
In-Reply-To: <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>

--8IMNyfy208fx1XnbmI1YRQIItrUTDAVUG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 15.10.20 um 20:15 schrieb Tom Talpey:
> On 10/12/2020 5:50 AM, Aur=C3=A9lien Aptel wrote:
>> Patch LGTM
>>
>> Reviewed-by: Aurelien Aptel <aaptel@suse.com>
>>
>> Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org=
>
>>> This isn't in MS-SMB2 yet.
>>>
>>> Is this AES_128?
>>
>> This is returned in latest Windows Server Insider builds but it's not
>> documented yet.
>>
>> https://www.microsoft.com/en-us/software-download/windowsinsiderprevie=
wserver
>>
>> I've asked dochelp about it during the SDC plugfest and they gave me
>> this:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 The new ContextType is:
>> =C2=A0=C2=A0=C2=A0=C2=A0 SMB2_SIGNING_CAPABILITIES 0x0008
>> =C2=A0=C2=A0=C2=A0=C2=A0 The Data field contains a list of signing alg=
orithms.
>> =C2=A0=C2=A0=C2=A0=C2=A0 =E2=80=A2=C2=A0=C2=A0=C2=A0 It adds a new neg=
otiate context, which enables SMB to decouple signing algorithms from dia=
lects. E.g. if both client and server supports it, a session may use
>> HMAC-SHA256 with SMB 3.1.1.
>> =C2=A0=C2=A0=C2=A0=C2=A0 =E2=80=A2=C2=A0=C2=A0=C2=A0 It adds the AES-G=
MAC algorithm.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 SigningAlgorit=
hmCount (2 bytes): Count of signing algorithms
>> =C2=A0=C2=A0=C2=A0=C2=A0 SigningAlgorithms (variable): An array of Sig=
ningAlgorithmCount 16-bit integer IDs specifying the supported signing al=
gorithms.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 The following =
IDs are assigned:
>> =C2=A0=C2=A0=C2=A0=C2=A0 0 =3D HMAC-SHA256
>> =C2=A0=C2=A0=C2=A0=C2=A0 1 =3D AES-CMAC
>> =C2=A0=C2=A0=C2=A0=C2=A0 2 =3D AES-GMAC
>>
>>
>> I've been CCed in a Microsoft email thread later on and it seems to be=

>> unclear why this was missed/wasn't documented. Maybe this is subject t=
o
>> change so take with a grain of salt.
>=20
> Just curious if you've heard back on this. Insider builds will sometime=
s
> support things that don't make it to the release. Even Preview docs can=

> change. However, AES_GMAC has been on the radar since 2015 (*) so
> perhaps the time has come!
>=20
> I'd suggest wrapping this context and the integrity algs in some kind o=
f
> conditional, in case this is delayed...

Does anyone know how the nonce/iv is constructed for GMAC?
I see a Windows server returning a signed final session setup
(which is a plain SMB2 response without any TRANSFORM-like header).


Also is using AES-128-GCM only with auth_data and no plain/cipher-text th=
e correct way to implement GMAC?

metze


--8IMNyfy208fx1XnbmI1YRQIItrUTDAVUG--

--eLiVE8Mqx5tx10Ho6Z9K4H1jhJ4jZvKnU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl+qUmUACgkQDbX1YShp
vVa/4g//XHKJUfn+i9VfQQQnSnioXqyJh6aNaqbRhMpJy2CMUG6cwQXmoFR0mIO+
GzWGu60IH9HbpVRW5i0+ofMseD2AGhnhZWs9wBNksnepYuF4a0zAqN6F4TebH2LR
UtsJOCborpstekbB6JZG4VWc+k484bfkNraz8xqHpM8M4Nh7x2Ju+bnztULKlwkK
RqVZT4Bd1vllYFtJsf07ClmVkTDA8Syhz/fr0qTavh011TpGzY0aRjKdOSvPX8+b
J19q6Lgb0fkz9yBnGbAIPo6DixqGdaJS18dNzcxxCDEOqJu9Ud62/xF09FApq9Dr
yYmp+zrWGKXlL854IQOqki5/X2bVz0jEb7qzbDx+sSOBCVu1kilbcSpsWcF0O3L4
hXdOflzj+DX63RGzus+3VufA8hcVn70x052X0LOdHSTJxP5YVLl7ufgrZM4sHq5b
ief9qFqLt+iJzdybQVpF8qt+nAkuc412LRH/GKBQiXOAx71AUHYGFjlIkEwrQS/q
13Cp6VCEcMMZqdJII0jWWr5srFaxjT+q+gNOmx1ng3b021Trf5COFI2yk3+oCQT7
V6cxJOhegABIx7ABoHd30U6I0oMyKwK6bF4cBN7wrczgqR7MigfKHzc6weTx0zzF
8iQoqXbEw+iXA/TZ0bKT/0tU6FDCS+RbCw5fB7h1HmEzrOlZxWM=
=qMac
-----END PGP SIGNATURE-----

--eLiVE8Mqx5tx10Ho6Z9K4H1jhJ4jZvKnU--

