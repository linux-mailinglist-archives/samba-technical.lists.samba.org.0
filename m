Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC311CB9F9
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 23:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=LZ66xW2I9urC/fF9i94E8raxGtEDIznD+S6C03JZVaI=; b=bdKeIh6e3MXM4vUq8mBkCYHk2T
	olQzG0MYeVaP3twNST8JUthsme+OkoS/jUd+YJhwadprKD71Mj1w9buxz3l3wXoAXS4LQA9PHfxsN
	MWomIIv9BaSuCinVQFrPlKxg4KSGbhJwCGqAcDoywNyzZfLT2u5yq8YW5YU63Q6PX4eJEyHAZXplV
	eMLNo6hAcKdwjGgvXmBuckOUVTANqoVM/32DhkdXZIW8DIuE5vckF4YMhNoN3wCyUEUs61g/tIMZp
	leNYUzsLLT8knUvT+7ZGosAg98qfMi9WZxjtbZ6EVRtoKl7qnEjW6y4rfe5LiKZo+Ar+w39c8KcAD
	4OMv8MAw==;
Received: from localhost ([::1]:31870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXAjd-003I9A-I6; Fri, 08 May 2020 21:40:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXAjW-003I93-W8
 for samba-technical@lists.samba.org; Fri, 08 May 2020 21:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=LZ66xW2I9urC/fF9i94E8raxGtEDIznD+S6C03JZVaI=; b=z/qHr15mk/dnhCHvVjqvkK7ESc
 6UxSTkJctbBXD6YrcIxkEEnmruqWPltpSEUqh4uiWqJ142ECjG0dT4JdpSlrfVnPsZDcMKw2G4TVM
 rJSR3mJIwOIGfJrGdjSK8D8IaZT1g+meGDyufXlo68boQ9Fcfld/0dFEyw05tycvAyFMzTChv7ZwY
 VAkGul1AshB5TyD2dapcW/7HifJ3mUfDThblDo1tr4bHXTZBet+V531UPSuOgN6O3mteKSTaa2j4o
 tLYRTSA/p/E7/jijFSJR1LUHQhu/IoHChV2smnweINppxnxaokwuiipuhjcC+moYahG92LmDGiPQ3
 QWX18SN0uaPAh4q6pO8yL01Aek2scfdRs4PX90p7bVYoZjEsIvQs4ZwqinN5i0zT3u7M5cq1POezx
 b4T4w8OLXnOJNgGszbby86BwTb8tuTQLmnCtWkAWZURVY1SGdtieVlGXuwqq8bcm9xEKMUqHJUJx5
 CDtQbSY3tyAeKCiHZiZztf4V;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXAjV-0000xV-EZ; Fri, 08 May 2020 21:40:37 +0000
To: Jeremy Allison <jra@samba.org>, Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>
References: <20200507213002.GG14929@jeremy-acer>
 <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer> <20200508205140.GH26399@jeremy-acer>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
Date: Fri, 8 May 2020 23:40:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508205140.GH26399@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="PRICBdjUfm6WNUNcZdvdD7R8e4n2KEASJ"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PRICBdjUfm6WNUNcZdvdD7R8e4n2KEASJ
Content-Type: multipart/mixed; boundary="rdPwaN9zPE8HSSQ7axSz9LeWFFsywisei";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jeremy Allison <jra@samba.org>, Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>
Message-ID: <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <20200507213002.GG14929@jeremy-acer>
 <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer> <20200508205140.GH26399@jeremy-acer>
In-Reply-To: <20200508205140.GH26399@jeremy-acer>

--rdPwaN9zPE8HSSQ7axSz9LeWFFsywisei
Content-Type: multipart/mixed;
 boundary="------------E01AB90891F5E6692436336B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E01AB90891F5E6692436336B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 08.05.20 um 22:51 schrieb Jeremy Allison:
> On Fri, May 08, 2020 at 01:47:09PM -0700, Jeremy Allison via samba-tech=
nical wrote:
>> On Fri, May 08, 2020 at 09:35:31PM +0200, Stefan Metzmacher via samba-=
technical wrote:
>>>
>>> Thanks very much Jeremy! I didn't noticed that.
>>>
>>> I guess the attached patch should be able to fix the recursion.
>>
>> Oh Metze that's *really* ugly :-). I thought about
>> doing that in my code and decided it was in too bad
>> taste to live :-).
>>
>> Is there a cleaner way than putting "busy" and "retry"
>> variables in the config struct ?
>=20
> And a "Goto again" as well :-(. Bleegh.

This version would actually work and looks a bit similar to
your version.

Can you life with that version?

metze


--------------E01AB90891F5E6692436336B
Content-Type: text/plain; charset=UTF-8;
 name="tmp.diff.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="tmp.diff.txt"

RnJvbSBjZTQ2NzQwMGY0MDk4ZDBlZGJlZTk1MzRhNTY2N2MwYjkyNDIyZThmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEu
b3JnPgpEYXRlOiBGcmksIDggTWF5IDIwMjAgMjE6Mjk6NTMgKzAyMDAKU3ViamVjdDogW1BB
VENIXSB2ZnNfaW9fdXJpbmc6IGF2b2lkIHN0YWNrIHJlY3Vyc2lvbiBvZgogdmZzX2lvX3Vy
aW5nX3F1ZXVlX3J1bigpCgpJbnN0ZWFkIHdlIHJlbWVtYmVyIGlmIHJlY3Vyc2lvbiB3YXMg
dHJpZ2dlcmVkIGFuZCBqdW1wIHRvCnRoZSBzdGFydCBvZiB0aGUgZnVuY3Rpb24gYWdhaW4g
ZnJvbSB0aGUgZW5kLgoKVGhpcyBzaG91bGQgbWFrZSBpdCBzYWZlIHRvIGJlIGNhbGxlZCBm
cm9tIHRoZSBjb21wbGV0aW9uX2ZuKCkuCgpCVUc6IGh0dHBzOi8vYnVnemlsbGEuc2FtYmEu
b3JnL3Nob3dfYnVnLmNnaT9pZD0xNDM2MQoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIE1ldHpt
YWNoZXIgPG1ldHplQHNhbWJhLm9yZz4KLS0tCiBzb3VyY2UzL21vZHVsZXMvdmZzX2lvX3Vy
aW5nLmMgfCAyMCArKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zb3VyY2UzL21vZHVs
ZXMvdmZzX2lvX3VyaW5nLmMgYi9zb3VyY2UzL21vZHVsZXMvdmZzX2lvX3VyaW5nLmMKaW5k
ZXggZWUyMzQ0OWM2M2M2Li5kZjQxYzc0YTc5NTMgMTAwNjQ0Ci0tLSBhL3NvdXJjZTMvbW9k
dWxlcy92ZnNfaW9fdXJpbmcuYworKysgYi9zb3VyY2UzL21vZHVsZXMvdmZzX2lvX3VyaW5n
LmMKQEAgLTM0LDYgKzM0LDggQEAgc3RydWN0IHZmc19pb191cmluZ19yZXF1ZXN0Owogc3Ry
dWN0IHZmc19pb191cmluZ19jb25maWcgewogCXN0cnVjdCBpb191cmluZyB1cmluZzsKIAlz
dHJ1Y3QgdGV2ZW50X2ZkICpmZGU7CisJYm9vbCBidXN5OworCWJvb2wgbmVlZF9yZXRyeTsK
IAlzdHJ1Y3QgdmZzX2lvX3VyaW5nX3JlcXVlc3QgKnF1ZXVlOwogCXN0cnVjdCB2ZnNfaW9f
dXJpbmdfcmVxdWVzdCAqcGVuZGluZzsKIH07CkBAIC0yMjIsNyArMjI0LDcgQEAgc3RhdGlj
IGludCB2ZnNfaW9fdXJpbmdfY29ubmVjdCh2ZnNfaGFuZGxlX3N0cnVjdCAqaGFuZGxlLCBj
b25zdCBjaGFyICpzZXJ2aWNlLAogCXJldHVybiAwOwogfQogCi1zdGF0aWMgdm9pZCB2ZnNf
aW9fdXJpbmdfcXVldWVfcnVuKHN0cnVjdCB2ZnNfaW9fdXJpbmdfY29uZmlnICpjb25maWcp
CitzdGF0aWMgdm9pZCBfdmZzX2lvX3VyaW5nX3F1ZXVlX3J1bihzdHJ1Y3QgdmZzX2lvX3Vy
aW5nX2NvbmZpZyAqY29uZmlnKQogewogCXN0cnVjdCB2ZnNfaW9fdXJpbmdfcmVxdWVzdCAq
Y3VyID0gTlVMTCwgKm5leHQgPSBOVUxMOwogCXN0cnVjdCBpb191cmluZ19jcWUgKmNxZSA9
IE5VTEw7CkBAIC0yODAsNiArMjgyLDIyIEBAIHN0YXRpYyB2b2lkIHZmc19pb191cmluZ19x
dWV1ZV9ydW4oc3RydWN0IHZmc19pb191cmluZ19jb25maWcgKmNvbmZpZykKIAlpb191cmlu
Z19jcV9hZHZhbmNlKCZjb25maWctPnVyaW5nLCBucik7CiB9CiAKK3N0YXRpYyB2b2lkIHZm
c19pb191cmluZ19xdWV1ZV9ydW4oc3RydWN0IHZmc19pb191cmluZ19jb25maWcgKmNvbmZp
ZykKK3sKKwlpZiAoY29uZmlnLT5idXN5KSB7CisJCWNvbmZpZy0+bmVlZF9yZXRyeSA9IHRy
dWU7CisJCXJldHVybjsKKwl9CisJY29uZmlnLT5idXN5ID0gdHJ1ZTsKKworCWRvIHsKKwkJ
Y29uZmlnLT5uZWVkX3JldHJ5ID0gZmFsc2U7CisJCV92ZnNfaW9fdXJpbmdfcXVldWVfcnVu
KGNvbmZpZyk7CisJfSB3aGlsZSAoY29uZmlnLT5uZWVkX3JldHJ5KTsKKworCWNvbmZpZy0+
YnVzeSA9IGZhbHNlOworfQorCiBzdGF0aWMgdm9pZCB2ZnNfaW9fdXJpbmdfZmRfaGFuZGxl
cihzdHJ1Y3QgdGV2ZW50X2NvbnRleHQgKmV2LAogCQkJCSAgICBzdHJ1Y3QgdGV2ZW50X2Zk
ICpmZGUsCiAJCQkJICAgIHVpbnQxNl90IGZsYWdzLAotLSAKMi4xNy4xCgo=
--------------E01AB90891F5E6692436336B--

--rdPwaN9zPE8HSSQ7axSz9LeWFFsywisei--

--PRICBdjUfm6WNUNcZdvdD7R8e4n2KEASJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl610c4ACgkQDbX1YShp
vVYHNA//SGfWuWvIz8IcbWjQTARaRfFr+Tfhl5wX3EXjK8fod4Zlc29/qWiMGDFG
t2Tp+TY03k8+gDChcpKiXSayqpLGunb9orUKNZnwMf19or56lzt7FPpNreMDvG0d
MwtAjkw7avqCufT99bMY+zhYrPRvIBMB27iCTaB7MhBnTnCeRJs+u/2p9zxIdh6U
3N8dcfiQDUoPpNCAzDJjX9xrO0Ua4ytJ4THCmyrqvPZhVEFXnnZWDDanT7cGBvw1
pYQhO7WvlSDGXG3HfLMK8SuisQTwlMdgy9FfBEqmC2qb1Hq8D6/wcJO/U905UsaD
mUaVz5bzVLhPXPDfRSays7UnS7arlmkty7ML3N0RQmS5ojJ76dAy7GqMyEFBQPxQ
pE8twSnAMSjNtT3bM9M3O/v731kwkT0tFFY9D9QKHnCc62Wovff13AlXMgwUpZHq
uMep2ho7/0G8ZLhp+m8JgvE2K8OQJtBIE2C1r2k+YAWHZ5pXHEKy26T5CdKomdoO
g+hTCmxiFMefxu97jTVCR8jo/eD48XFptWWdWs9oxrWnj63r8Xera8kv461ZgzqT
eJ48T5NIIO6ThN+3TJWSTBssgxhwKRHh+JpOp0eBbzAm+5/bdXJd0lAOlZIKu7GM
Gn28JEVrDi0FJYbIUfmfzVOTzdeJ84+C6H+cLlMPPxvFrNTpI2A=
=ae65
-----END PGP SIGNATURE-----

--PRICBdjUfm6WNUNcZdvdD7R8e4n2KEASJ--

