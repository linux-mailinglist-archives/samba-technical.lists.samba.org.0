Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE511E4E0D
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 21:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=bnlwJ1TjgL0NjZVLSVIkq/IBtw5G74xtvqRdeuSOtz8=; b=mHR6YFJLk916xWV0Y5tgYYtLAz
	v/oRtJCGU/Z8U3xnPlWIIyBNVQyFrFBONAJnuf7asEoei/4imBmay6gHSrIAtQsHdfPYiqEzf9bvX
	XHInulbm3DQRVRHxyu4nHYKLwoGWH+ftK1khbRtqoq/Q6WhpsylEOS2mnwkkQ0Q3zNNV+VZmwOWrb
	VgzygLY/xL7fr6X12/I03rj63fVgrPfXmNmGDKszg2zlrlmd50dsAc2GQU5GuhyZA+YOgAZJWsaL8
	D1+/cdRZR2b5mAFCqQst22LmVT7sLuusptMe5GgD7Z0YNwomjTIIfCe2bq41Dnst2zlbfQAy2boJh
	/85lkBjw==;
Received: from localhost ([::1]:64228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je1b9-0065BT-1X; Wed, 27 May 2020 19:20:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36016) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je1aw-0065BL-RS
 for samba-technical@lists.samba.org; Wed, 27 May 2020 19:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=bnlwJ1TjgL0NjZVLSVIkq/IBtw5G74xtvqRdeuSOtz8=; b=evxRGGnq3+ACa+bBnBLZFipuAJ
 EAupPHKPdBhYa1IZwRRn74dw/6k6cRmRhzUJ//uX38xEkLI70dWatPu49CFSKKlYF3mekFlJXPf9e
 WT7xuW07x5zC3YTtzUCOq0YyoBNoRpRZrdCOsLjk/AFda0j7YhG9z0S92lZpudktWSyj/ewu+cb2j
 96GU+z5V59scBY8NuQRb0MKfzb+PEw2cevbv79nbAP/x9cqGV1hWXYTu1wKZ6FisOq+ddNg1xFYli
 DOeNKHfgzL4bR7Ud+j7ZkB7jkvqlgJ4EG7LW9gJJXXDQIw7PPxnytiGx0KiYBJx1ihowQDlVs9N2E
 4VRyloiVcaI/lUiBZk0UdbBe3xT8hilB/eC4zwBchYsksUr0ql+ktckl9jo2IVzDC151GPger7wlt
 IYML8h7hGQ4sFpHuzPefwvOJT6nRwUYWcXQ397/CWekmrdpTyneWCPPLK5+09mqSwIWBV2z6OWKUq
 e8ykyACxA8NRynd+bwkTDjZb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je1av-0001y2-Pu; Wed, 27 May 2020 19:20:06 +0000
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
Subject: Re: Kerberos features talk at sambaxp
Message-ID: <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
Date: Wed, 27 May 2020 21:19:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="FZwPUA7aD4w407y500hO8M8rtslVie5fK"
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
--FZwPUA7aD4w407y500hO8M8rtslVie5fK
Content-Type: multipart/mixed; boundary="DZZNYlf3ueOP42xxcTSqXKA39zPY3wik3";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
Subject: Re: Kerberos features talk at sambaxp
References: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
In-Reply-To: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>

--DZZNYlf3ueOP42xxcTSqXKA39zPY3wik3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Isaac,

> Thanks for the talk was great, can't wait for the slides :)

Thanks! I'm sorry not to finish in time:-(

I may be able to complete the recording to the end for the archives.

StefanMetzmacher_sambaxp2020_Modern_Kerberos-rev0-compact.pdf
can be found under:
> https://www.samba.org/~metze/presentations/2020/SambaXP/

Also checkout the latest wireshark!
> I don't recall a problem with the enterprise principals in old
> S4U2Self padata, but I mostly test MIT client, I'll give it a try.

I'm also not 100% sure, but I thought you told me about it:-)

I think the difference is also the client principal in the referral
tickets on the way back.

metze


--DZZNYlf3ueOP42xxcTSqXKA39zPY3wik3--

--FZwPUA7aD4w407y500hO8M8rtslVie5fK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl7OvWIACgkQDbX1YShp
vVZpzw/7Bpz7ODYnDnzRU2ri41F+rU2f1ragjX/GAWimfIh4AWDZELPx4nEH/mok
Vc76VeuTZz3ShiGLbTJoonh4fvVWdCyeQcKBNuQOrdXjS6ppYCrcTujnNxtmt0+g
/4bVInkhDrD2daj9krs47k2VrW/BHyeB7xmuoLDH4VSmrQBISgf0QosFO4cXUEd2
aqC84ylt+djvNEJrGGCvMykZ6tHl1cQGnL9uiT3LsgZtS8dhZAUCA2jYfNrlZFw7
4fJHN4rmkK1Bn6zIZj9cGbqHCx8bnLnneEAZnGagcvfa/pDXGqT9eQ9mvxF7I6xP
S/bI+6fkVxkA9c/GtJgjPEKnRBplJBbfHG2LdaeHrHGGR0/2r3oHiJiTDbr0WHiA
2bp+sEQAwh47TbbDXJGQl2pDjJlcRY11hTkvHZtRjdfO+VEkZTaEecOVt7q0weoO
dTMr5X/3Lp+RvwWn8zp+mbPnt8s9XVITQg6WX1KYGYSQxx1tMtXoEQUztGEKbcHu
ugVkezqvxw7Sqyy3Alx9P622mjzz3x09+JdT0T7HE1OeTPLMKuBLZDhY8lw5XjJn
NSn7DCnCk69bg7LKSj/l3aCpc0VdMqAOhatOfGxXkfsoEHD83cpr7LThFUsVnwcX
Fu0rGAGSZlWwayY0Dho9Oh4Hu2i732c+lfZ+8JIANCfoDyxXqnU=
=VNe0
-----END PGP SIGNATURE-----

--FZwPUA7aD4w407y500hO8M8rtslVie5fK--

