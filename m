Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED021DDDE
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jul 2020 18:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=MS2RTesceygzSy8d/fw3Q9J04YXk5Z26Bput0tA62Lw=; b=bFw8LhmwJd2rH53HuDmvF/lMq5
	6dMjen6rarJRvWl+g9wy/0NDy/1rO7Xhpy8VORSAombjH7SpzeL0Y0g12BKvsClsxbNxLLbkB+cjQ
	HTzwSK5bcbg8aNF4abVAwZon9DScqDJ4qrcqbOI+Ek6Xb3D9BZx7ZpgISCpXrH0M3Tq5zY7CvH2cN
	s+MiRMzLGKhaUnZ9ucIJVdEVeedxPXNrISZOE5F4cw6DxqX8+laLr+7AAT7VOF5GTb97oFmXPrtdY
	HjRfC5FwY3XD2Iwdv4lG75e7UV6vN+2uE172My2tiUrPWGYl6FBUgdib1tZ2ccoP/ElwdHn4dur6D
	M7c1CpWA==;
Received: from localhost ([::1]:39066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jv1dU-007Agg-SO; Mon, 13 Jul 2020 16:49:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51100) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jv1dN-007AgZ-EZ
 for samba-technical@lists.samba.org; Mon, 13 Jul 2020 16:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:From:To;
 bh=MS2RTesceygzSy8d/fw3Q9J04YXk5Z26Bput0tA62Lw=; b=XpllpAL8jGVZVKN1DGU/rZ6fvm
 RlQQpI4yFLw464hZbGX6DzGVNnZLjOlCDAlx9Mhxnx/uXlScOKgNYPetjxqYdG0noB5w1yQ7/BEN6
 eYGk7q++7KH88KkqpoSlZSr2VX0Wi4LXAcyaScuH7I3u9OW1Fm2aj4PmmmLCftdu0ofjuyCAmkSFR
 blAMtOPkX7w9OCpYdcIzLdCrYKVNqr3gJsCHCEz6SSAucTJv6zQ4vweE9p+U5rG8c2/KRFi+wOm6a
 n0ppqvCTbL6XqOxpkUXqbcOqmRoJnx7xTBMDx60dvk+isq2d/qu+6AlsBvUYbgYJOEOqXjuNICtrh
 U7ZeL3NLyIBVbTseU8eopAKV98F+wMRv3LCVZeNd5XwglzHcmrw4i95D6PiASmUPMzqXCgGSGgD/W
 IjZooWzV2qNEopevGa9DE8hkiPzbMXa0fUI8Oll8O70xEklQTtUOzRPAWmVN65mGi8GV5B3TY3OqU
 rpdkQlSsNPwQltRXYZ85DRZn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jv1dL-0002Ql-Ph; Mon, 13 Jul 2020 16:48:51 +0000
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: samba-technical@lists.samba.org
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
Message-ID: <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
Date: Mon, 13 Jul 2020 18:48:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200710194428.GA1596727@sernet.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ET3hZ1Ae6mC45bwJgS8VolN8q3vegSnuA"
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
Cc: =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>,
 David Disseldorp <ddiss@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ET3hZ1Ae6mC45bwJgS8VolN8q3vegSnuA
Content-Type: multipart/mixed; boundary="AWPbeMALfzYvrSaGsIOKbpl4XBKCAy4CB"

--AWPbeMALfzYvrSaGsIOKbpl4XBKCAy4CB
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi all!

Am 7/10/20 um 9:44 PM schrieb Bj=F6rn JACKE:
> On 2020-07-10 at 20:31 +0200 Stefan Metzmacher via samba-technical sent=
 off:
>> I don't see why your change would be needed, I actually think it makes=

>> the situation worse, as --disable-snapper is no longer available
>=20
> I tried to descibe that in the bug report. Our correct way to disable s=
hared
> modules is to use --with-shared-modules=3D'!module_name'.  That mechani=
sm gets
> broken by 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a. So the new option
> introduced by 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a is not needed an=
d it
> makes our generic mechanism to disable the shared module stop working.
>=20
>> and configure would just fail if dbus-1 is not available.
>=20
> that's what it currently also does. This is because in the discussion i=
t was
> desired that this should be a forced enabled feature by default. Person=
ally I
> would prefer forced-enabled features for developer builds if this is me=
ant to
> detect failrures in autobuild. But that's another discussion. In any ca=
se
> configure fails (intentionally) with 7ae03a19b3ca895ba5f97a6bd4f9539d8d=
aa6e0a
> and without 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a by default if dbus=
-1 is
> unavailable.

of, what a mess! :)

Currently the snapper configure check is the only one of the three
(snapper, cephfs, glusterfs) VFS module configure options that implement
--enable-NAME=3Dyes "correctly" (as per --enable-XXX configure semantics)=
=2E

The other ones (ceph, glusterfs) will just silently pass if a dependency
is missing, effectively implementing default=3D"auto" behaviour.

I don't think we want all of those modules to fail with a
default=3D"true", that would result in too much configure churn while
user's configure runs fail one after the other, forcing them to add
--disable-XXX to the configure invocation.

I guess we should just default to "auto" for all three modules.

Here's a MR that implements this:

https://gitlab.com/samba-team/samba/-/merge_requests/1461

If we decide that we really want all three modules to use and enforce a
default value of "true", this can be achieved by merely switching the
defaults in the above MR.

Thoughts?
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--AWPbeMALfzYvrSaGsIOKbpl4XBKCAy4CB--

--ET3hZ1Ae6mC45bwJgS8VolN8q3vegSnuA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl8MkHMACgkQqh6bcSY5
nkZGOw/+LUkSvWXCPF4P7Pv0Kuw0LTR+GU/qmsKFqpmugb4tisy/n9Mm0am1r02F
iAefPHnxTp5RoMTrPnXL+dDwQaFqa0VOos1WrrS1SaS1LWgTjSTOHK2Jpe8aRVTu
5CmVGEYqZDdHirmWf6dYyOABCaeTuSrEXGNtobcfz9DT3XPDedZ07J+hKGWv/Cbi
l7WK4ji5x610qYFcmf1w6zA3F5M5y/QIbLiJl9Ovchlt1cjFi1gkkBjrk8ZEXBUV
VkFhGRlIUmK1GQyJIc3vFrI0BTEkn+ysQQD0prcfYLUh7fFisuAmaPReOT1+biFE
IQKcoblLOqx84hENL3qDW3g0P4NoRje9FmmrXHW7Y2aaNdY6MnNLkmpIEM08Zi+P
2DXA0s1vR+SyuIgfsY2BLjF1tR6+PIz4sO8SwZ7QegZCBusc3FhIcjupr4n2vHsU
ARq3WgkqbsNaKhcscuyIh94gXyFokng1sqeKXQDHf2rrD4D1dAchG2q6F63CSOd5
rEjO8wL/0dX0i0QSEkpJe7rLLdEi4rvCdYZJCBwAgtw21rtEHMBguczx/ak2zCYy
s7hjZRX2yPtUI5IbxZhoock15OflJOF7Rijg8fgju2iSKkkOqhprQCKoQCnA6utR
POOCkmoe59QtSD9jLQmE8jJ+uXJO6h6SNQISniURa2E0AcAct+I=
=QiIv
-----END PGP SIGNATURE-----

--ET3hZ1Ae6mC45bwJgS8VolN8q3vegSnuA--

