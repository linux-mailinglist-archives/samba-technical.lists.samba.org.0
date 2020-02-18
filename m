Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A18162B04
	for <lists+samba-technical@lfdr.de>; Tue, 18 Feb 2020 17:48:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Xqta4k8kgeaUfoUTkJPD8Y1TnadvUiw1oFut9hzkzPM=; b=CRLkeIgM/hA7o00VDZ/uAO8ovQ
	HQEozcIvBWG8h82hhzgnMmGRwfI7MM8F+VwHli6hoEEzxbsjwYQz3ivrADzSlNUkLuuopz1My8syJ
	cEMSqG5G5q8MTY2adHgUx2cdVBdRTVOSCeSd5hZDZICKk+TsdVf7WIPdHdR2IBQNwsmXmVw882QyD
	LVp44I5lnUsWtYJGVBcpq53Oc2pHwD3X50pjSRS1SDIdh6soY5jv9kcJvnvo/L5VPKKLwCaJGAFzg
	13Ws/n7SOwfSC0FxrlMyWDuc4WLxS9YhjqFdT8+euHuFpXZVqX73EERSIoeuRh38MxYIIb8DuQMZc
	17+yIJ1w==;
Received: from localhost ([::1]:64346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j462Y-00APGR-Gj; Tue, 18 Feb 2020 16:48:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40396) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j462T-00APGJ-P1
 for samba-technical@lists.samba.org; Tue, 18 Feb 2020 16:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Xqta4k8kgeaUfoUTkJPD8Y1TnadvUiw1oFut9hzkzPM=; b=UA00+TJI8kI+08MTqB0V48nzMv
 YYIYROdLpoyAcV/NIuNmix7K0hFEe3tfHaVFZ51t+aqGwUOB7J+oU9a21HRcwcNOk2dPiKLgNw+3y
 vmfsA7Ce3/o7wrVWtt/rDQNzuwwRUuWLpYUxqa7/wzYfP9VZwBH2xF+jf0VbNCOfB7hT4wCfuGMGn
 FtKs6gWP/2bfYLzvnQd1Yvpi6ehACT+Z6BQk6HGhNimf6kRL77kiBJQLN8kjffwMWGDyec+3PPXG0
 2j+Yt8QP0o5L0LcqlQnX8V+eU4yjwtV99QQQ1y6T86aVXqiDYOWAfug1Ey2IuIQhihNrU9numtkPG
 Iysfwjkbc+wGI+c6lbx/LssXs5RCJx7sHsARgj9N9WfwEVBdgNODVTZVv5cRumym70bkGyQeqelAo
 iCCTmfyI/Q56v153idPrC/fJ5V4rXE1XhNNWW98XG7nkYwsAJBjJ8tGEGko6zBB52X433fMzW+vvh
 pZMCEWuiMxSoAFosC5+nosf/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j462S-0008Fu-UY; Tue, 18 Feb 2020 16:48:01 +0000
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andreas Schneider <asn@samba.org>, Andrew Bartlett <abartlet@samba.org>
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
Message-ID: <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
Date: Tue, 18 Feb 2020 17:47:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="BXvG7xDVWx7ZJyZXS3Y471DYHLD6DJxFd"
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
--BXvG7xDVWx7ZJyZXS3Y471DYHLD6DJxFd
Content-Type: multipart/mixed; boundary="HB9MYQbqgYzreKgQSR1EmzASpo2TdLNfY";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andreas Schneider <asn@samba.org>, Andrew Bartlett <abartlet@samba.org>
Message-ID: <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
Subject: Re: ADV190023 | LDAP channel binding support
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
In-Reply-To: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>

--HB9MYQbqgYzreKgQSR1EmzASpo2TdLNfY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 18.02.20 um 17:06 schrieb Isaac Boukris:
> Hi,
>=20
> I tested net-ads-search from a joined machine configured with "ldap
> ssl ads =3D yes", and it works once I also set "client ldap sasl
> wrapping =3D plain".
>
> However it doesn't work when I configure the DC to require
> channel-binding with LdapEnforceChannelBinding=3D2 as per ADV190023.

I think that's expected, can you paste the error message?

Is it possible to reproduce with ldbsearch as well?

But do the default settings still work?

> Has anyone looked into channel-binding or has any idea what is needed
> to implement in samba (or upstream) for this to work?
> Is there other ldap client code in samba that would also be impacted?

Yes.

> BTW, I noticed windows clients use both singing and sealing, should we
> consider changing the defaults of "client ldap sasl wrapping" to seal?

I looked at it a bit, see
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Dac8fd11f1=
d4b9deb48d6c7942af0c83b52d69d7f

I think we need input from dochelp to answer 2 questions:
1. which kind of channel bindings are expected/used by windows?
   I assume tls-server-end-point. I guess MS-ADTS would be the place
   to define these details for ldaps.
2. how is the ChannelBindingsUnhashed blob constructed for
   NTLMSSP (MS-NLMP)

metze


--HB9MYQbqgYzreKgQSR1EmzASpo2TdLNfY--

--BXvG7xDVWx7ZJyZXS3Y471DYHLD6DJxFd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl5MFTsACgkQDbX1YShp
vVY5sw//XV1SEOOmdRTWa9lCfTQdSnGG07gusgwxH9gHRd12BTlXhZzjKjJ+zhUM
3g4hzlSvLaUQKvMwDOGX04gt3FO3CM0b3bZzbr2UjoWl+yNecwUyizQs0fR89sCc
WqAdXtE1Q3MVjhwrd9tOee6i0u9hWIfbmwHkfNmr4ing9AyAck3iDV8JtzEnWljf
GV+7ToXzdguKKMXYMXNoL1leJL4/2x8RQguc0NAGlPNeD/hJvNvTVullSKlEPMAG
RzztpPuWfSlFcJvNZw8L2jgWckCvm/1ZI+9t1mv4nX2Uy+tJQnazn57m4vcn+8z8
nmahaiu8wsdnPiDfMPx8FgFoJmwekpyEFjjXh1v9ZCkd7ccJ9nTTjC45Ks7u5b30
6pmPW9emYcyiOKJe0DXxJYpJunEejwXgVVOYGK7dQclMOhOGAKyJHfvdJWXZNcfR
EqUmFBf3Cf/dEuLOL3uoZF7SBIDAP8iIaGchvL+NEHYWOryJIyb0nCFlT51tIYYi
22/66+5OtrYj6xyKt0lAYMQZMSYds+sxQ/+Upxc94DEIA8W/Q3eiYIhPyZiNpKKR
cfrDEBL2wIqGMp9XzJ71buG5/ZmBLiK7xncgCdWlFC3XhNUX7E3b+j1yFCnU5yRr
1Uq/DGffzJJW8dxwCxDQQzQMO7ByYb3IzpgtcUGWHyDMoT78ojs=
=+/Ie
-----END PGP SIGNATURE-----

--BXvG7xDVWx7ZJyZXS3Y471DYHLD6DJxFd--

