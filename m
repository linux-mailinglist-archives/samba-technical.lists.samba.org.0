Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A03599E3
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 11:54:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=P8tN+EBkH5iG5+HdGWmU7NhE7e3OELAM4KEPBNvaAeU=; b=13tYPnE8AHBFHGWILJGxXnW7NV
	lYBrEI4lhOOYizfwMF/BigDahUadJvinhJ+c4mNer4pOSlY33VmNRF9QGIyvV5BrVDRwqcdfBz664
	p+fuUKgO2bPEaYVqk3631e4R/3JE3WIIKx7wWJUuVAhyE0tiB9mXKxQ0yVm30bxOn/KGaLUe6l/iv
	9Y3vtRS9PY60dqGtoDcGRea9SNBj8P2St6XvlpAZVtWmLHf8fS1HTWJ1MLid8OqJfHHd8XQSGCiG/
	z89b3W7RqezV0gxIhjz5q5bojszksylQLkIKnu5mBSZesQwADRJ0mj4qK0+rYynwEbbLfGbw5KNAF
	zwg8zm+A==;
Received: from ip6-localhost ([::1]:58960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUnq8-00AdWg-Ko; Fri, 09 Apr 2021 09:54:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29886) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUnq3-00AdWY-9b
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 09:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=P8tN+EBkH5iG5+HdGWmU7NhE7e3OELAM4KEPBNvaAeU=; b=17ZkQBgfWjNmQuzdaDYZIRkg7I
 yuC1BSyZ9EvlZf97MCvLu6aC+LKoGw6h2KWNcuGKNk1JBmhUKKTQ0kv99CScEcFE4mRLxVzp8A+Z7
 4yYHrGRzxiVeTt6NR/z7F1ZmQeYlCSmQoKyI3kaw3RV7tI/8D3MO3JdlrZBoIjjIXmBhZ3yLRTRCu
 dIce2SfOEKQepXCDPseBZiygzV+9+x3xD/D9ubsWaqzKxlepMiHlR72lQ2AnSZdJFkrMUScCJhdqj
 JL3oCV58ortZInqxY8/9PgnJ26E9WzNPR4qrPWJayGP7McxdUaI1VWIEVek0WY54s7xa6Z3nPp09Y
 zdi3RBOQN/13UkNAIoUWpEQXXEgiIdxZ59xTHiXOzAXJPTIfCf3bE1HayIecoqYguicjzpog9IOJD
 sLveDSc024j2OupmH5/p6B+V4BACa5p9SuIadwzi5mz6dlyb+nGaMf/+MajGLm04yyH2ie9IelMdq
 lvwPP1+XYfUbKPZ4tZiUGNJP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUnq1-0001J6-JE; Fri, 09 Apr 2021 09:54:05 +0000
Subject: Re: Setting up QtCreator for Samba development
To: =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>,
 Igor Chudov <nir@basealt.ru>, samba-technical@lists.samba.org
References: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
 <bc0db8d3-f6c5-103d-3193-9f687f94c434@samba.org> <874kgf4xku.fsf@suse.com>
Message-ID: <732d6001-c29e-5df8-77a3-df8d8b46b4d2@samba.org>
Date: Fri, 9 Apr 2021 11:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <874kgf4xku.fsf@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FUbhTSN9XV7gqppT58dWV3Nv0nvJ5GTO3"
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
--FUbhTSN9XV7gqppT58dWV3Nv0nvJ5GTO3
Content-Type: multipart/mixed; boundary="zE5d1dMykGCbPrGxROz5GYIBKMFTzxhil";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>,
 Igor Chudov <nir@basealt.ru>, samba-technical@lists.samba.org
Message-ID: <732d6001-c29e-5df8-77a3-df8d8b46b4d2@samba.org>
Subject: Re: Setting up QtCreator for Samba development
References: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
 <bc0db8d3-f6c5-103d-3193-9f687f94c434@samba.org> <874kgf4xku.fsf@suse.com>
In-Reply-To: <874kgf4xku.fsf@suse.com>

--zE5d1dMykGCbPrGxROz5GYIBKMFTzxhil
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 4/9/21 um 11:27 AM schrieb Aur=C3=A9lien Aptel:
> Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
> writes:
>> if you're open for other IDEs, I've recently looked at Visual Studio
>> Code on Linux and that looked amazing. I was just about to dump my Ema=
cs
>> setup and switch but then mehhhh! :)
>=20
> You have to resist the lure of the dark side ralph :)

it was tempting, especially after installing

<https://marketplace.visualstudio.com/items?itemName=3Dtuttieee.emacs-mcx=
>

> But seriously, what did you find particularly amazing? Does it come
> builtin with good C parsing/analysis/xref?

YES, YES, YES! Out-of-the-box usable code completion in the Samba code=20
base. Functions, structs, macros, everything just worked what in my=20
Emacs setup works for a few weeks and then breaks again for some reason=20
after updating one component or another.

The biggest showstopper was: it's just BIG and offers A LOT, so getting=20
to know it would take me too much time. But this is really the first IDE =

that looks capabable of rivaling Emacs.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--zE5d1dMykGCbPrGxROz5GYIBKMFTzxhil--

--FUbhTSN9XV7gqppT58dWV3Nv0nvJ5GTO3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmBwJDwFAwAAAAAACgkQqh6bcSY5nkZ6
dRAAuJpD9rFVA0ZWg7X+LnKvnGt2DhSA/i3uKPJ/8jTDw1L8UXTxvrIoyN2nkDshwfJ2Cb+WrZb5
Vxrt/Mgb3t2RrV0RcSLdN08jhT7Zm9BMrfg1KBhLFVhcn1BvWZmhgvAsl8618CbWuyysBx60YFUq
dM6M3elqHOu9Cuq0dmMZ6HqqIRlBeIMP0CL2CXPObGnAGMXVgNR2QYtvi7eMrTj6Pb+IAlO4amtm
hm6+Zy/NqQ/nPNtDojgBY9Szpxr0GmBUlfTpzUShoaD7gF58CVRnK5l7rcaBApTS9sVl1jTeGQap
o1qOP8gdgPDq25ZGYaiJW0o0esdcedegNQfvNovxsvRvqCyEUDy1hyra0LWnqGWU8gIkMk0aA664
pyu+SlqnYdTXip01wCJWPtg48mbcQGqs0Ilk+cWPyKJXWoji5NGul24PoSDl5RMYwMP4NES3EYdo
s6dkSj+J1W8auMjEFRcIwpHT5usDytBF6iUuevVNrLvsy6/I1/mqiD88ki1LLen07kkwFA6rxv9e
pEWl51SWoNY5QGXux2y91LQm9xGFK/YrKkzNtslkyy+5BaQtjcY7rseKOeFqIsc/KImFerXHcOZO
pY+CdusmYyvugXmiYvyInajAOiwaFRKb3MbYQl6rDHuNnQ4YDOaphsYqRUZ+bxRJNsiFpiwy0zrY
brM=
=obCj
-----END PGP SIGNATURE-----

--FUbhTSN9XV7gqppT58dWV3Nv0nvJ5GTO3--

