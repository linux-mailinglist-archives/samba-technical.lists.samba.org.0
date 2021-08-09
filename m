Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E33E4575
	for <lists+samba-technical@lfdr.de>; Mon,  9 Aug 2021 14:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=x7UJGnJnT70mNioi9y7Q176ixy8oR1x3cK6KYD8HYKI=; b=UayQEEMBqB46GrldkF+ihErW2P
	Vsv03TDx6nN9w2JSrt+wVQl/oB1WSxYxkRBolhm3NXh5nNOb+jGWMtXzFRUWGomTva2O/v66KHAnR
	1vKpxFbnpc8BzwBYWJSYlH2BMSRs/V1DzqBlSBcQWzCpBjzqhtwYtpCohOAXTkZHNABsdFqowBBXV
	5H4HUkguBAMoekv+5iOIK32ekRarlq2bBPJW3FI9iaY+EwaL9eEs+7soSPjH2dmpH2P+hVaaiOasQ
	fPTKwwt59k85SDWHFlOJqRPs4zQFpAqSDg/L4iy7e/USQslEAeU46K9WO5vsZR3TYowF8/VChCdd+
	cLuKYZ7Q==;
Received: from ip6-localhost ([::1]:37806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mD4Bg-005JO7-BZ; Mon, 09 Aug 2021 12:15:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28586) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mD4Ba-005JNx-Lo
 for samba-technical@lists.samba.org; Mon, 09 Aug 2021 12:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=x7UJGnJnT70mNioi9y7Q176ixy8oR1x3cK6KYD8HYKI=; b=QxugdTQ6vl+D5yVls8AitN37YW
 8f3Bfgl4tyvpLesmCogn42JNpbsZx9ruUqyK66Sen4tb58Zjb+zbut+urRbGt29yhoz89E6j1ml9F
 wsho2V3pL+4rVtn3wrLvS2Rj/u6mudMeILVD5eSeZ0cG7kdcymqYSl6ekMUPqcoB2w/FOQHFToviB
 LWjgxlxZqpWcmSnEI3M3zPxujdXe9qURvbOf04vffnXzBhSjJIk+LVyuUqAudveuJq5+DNL89K6La
 AA/ONfa4F9u+S/oaPAO1cSrheAgRLwUURhIotuhuEH1SlJzD4n9L29kfQyzxrNCdQ2myCFFWNR+g9
 1ALk5LTzP1Otx+5LENTU6+kJ1Fu2r8PNq5d7WXnbhTwCrMIRlRaniqscQvk7mcyAHf/+55+yFv1or
 MrDDUS8fK4zEBcee5RP5e0D2ZKRCuHVidh41irRuYaSyOlxeomOuRJvKK0ZIIJK8dn6/Qsf+i6lDm
 Eg3jOmWFQiWQ7NUh6B2CYR6D;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mD4BY-000Lvg-IT; Mon, 09 Aug 2021 12:15:16 +0000
To: Stefan Metzmacher <metze=40samba.org@dmarc.ietf.org>,
 Greg Hudson <ghudson@mit.edu>, Nico Williams <nico@cryptonector.com>
References: <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
 <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
 <20191122224526.GA28614@localhost>
 <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>
 <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
 <3d693bdd-9a4c-7135-318e-593e18e52cd0@mit.edu>
 <9062428f-f26d-4f10-b71f-f54464df2ff4@samba.org>
 <c388e3f9-bf85-8ffd-3640-b27e0552a96a@samba.org>
 <276401e2-5d09-29d2-be1b-5e876f49c0eb@mit.edu>
 <22c35d56-cc7b-e3b1-c357-d387f11d9d22@samba.org>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
Message-ID: <4c48be85-1cec-ca04-19be-296423d3435d@samba.org>
Date: Mon, 9 Aug 2021 14:15:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <22c35d56-cc7b-e3b1-c357-d387f11d9d22@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CMVlaZV9k76CfTXOeddOoVj5dgzimXB7p"
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
Cc: kitten@ietf.org, Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CMVlaZV9k76CfTXOeddOoVj5dgzimXB7p
Content-Type: multipart/mixed; boundary="PK8PA3pSYb89HIiXo3iNUdZLTQ1gBzejt";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Stefan Metzmacher <metze=40samba.org@dmarc.ietf.org>,
 Greg Hudson <ghudson@mit.edu>, Nico Williams <nico@cryptonector.com>
Cc: kitten@ietf.org, Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>
Message-ID: <4c48be85-1cec-ca04-19be-296423d3435d@samba.org>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
References: <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
 <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
 <20191122224526.GA28614@localhost>
 <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>
 <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
 <3d693bdd-9a4c-7135-318e-593e18e52cd0@mit.edu>
 <9062428f-f26d-4f10-b71f-f54464df2ff4@samba.org>
 <c388e3f9-bf85-8ffd-3640-b27e0552a96a@samba.org>
 <276401e2-5d09-29d2-be1b-5e876f49c0eb@mit.edu>
 <22c35d56-cc7b-e3b1-c357-d387f11d9d22@samba.org>
In-Reply-To: <22c35d56-cc7b-e3b1-c357-d387f11d9d22@samba.org>

--PK8PA3pSYb89HIiXo3iNUdZLTQ1gBzejt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Am 09.08.21 um 10:59 schrieb Stefan Metzmacher:
>=20
> Hi Greg,
>=20
>> On 8/2/21 10:49 AM, Stefan Metzmacher wrote:
>>> To summarize the discussion we had active directory DCs do transited
>>> checking (even without a PAC) and fails to issue service tickets
>>> if the check fails, so any service ticket is already checked,
>>> but without TKT_FLG_TRANSIT_POLICY_CHECKED being added to the
>>> ticket.
>>
>> I just want to acknowledge here that we're taking on technical debt
>> because the non-conformant party is perceived to be inflexible.
>>
>>> The initial solution I proposed was:
>>>
>>> 	gss_set_cred_option(acceptor_creds, GSS_KRB5_CRED_NO_TRANSIT_CHECK_X=
)
>> [...]
>>> But it seems gss_set_cred_option() is not accepted because it's
>>> a deprecated.
>>
>> Personally I'm fine with this.
>=20
> Ok, should I just use a different oid (I can allocate one from the Samb=
a pool)
> and submit the changes to MIT without the "wait for heimdal first" tag?=

>=20
> It would be great to have that in MIT and we can also apply it to
> Samba's fork of Heimdal and have most Samba setups covered.
>=20
>>> 1. An additional cred_store element could be passed to
>>>    gss_acquire_cred_from() in order to set the
>>>    GSS_CF_NO_TRANSIT_CHECK flag on acceptor_creds
>>
>> This is similar to a cred option.  I don't see any strong advantages o=
f
>> one over the other.
>=20
> Same here, I just wanted to find ways to make Nico happy.
>=20
>>> 2. I think someone had the idea of using gss_set_sec_context_option()=

>>
>> This seems hard to do without (per-thread) global state.  Even if we
>> bring in gss_create_sec_context() from some versions of the channel
>> bindings draft, the mechglue doesn't know mechanism will be used to
>> accept the context, so it would have to store OID/value pairs in the
>> mechglue context and replay them to the mech context once it finds out=

>> which kind of mech context to create.  (And hope that all of the conte=
xt
>> option values are flat byte strings, not structures containing pointer=
s
>> to objects whose lifetimes might have expired between the
>> set_cred_option() call and the first accept_sec_context() call.)
>>
>> Doing this with global state seems strictly worse than communicating t=
he
>> flag via the cred.
>=20
> Yes, it seems way to complex.
>=20
>>> 3. Implement a krb5.conf option similar to "dns_canonicalize_hostname=
"
>>>    or "ignore_acceptor_hostname" from MIT
>>
>> I would argue for this to be a per-realm option if we do this, since
>> it's a statement about a particular realm's KDCs being non-conformant.=

>=20
> Ok. I can also implement that in addition to the GSS_KRB5_CRED_NO_TRANS=
IT_CHECK_X
> option.

I just found the "reject_bad_transit" option that's already implemented f=
or the MIT kdc,
but I guess we want an extra option, correct?

Do we want the new "no_transit_check" option to be used via:
krb5_appdefault_boolean()?

That would allow the following combinations in MIT:

1:
 [appdefaults]
     app =3D {
        SOME.REALM =3D {
             no_transit_check =3D true
        }
     }

2:
 [appdefaults]
     app =3D {
        no_transit_check =3D true
     }

3:
 [appdefaults]
     SOME.REALM =3D {
        no_transit_check =3D true
     }

4:
 [appdefaults]
      no_transit_check =3D true


While heimdal falls back to 2 additional options:

5:
  [realms]
     SOME.REALM =3D {
        no_transit_check =3D true
     }

6:

  [libdefaults]
      no_transit_check =3D true


metze


--PK8PA3pSYb89HIiXo3iNUdZLTQ1gBzejt--

--CMVlaZV9k76CfTXOeddOoVj5dgzimXB7p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmERHEsACgkQDbX1YShp
vVba5A/7BXdZWE/ZYPm3p35biNDoaaUcmnMIJf3a1BI6HCXaIiTE6368wAWV2hT+
wCx85Gr1kzGsmpTJkbCgzc+Dbj2vvAgObeXWDUjr/ak2VQ8tOruLTsqTsMAgxjeZ
v8cQJZdsG4+U9FWBQsp0BDRUNqHApGon7fz54BjaiCv8Os+zUp/zLwZSLmJTd8K8
GppGrXDo3Rcjx91+scjmDFv88Q8+fcGFqLkJp7tILuTk6b8N9WeakU9j/jhwVHX7
NjRv3OctvyqqVxgyA6jafJzTdKdqHSMW/D4zIu1ZoHW2K/7wRS7pQ0F1Gsrq4dh/
SKj+teWv6lqUwGC/nKbA+CIrmDuTv9IlQ9+4iE8/f6+u9KMGJzJcTgcYNsaCCAwa
oGc3Ayxn0npvmguv+4kO0D9KNXksZzOOFxOcHJDHzNKR2B9Usrjrd8ehdBo839rs
xMMlpP3o4u6fJ2/grZhZT5AlPhV5Dd/+FDmPJP24Trt1tzjLm8iOrZfvcspIHpLv
D+MUXEeNmLxJzkk2LEGKrytVAa9obSZj/P5Q6N68s4izFP8k056G6NOzw1kAp0O1
ZQOf5KquzVAfozeO6qChVvoU6s0z7SJdMor3B2WSaiKZlW/Js2LMfAVJFm2+h9ne
t5kriC+aFmcCBi+/DpoI3rce9LgWudhjkUgVawx9rN8vO8EcT0E=
=2drV
-----END PGP SIGNATURE-----

--CMVlaZV9k76CfTXOeddOoVj5dgzimXB7p--

