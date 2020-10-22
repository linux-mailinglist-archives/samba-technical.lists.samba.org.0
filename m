Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC3296266
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 18:12:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=MJhiRLl5YM607qBFKhTszxkWgQ2qeMLc+HeaYjj5EnU=; b=jchp8vet/0tkexCKuWEol+hzJt
	2ycBkujoRTDa5XvI152y7w14Vv4+ZUBhpYmzE4qlToyA1Y812ukKt9Q7gEGv71Swhc1dPl8Gmuon8
	dKZoJpT5OptKJ/TghyLkCexWz53oK5KDEFA6ZaLMN+Z6Xe1rkwCp8lgn5Xi/Zw7vt+GTUdRxONU6A
	mBjrgWeUuDWhhXhGNtd+IlofR2YivdoJlJ2bcxblxTB7NZuy2TqpPzish5F5WSlu2+xuI+Ene4ZFQ
	wDWnLUeQfFsoVKDY4hX1siE7dK6YzoyTb1l4ZwvtctJebga5JceWBfZtBkp9+zDYxOgE8Ajj5jseR
	dOCl7j1A==;
Received: from ip6-localhost ([::1]:22084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVdC6-00DK4s-PM; Thu, 22 Oct 2020 16:12:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12818) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVdC1-00DK4l-T8
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 16:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=MJhiRLl5YM607qBFKhTszxkWgQ2qeMLc+HeaYjj5EnU=; b=pi5nC3xBkBSoVMbGYcMdQC90rk
 1l7W4YAJGZfW/gRb4Kss4Z+0l5yItGMkv4FrknnK/30cDIIjxL7ZXaNlfrpJxa+4SBL6r4sA5NJZs
 fMTfzZso8SSZKcsL983ezTMPJ54vHh2NEJOiCq6y19BdnZEoAxwyoJyYw+/dEiJNtwUIPvYOxPGU7
 4GQS4TbgvPPEpKTL6Ehjlrzq22ljJHcynuv+oB0J3NA2610u8aMFNqgMikO4QxHEWZCFQkZz7hvUs
 TSGPXvBCztE0OdqWJOYua7wz2bIbDWidotVj7Ehagw2+XWpSHSaXxNsC69ZTjRW8PIUBjVZX/pioe
 M8LvByazkhhJgWOm66njLgqUbiEvEZqVb0w8HTZpENWDH8MiBwZiRaAKO0T/AxWhjsD6o2LLJRhjE
 eSqVdqE79De464UozzP1yuHgvq4Dtd5KkgP+ygzlQrV7uZLq7fgjNFuQ5ecMnOKg2xGCjz3F4XF7v
 ikTP5x341CqXOBzF7nMy4EmW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVdBz-0003z0-45; Thu, 22 Oct 2020 16:11:55 +0000
Subject: Re: talloc: Other minor issues/queries
To: Jeremy Allison <jra@samba.org>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
 <20201021183701.GA809738@jeremy-acer>
 <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
 <20201022010855.GA853779@jeremy-acer>
 <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
 <4134ee06-d420-bc29-fd88-78550fa5d23a@samba.org>
 <20201022152645.GA941511@jeremy-acer>
Message-ID: <1cbaea9b-62eb-3496-049d-d9bd06906c81@samba.org>
Date: Thu, 22 Oct 2020 18:11:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201022152645.GA941511@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tzaJo3fGtAaDLgWS6vJ7oPoDtHlFMRcRE"
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
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org,
 Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tzaJo3fGtAaDLgWS6vJ7oPoDtHlFMRcRE
Content-Type: multipart/mixed; boundary="wD08i8IQZaMpRedyZ3esLJxiPy4i8BHbl"

--wD08i8IQZaMpRedyZ3esLJxiPy4i8BHbl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 10/22/20 um 5:26 PM schrieb Jeremy Allison:
> The rest is "blue-sky" thinking IMHO :-).
>=20
> Are you on board with the first two steps Ralph ?

sure, this sounds reasonable. Thanks!

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--wD08i8IQZaMpRedyZ3esLJxiPy4i8BHbl--

--tzaJo3fGtAaDLgWS6vJ7oPoDtHlFMRcRE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl+Rr0oACgkQqh6bcSY5
nkZHihAAlB6h0iGtGcIfpN0grTxO2vV29UpD7TN/K2iMJvQHF/ooSKF4snYpV808
wZkuaxZGrvxwnxhYoRADfFO+AxTvIw+A9u9RLtDmB5j10VcsA/0blsZ63AiYYOad
ZdTEd1UIjWVGwj3fww7DvDK5mtrDXoXSCSvizB2lKssgz/6ztEAX6+ScF1WMKnmi
m9DSTmISF7NWBsvh+scLV06lwDcAEeXwPEkTruaghSo1o95bYG9KiAJ50K7R7f4P
f1WqsINE21L98/zZiO4avAr5Lv4ahah95qRVFNjeTuQ62be62EeQjA5ZHVXmq7Zy
hTJ0BtnwZtM7RjLgHvbrxwrkZqO4uyFXMf+DQwE6u30Xv7AWmhekwqRUSYq8BZLq
3sAw0zwzfEVdu21xw2ZAKlR+CZwwiMf78UNnJ8HQRFbCXn31uRdwQa7er9sdqqsf
PV4BuVOB7q3QFG9C2bCF1tsUQHYepTJDAEc0bRZhgEFkPXyZjw1vmAbhiNtu5eL0
vUUKEcOco58jF/29g4W0PNfd1mGY29+JP/TbaejrWVhbk8GU0FsWSq8hJ3ZaI2jw
Kq+8UzU906B/EuHeo+O/GVtABiPFk4P+JYjNuG0lkOYD+vcNAaFWGO254sbFINqi
Qxi6tH4HtBnRgrDamBCYhRpkBXNn9w92ACGXjpUKLJXaRcOoM+w=
=6mu4
-----END PGP SIGNATURE-----

--tzaJo3fGtAaDLgWS6vJ7oPoDtHlFMRcRE--

