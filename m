Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F659BC6
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 14:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=OxJcE7584iPhGG94T3T0zc1okkY2fe465VnqrfdAijQ=; b=vEaySJXHbQM2X/FHWnhUITLTxl
	AHeG8nqZCFWmvSAe1GyyAIBk278m9RFywciJs9tvNEbcPPP/bJEDQbW+yOJ1vkIURq9+/F5oWAsLI
	RRw6rAI+BcpllqA69Gu4+t0uFnsTTWJ0BmAs7xDA0HjTWSVhZsjM96NQK2MZDet0H5CnWWVS3F8+K
	l+JBoVkOFMmZsJxDRsCJac88XWUhz9KsNpkQmM3E0S2Ud1lw1g7qg3FncXoNs53VnzqEWu6GUqk7Y
	HypNuMEVtMS5+BtfYOU61YaFVW5ebf1jB5MXMAUL7Eatg4sPftEhnn1W5Va/Si/XFx2zKRgw2M2/h
	Ly1lSVCQ==;
Received: from localhost ([::1]:58392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgqAw-002NHY-SF; Fri, 28 Jun 2019 12:40:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38700) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgqAs-002NHR-QD
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 12:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=OxJcE7584iPhGG94T3T0zc1okkY2fe465VnqrfdAijQ=; b=bcC265Wu0bG672nv6YFilDyu8e
 kdqfJzM4ezva73FxMM8nNlr9yiu2OyDM8QSV6a80/WxihxynrNlPJ6c91dwrRvXUCdzDZFMqzOi/u
 tIwFhw+Yv1rrG9G12TSSLTgWN0bOXg3I4dgGISMxZhVkdc+B3CZ5/y3relvmv85qCssc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgqAl-00012K-VC; Fri, 28 Jun 2019 12:40:12 +0000
Date: Fri, 28 Jun 2019 14:40:10 +0200
To: Uri Simchoni <uri@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
Message-ID: <20190628124010.GC5892@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190628104624.GF32415@samba.org>
 <62bc808700dca7a08f3a61c6d7e676119c301843.camel@samba.org>
 <20190628114651.GB5892@samba.org>
 <d2f00126-4507-23de-df51-d41ee28b639a@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline
In-Reply-To: <d2f00126-4507-23de-df51-d41ee28b639a@samba.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
From: Michael Adam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Adam <obnox@samba.org>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-06-28 at 15:08 +0300, Uri Simchoni via samba-technical wrote:
> On 6/28/19 2:46 PM, Michael Adam via samba-technical wrote:
> >=20
> > Ugh. That's really strange. Is this a gitlab design choice?
> > Because if it is, it's finally a thing (and quite a major one),
> > where gitlab is way worse than github. ;-)
> >=20
>=20
> To be fair, I don't know if GitHub even has CI. What I've seen in  FLOSS
> projects is that they have their Jenkins/Travis instance or something of
> that sort (and who knows how many runners), and each PR would trigger a
> run there, and success/failure would annotate the PR. GitHub just
> provides the webhook.

That is true. CI is always external.
But you typically configure the repo to require those CIs passing
for a PR to become merge-able.

> I do agree with the bottom line though...

And don't get me wrong: I'm not advocating for github here.
I was just comparing with something I know better.
And if we could somehow tie the beefier CI with the core repo
and run it on every MR, that would be great.
But I probably need to read up on gitlab and it's ci etc.

Cheers - Michael

>=20
> Uri.
>=20

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXRYKqAAKCRDJT0k4GE+Q
NBjBAJ9j8Ea719q4PiYuxPHm6f0iS2GDWwCgojEf2GO7FKRjKlulNPrHZvj74Gk=
=Johg
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--

