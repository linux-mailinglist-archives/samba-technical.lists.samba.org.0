Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B081919DC48
	for <lists+samba-technical@lfdr.de>; Fri,  3 Apr 2020 18:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ohIxoI0ygn55lX2sITk9cTKu78erJk9Z6OZAlV8e/Sw=; b=JG7BU3X82u3b1jS3SlGGVyVOT/
	RMN59SiFuyFZ6RPlVW7mjHm4zd7oCQ0wYlPLgeVV1oom5H2qthjXJKvKnNIuGx3PiWT1jsmSBdT7k
	+9HFiRMAPB2Q/P7z0Sx+CLTaPd9jD4Lcw4bz/RvKRp0X80uxju/xjI2DQeOdnRoPJoP3T0yKfURxu
	EGc/yf2zVp4GSofzPIfpEvO0/nfdr2/WgmOK/k09vq1XcLgvERiJejjP581WA4mHAWk/WvcY93QKd
	Tk0V0X/9tzpdyUz9DhqvIFati2qqFtvBObc868NHrIa9oWjuwfLR55MN4KoFhsTWYD3lw+hNhcUYd
	XuR2gaMg==;
Received: from localhost ([::1]:59044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKPfc-003ETb-G1; Fri, 03 Apr 2020 16:59:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63288) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKPfT-003ES5-Um
 for samba-technical@lists.samba.org; Fri, 03 Apr 2020 16:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=ohIxoI0ygn55lX2sITk9cTKu78erJk9Z6OZAlV8e/Sw=; b=FWAXl+Zgx/B0ZSth6WU1IkeNal
 WmVvp13q7EoIWVAVR/y0eHyiPnzRKbDUdbpj0VGAGgXX8C538Z31YJP5O/0kVIarQFwvMY3RhgKtW
 2sqhySbLmnhrxKwok+yTD9qkEtkTmbbzhNZP2yfAwkVBoBd1dNOLGefz/MOZjtxYsiTxL9wu9eB4v
 vi/BdwzoRWaVhfTW+WMAzgK3MNsI25Jbyeaj1vP/quc2MXjCxYm2F6owfQaWgzlV8uilccH1PRevb
 Q7K1p525KbWmj8HgjfXH27eySN42ibzF4tTdHkasq/EaeU/t1g+1yAjFibHqlf1J0WVUeks5/sMgO
 N48NVUF1YEhUP+YtamqFssjUa3mQTArULgRJHqcaLFiWoSkIIoKnCqvyUp4Dp4EbaR/b09arC/Eht
 XTKEnjvXb/5SUv7+BQlqDcGI/AVL4SXkxMP4sLCWzwZE8oXEclQq4EX4VXfikTPBVqdKlxSiJuOLg
 qOe2tfqoYJcTEaOOkPbgbxzo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKPfM-0004jI-OU; Fri, 03 Apr 2020 16:59:36 +0000
Subject: Re: [slow@samba.org: [SCM] Samba Shared Repository - branch master
 updated]
To: Jeremy Allison <jra@samba.org>, Noel Power <noel.power@suse.com>
References: <20200403164900.GA12127@jeremy-acer>
Message-ID: <1d3d6da0-5e37-2497-002d-93b386648693@samba.org>
Date: Fri, 3 Apr 2020 18:59:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403164900.GA12127@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GECmdGsBjOuFerEemsWBvAI1lpesfTmZN"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GECmdGsBjOuFerEemsWBvAI1lpesfTmZN
Content-Type: multipart/mixed; boundary="ylMefJF3Jei0ITDHbwgcOvaxDoSLmZQse"

--ylMefJF3Jei0ITDHbwgcOvaxDoSLmZQse
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 4/3/20 um 6:49 PM schrieb Jeremy Allison:
> Thanks so much for all your hard work on this Noel,
> and thanks Ralph for all the review hours !
>=20
> It's so great to see this go in finally !

I can say it often and loud enough: woohoo! :)

Noel deserves all the kudos though! Thanks Noel!

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--ylMefJF3Jei0ITDHbwgcOvaxDoSLmZQse--

--GECmdGsBjOuFerEemsWBvAI1lpesfTmZN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl6Ha3cACgkQqh6bcSY5
nkY97BAAs4usyHV3rdYJ0ZF7cbRVeRHEb1ORhspOTmxAG6CE17AltMvUpSG+aqB6
IsYUx2umw0ZINOgLLUXzHtKULjF4Ys+a601HwNi4Ay41Kg36Ipcuhzun86T4m5Qs
/NKsBgUvbO7XCzvhjxCwZ3+y0PqSFjc8uDQUPfbji4i3226Nfkwgfg5c1CnP7lim
1wGsHdP0/6XimYDZb3h68g4ctB4ncnPPGGcjdejl0e9LNSmZoYR0MQtVpvFHF2D3
RTkdKZQ1nhgP0mjvDOhQXqDW8FbX+9oU+J7zIaInLD+9YLTAOlsCesNXgZ+qEqQA
37RxsEkF+ahSJjydByBt1P7ae/v2G46aHUEDyaXyU4Cy1ofp5n08g3guVAHa0r79
bp5WZIgvTTMwmt0ebuGHZ/mFHmQxN3QAVkdeO1pWiiyQI1s7ejZGNLEUDItyMHA5
2yENyLkOgSXQCb3Fvk4U2f4Tru7ADcl83qr1dCHcUDgHPYZiWP/uUpQqyvOpiu6M
b1YG66HxNiNPXTA2JXkwejSGIglLPw5GHsi+SKfWCJdKi8xZm3O7/0pvjqQbiAQV
YKctyiRv5qk06llxK3Uiu3PR+Z9ZanmrxQ2DMWbyPS+zLaFbEZL6aCPCcnGkxLCt
EuDvuScgqJuHvvJIFRVh+B23xPrfH/wZRbyDzIXzGbEN+MbN8cQ=
=2dna
-----END PGP SIGNATURE-----

--GECmdGsBjOuFerEemsWBvAI1lpesfTmZN--

