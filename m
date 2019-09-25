Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC659BD99D
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 10:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ZQseinIFhr6I5u9uhinVNc3Z+QEubGjEe1qk7V6pAVA=; b=p5BNz790NajbmqMaUXtzpRpEBa
	AZqu2Qws6gIbARMyKj5qZtGB3GQREpDWPS49st+WIMzaa9mjjZX0rwRyyFsX1jBwaSY2DGpRUYsHu
	GFmg4BNrNsvA+l5MiTO7gBc3YsWpPl74v6jj2qKxQFReqsFODlq+7aNTEPYZXmkqBYaIhMxs7zS2A
	zEo7uNYTyX79eqSTLLRE+IpF2ue8KtakzXy2reqHRH0P84hQpHRd4SVPddLzLEYZWvpytI0kATA2r
	Mvay9qDD+eqLRJtwBj9ahjK8DgdUG+gslB7wBvJQpCwslBqPB7T7Q33Ta1MBvT6fc2ZjZSIXVRD0x
	98Lf+KFg==;
Received: from localhost ([::1]:54092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iD2NI-008RKJ-Hz; Wed, 25 Sep 2019 08:10:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26198) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD2NE-008RKC-3i
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 08:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:To:From:CC;
 bh=ZQseinIFhr6I5u9uhinVNc3Z+QEubGjEe1qk7V6pAVA=; b=YX4ep0037tYlbkLRkwklPdUWss
 5fumLx+TVviyxLoHBri3oeU4SOLFm9tK3/7EAhIEa6V4mISN0b5BrlrXkL4e4czLXppA/sAXiAsKs
 kdQpziC2dcWKXsQ20DyYw3e9jPEdEyC2h8L+qkkXeyyB9mo+1hVHAw867kxj+5fdhtBQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD2N9-0004XR-LB; Wed, 25 Sep 2019 08:10:04 +0000
To: kitten@ietf.org, Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>,
 "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>
References: <f33d5f68-1fdc-c1bc-c702-70b054880bb4@samba.org>
 <649fa812-aacf-80b6-1976-a719eca60fc2@mit.edu>
 <33c431f5-c36b-c321-de3f-65977d8aa898@samba.org>
 <007c29e8-02b9-4f48-f67e-881cb0985d64@mit.edu>
 <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
Message-ID: <d50c2b41-d0de-b47a-b47b-781fe4b1abe3@samba.org>
Date: Wed, 25 Sep 2019 10:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="KEp1hyN2XtDrzkgsIcfNm48mTsTqVN187"
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
--KEp1hyN2XtDrzkgsIcfNm48mTsTqVN187
Content-Type: multipart/mixed; boundary="AjrXIliStI8mOzoZSEJlRxgzIFbsPqUlC";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: kitten@ietf.org, Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>,
 "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>
Message-ID: <d50c2b41-d0de-b47a-b47b-781fe4b1abe3@samba.org>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
References: <f33d5f68-1fdc-c1bc-c702-70b054880bb4@samba.org>
 <649fa812-aacf-80b6-1976-a719eca60fc2@mit.edu>
 <33c431f5-c36b-c321-de3f-65977d8aa898@samba.org>
 <007c29e8-02b9-4f48-f67e-881cb0985d64@mit.edu>
 <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
In-Reply-To: <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>

--AjrXIliStI8mOzoZSEJlRxgzIFbsPqUlC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 24.09.19 um 02:05 schrieb Stefan Metzmacher:
> Hi,
>=20
> resuming this old thread...
> https://lists.samba.org/archive/samba-technical/2017-August/122422.html=

>=20
>>> Does the Kerberos library know whether whether the application is goi=
ng
>>> to look at PACs and SIDs or just use the client principal name?  I am=

>>> guessing it does not.  Thus in Samba, one might need a dedicated
>>> krb5.conf configuration file that disables the transit check.  Other
>>> applications should still apply transit check even if a PAC happens
>>> to be present, as AFAIK it may well remain unused.
>>
>> My idea was that Samba would use
>> gss_set_cred_option(GSS_KRB5_CRED_NO_TRANSIT_CHECK_X) to indicate
>> the the transited list should not be checked.
>=20
> I implemented GSS_KRB5_CRED_NO_TRANSIT_CHECK_X for
> MIT, Heimdal (both upstream and Samba) and make use of
> it in Samba.
>=20
> Note that I took a OID from Heimdal:
> GSS_KRB5_CRED_NO_TRANSIT_CHECK_X - 1.2.752.43.13.31
> So we need to push it Heimdal first in order to avoid
> conflicts later.
>=20
> The code for Heimdal can be found here:
> https://github.com/metze-samba/krb5/tree/master-no-transit-check
> (also attached as heimdal-no_transit_check-01.patches.txt
> and heimdal-no_transit_check-wip-tests-01.patches.txt)
> Sadly I wasn't able to create a test that was able to
> trigger the desired code path and verify it works as
> expected and avoid regressions. Maybe someone can
> help me with that or give some useful hints.
> Currently it's only tested via Samba.
>=20
> The code for MIT can be found here:
> https://github.com/metze-samba/krb5/tree/master-no-transit-check
> (also attached as mit-krb5-no_transit_check-01.patches.txt)
> It also have tests to verify it works as expected.
>=20
> The work in progress for Samba can be found here:
> https://gitlab.com/samba-team/samba/merge_requests/809
> (also attached as samba-no_transit_check-wip-01.txt)
> The key is that Samba will require a verified PAC in the
> Kerberos service ticket and be sure the authorization token
> is generated by a DC of the primary domain, which is all we care
> about as we just trust the domain. In such a situation
> we'll use GSS_KRB5_CRED_NO_TRANSIT_CHECK_X to disable
> the for us useless transit check.

I just realized that verifying the PAC gains no additional protection.
As the client realm, client principal and transited fields is
in the encrypted part of the ticket, which is encrypted with the machine
trust password.

For now I added a simple "kerberos acceptor disable transited check"
option, which is off by default for now in order to backport that fix,
but in master we should enable that by default.

I've updated the Samba merge request with a much simpler patchset.

metze


--AjrXIliStI8mOzoZSEJlRxgzIFbsPqUlC--

--KEp1hyN2XtDrzkgsIcfNm48mTsTqVN187
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2LINQACgkQDbX1YShp
vVbxkQ//bQXhzqpUz6a9Q5OKg8vsq1y44r7n4oN7k14Gp0gEWs6uqhqwxoZMyxyv
lnD22M/e8EYuMC25ufvGq2YsXDdlySxxokYRodmqMUs/Bvt/luGsX4ZReYs2T3a2
jCAWNHn67gttd+Sk3S4NL9qm+BvzAWe/Hwf8J+tm0MeCbv1QKCda8copvqrDktzK
JYWhYWtV9ir8tQWMS1SsMzPnadbjmeM8LBBEztBdJsWfAy1a40gkWjO8+WuRQluJ
lQ1dws2NbKcnorOe91AUn6vodnh3AuxbdDa6XH+CFDlX3LKhcY6md/H098o07Tsr
B6pCWtaclqqeOJye+Riie6LuwPRp5I+XXduhw20Hhnml2p7MI32GqoDTSu0AjAR6
s3+GSHNDMrx/a1w4Y97S6JNglibvpQuk8dpFOoqnMYxOnzk1YiV4ObvKEPIAW3oM
krqEBbD+PDrTUhNEH+uBCYzOXHnW8oF0xeTD0xJkNJzA2FtLPKorqFNCW3Htbbu5
dbBM7pENuYG3MVjv+HT3k6cNUcWN6HbPOrpsji019kM4cPUoWWGsJlcbTOksF5LU
134Um+MN6QI08YiqBtq2LkoxK8aLUsVDJ0srnedykoOUW1vLiv1Jos9c/RH7Fhca
2KbpqlcQLGERwpEtprrxK9Oyc52HHjUlc8m45g41nUC7fDWF4mQ=
=pbGQ
-----END PGP SIGNATURE-----

--KEp1hyN2XtDrzkgsIcfNm48mTsTqVN187--

