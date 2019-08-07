Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C68A384EFF
	for <lists+samba-technical@lfdr.de>; Wed,  7 Aug 2019 16:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=kGCCHA7davH/p31BwwesCZe2XUdNb6KzboaE81H0a78=; b=W1z8f269r0H5LFGCDo4xcw+A2L
	cWa3sdtpUwuCByijWtlVKcfQl5aZpnAcf4LWvtGAhOJngc6NaU370eqwJARXGXooZX7t8qCc3dCfV
	FGwJUgOY+XOjLwI9VXETpBtmZNXfx3ZCS08tix3+aQ7MQ0M0K39WYcFA0av/bXDokMyLRX862IziC
	dlWy1fhyDpmAyaMoCUi6NPhjwl9jcMn0HOse65ba3c6DwalJc572eMtBOaOFVbafW/LA1dlAeAp6j
	41lo03rMup1pcOqNW4kFnyukwfuSMyniRpFdqBxZUXSrZcxpIjIFfWQi2hQHzxa/dNpa7y530qndK
	PjkVnkmw==;
Received: from localhost ([::1]:63662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hvNAo-005063-4i; Wed, 07 Aug 2019 14:44:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18556) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvNAj-00505w-1V
 for samba-technical@lists.samba.org; Wed, 07 Aug 2019 14:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=kGCCHA7davH/p31BwwesCZe2XUdNb6KzboaE81H0a78=; b=kajmQTVIrluAMG4K78nxhhRs5M
 MnnPdCVCDGwno5SW2KmwrTo/d7ELGjI3vb9+JTkYkygkg7M5tUXv/pVAVsQiirb+MYWrC3z132oq8
 tsw2b6k/ezQ3WhWlMGga7T0/T5OEEKGn2i4Tdv1V9xQeE0FclINEyV6s91RAfullApxY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvNAi-0003dm-IF; Wed, 07 Aug 2019 14:44:12 +0000
Subject: Re: Samba.org GUI page
To: David Mulder <dmulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <2691e0ab-7c21-c9c2-be47-58e8a869b6c8@suse.com>
 <20190807144005.GA20740@sernet.de>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <154cad52-089c-c93c-ea62-a88b727b475a@samba.org>
Date: Wed, 7 Aug 2019 16:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807144005.GA20740@sernet.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="FOLKh0GVNfzRDHVivEnIhNhDGUg66TzFT"
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
--FOLKh0GVNfzRDHVivEnIhNhDGUg66TzFT
Content-Type: multipart/mixed; boundary="5WGJhjhMf46LtYlYe0R4YUeJZh3xNplyC";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: David Mulder <dmulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <154cad52-089c-c93c-ea62-a88b727b475a@samba.org>
Subject: Re: Samba.org GUI page
References: <2691e0ab-7c21-c9c2-be47-58e8a869b6c8@suse.com>
 <20190807144005.GA20740@sernet.de>
In-Reply-To: <20190807144005.GA20740@sernet.de>

--5WGJhjhMf46LtYlYe0R4YUeJZh3xNplyC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi David,

> On 2019-07-31 at 17:26 +0000 David Mulder via samba-technical sent off:=

>> Could somebody add my admin-tools package to https://www.samba.org/sam=
ba/GUI ? I'm not sure who manages the site.
>>
>> Download URL is https://download.opensuse.org/repositories/home:/dmuld=
er:/YaST:/AppImage/AppImage/admin-tools-latest-x86_64.AppImage

Is this open source? I'm just wondering why you posted a link to a binary=
?

metze



--5WGJhjhMf46LtYlYe0R4YUeJZh3xNplyC--

--FOLKh0GVNfzRDHVivEnIhNhDGUg66TzFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl1K47gACgkQDbX1YShp
vVZ7IBAAwSaeeKqrLNhWjQXcF+fzjdkXWjIRoQ30Nkq7+GPZ6iHK/WFp+Ljm8Bqr
QhOvdTB8NlBhfei3bJHdEK9XAuNf75e4SDXkLUzEcGUT85H2UrOrabEYiH2LOy84
Fb1jaujwtLYTr8Jh2r9BnD6kn3v/Szd4/3MDTtAC0uM9HuriD4MHfjW5h5uMS9o8
QY4cbBeCNrMKftsw1PHZSdsCAM1lRf2FeT/N7Av+eGnXmv1ye807ub6EzajimxPz
oEPJDgrYuul0+QT5/gGOq7tT0YiI/YPO9OMV+bb8o4z72K5JSdkhLBzyaKJBrbOb
y46MENnxvv95xjs7k4IPECTz2Fe7rQDIlYN5LiF3ZtwgTS63YvZN1zJD+Rx7NCLb
yr3vLNXAVr/qQQVBJUSvHgECwqVaU039VUIqamHjgLn7zDwsuulh3DQr9llmVmmI
uObPQRlYoYtfNF0I9xjCXRer64TzZ7nZVzQ1AT7dPoPp3SbrO9usPFcqA7RW4Hzm
uoq92yHVvl+PeVrcpOUo79+PcjmLsbF0o4iqq4NwYgBhwRMWsokA4E9UsViTDJTA
KxY/lRkxo5gkDtT8eQilYhp19EHCOieveZjrgN8FxROgnE1OShJ4yOJdjjJ1+Gkc
Kdg54A2W5IM0E9R0mcP2KYaLq3fyi30kqHGH6ezkfK13yN2JYvc=
=VqTH
-----END PGP SIGNATURE-----

--FOLKh0GVNfzRDHVivEnIhNhDGUg66TzFT--

