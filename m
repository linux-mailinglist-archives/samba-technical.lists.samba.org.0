Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B0A9A09
	for <lists+samba-technical@lfdr.de>; Thu,  5 Sep 2019 07:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=cD2vc1FKMFQaI35RMl2PBEFolxNETL0pFAIjiLUVwlg=; b=pxMTTn4gsurspACNaZ5tzk7Ecf
	S/+lo3lZu6b8ENctiXPwWq+n9BNNXeatnAWq0rU2la3h7/3EoWbI7+BV7suvg5RVM2ohTELcuBXYG
	6hc1mG49v3O1+ncbwKrv3yYwDIX5uBnbVc7A6p3TtZRFjTcsMBJOoQ6PfvS8psoc5Rey2Ro53C18e
	EDQnUouwlKuLpfSnG0MOiTOmrLiC1xRWgvc0C6XLlIdY3fMkll9dBGoGjPOPqUQvff5llo0uOkoRN
	bQAcVyTuPZICs5hF54MnXT0gL1rWKGRzQp/l5N0+KYHCQ3XGLJ8of9zC8zyWesn+y0qNVR65aUk0L
	bZqvz8ng==;
Received: from localhost ([::1]:58740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5kD4-003Wx6-44; Thu, 05 Sep 2019 05:21:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17052) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5kCz-003Wwz-4R
 for samba-technical@lists.samba.org; Thu, 05 Sep 2019 05:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=cD2vc1FKMFQaI35RMl2PBEFolxNETL0pFAIjiLUVwlg=; b=IflLB5nYZ8wNv4sWPSIuioc1dZ
 2k9otxMvBENtWmbD2hCTlQyUhhnbKIvI/UXcgR0e4Q4g3yIn5a565kMofqFHXdMvhM0/DN7lMTbRj
 fDvWtQYZFkNXSdKzFQR68VtL0ozokiKO4vicAAjow4C2rqI8eTCRkfEMbG5l7dgvKExc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5kCv-0006Zi-Qg; Thu, 05 Sep 2019 05:21:22 +0000
Message-ID: <1567660854.20732.0.camel@samba.org>
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for 4.11?
To: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>
Date: Thu, 05 Sep 2019 17:20:54 +1200
In-Reply-To: <827f8bfd-22c9-7305-228c-9230d6fa3960@samba.org>
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
 <e5796781-277a-5e10-cd55-0322f42783d7@samba.org>
 <20190904155450.GA162682@jra4>
 <43fda24acfc63961446586339798f9d7801601bf.camel@samba.org>
 <827f8bfd-22c9-7305-228c-9230d6fa3960@samba.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-rmnnWlpHILpe6wxteFE/"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-rmnnWlpHILpe6wxteFE/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-09-05 at 06:21 +0200, Stefan Metzmacher wrote:
> Hi Andrew,
>=20
> > > +1 on deprecate lanman auth and ntlmv1, but we can't
> > > remove I think until SMB1 is removed.
> >=20
> > OK, sorry for my late-night patch non-attachment.  I think my mail
> > client even prompted me!  Oops.
> >=20
> > I'll write up something similar for lanman auth.  NTLMv1 will be with
> > us a long time due to MSCHAPv2 sadly, but I'll see about some stern
> > words.
> >=20
> > Thanks for the support.  I agree actually decisions come a long time
> > later, after we asses the feedback.  We might not even hear from real
> > users before 4.12 branches off given how long it takes folks to
> > actually start using new Samba versions.=20
>=20
> Can you do the same for the client side parameters?

See https://gitlab.com/samba-team/samba/merge_requests/770

There may be more, but this is most of the weak authentication
parameters.=20

Andrew Bartlett
--=20
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT  =20
https://catalyst.net.nz/services/samba




--=-rmnnWlpHILpe6wxteFE/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQJHBAABCgAxFiEEgWCb+FN1ul5RDM6h/gAdRMgCGGUFAl1wmzYTHGFiYXJ0bGV0
QHNhbWJhLm9yZwAKCRD+AB1EyAIYZZo5D/9NFYnEWNFxT0jmVkqWZoPP1CY28UCM
jrVXAXjTxPtx/9+e5njv0V2UYXhQQ2fuRnUhl7bDoWNx36yVC+9qdtOb9u0e6bmq
rvL7XtXMpGAqXMGoukGYuaP45Zts9N4dbrBBpBXYLezVIjz10X5pOvjxQIoYplKX
v28AuToa89C++zf3+1etZJQl0N4tpKR7LRJLLicF6yEGnlonSvRhDFAahx3HEg/7
B+QCQ/tSx4tYlFz5Rx+bSvGw+XLlmsanR6RWgjHk99Q9LDksmGq35tb4F1Z6uCC2
r60FwX950Hwek8tc2up8Os+/Hc1nNjjcQEsTgNax9AHSj7YkcZnY/DOSwTsbJjLp
8OPINh4SPHxDGzV5NlKJY5TS1zlb+VoZRaqh3hAfRBMzrWihZeVTr7b75Jq0Oxpc
/spvB3zQbOiExocbUtCk50lSC3avVCAT2M976Byinvpic61LXHFqIShHnutGTMgd
1nVIh/xFsLB6sfCbblMpGJ24q6CrUhjNcA8jTAupdyPiqZBh2TGQLFs8pYlDLC1v
McopAPyBwE9I9c69GOhIWh7b3mNnN/osPqlfkwF3kZNY9tdfhJY6mtRjTOmYGCtl
NkLIFI1SKiK+X7Oj+srTX+ED7VL1J16oYGCXjigBJEHh6h+9QlEDJBCv/lKqipGu
nBWWS9gRAkLquQ==
=DIZI
-----END PGP SIGNATURE-----

--=-rmnnWlpHILpe6wxteFE/--


