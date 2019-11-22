Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9331B1069EB
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 11:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xjgneR0zptXFDLK7pr5lYE+0tRRo0EPj05DrzE4aRZQ=; b=oxUgv8CzXjwQFt3HflBCB7tMGV
	eGfyIqZXWpJMQM64LCJ96Sc7ErLIglKuMLrur5vtLIi6esnMo62tFpt/bYw6h9JiL+AsfAmuB3Uhq
	2ee/OBvGjMXOOB39d6xpU3bhVa3D0N1jn20SSwZwKVo4QNVS5YT1nxMSGVvodeJWe0A36WB9vjb5e
	sZELeWs/uHXYSSIzJBs8XdlECVSZfNkvCpD57k2qs8tFPiCHVsoCSdgUlXQ2q9BAtw3wVoj3b3Ir2
	YybZ02NG/U9cQRSWu1ZesyzR1uSBsKA6AZdLQPfSZaYi12xapD57uXPGWJDnFA+Dh6cgzBOVjwouq
	mcOp2G+g==;
Received: from localhost ([::1]:53500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iY67V-0021K3-4r; Fri, 22 Nov 2019 10:24:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16304) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY67R-0021Jw-9D
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 10:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=xjgneR0zptXFDLK7pr5lYE+0tRRo0EPj05DrzE4aRZQ=; b=Jjty9lrwZL438G/oKlXwAanLUl
 MP2Su+moM641Y8mUOdk5MEPrZ/3SRf6M/PzieKmN++43BnMQ7gWBN5AebH/RPKfePP5+exQbnd1Qf
 8ZOqwd/BRT/RxBHg1fYMkiR69sxTlTcEOE+Od0Ty7EErbS0+fQ/bEppOowddxg7dsLdh4LgA5071m
 FLgxg2XcgEvIGDCUcFRbSRC6YfZdVFMqbDhSfq0k2+R/dnT226z72nHEG03L6DuZm46FhoTbTR5aN
 RrKUSNffJmiJXrFEvEonsCF0imjQiUqS2CXjOSlN3/1htQBLPqyoztFCBQoF3VAjDLcrRDVJ7vIdB
 j293AGWkcLps0TH2+K2p0nM8ZE6UluxKrraapNGxgLTNzFwo6Z6T2NXs1herR5042ywFDuEtVqGPp
 RCXorq6WybqZHM2BclIOvBNO6Fm2HIHZWN4wHwLifMpqoM/2SCHMx5UQJkcax7gTpiS3MsVVgiURu
 cKak9S8DVl+wani4dh4AetSA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY67N-0002xg-Qt; Fri, 22 Nov 2019 10:24:49 +0000
To: Nico Williams <nico@cryptonector.com>
References: <33c431f5-c36b-c321-de3f-65977d8aa898@samba.org>
 <007c29e8-02b9-4f48-f67e-881cb0985d64@mit.edu>
 <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
Message-ID: <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
Date: Fri, 22 Nov 2019 11:24:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121223908.GC26241@localhost>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="uB1NnpKCNTTJnpqZJe9TAfToAyI3ReWK4"
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
Cc: "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>,
 Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Greg Hudson <ghudson@MIT.EDU>, "krbdev@mit.edu Dev List" <krbdev@mit.edu>,
 kitten@ietf.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uB1NnpKCNTTJnpqZJe9TAfToAyI3ReWK4
Content-Type: multipart/mixed; boundary="1nQgGYMk7ondMoMQPMm10l3Re2p7B4t8j";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Nico Williams <nico@cryptonector.com>
Cc: kitten@ietf.org, Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>,
 "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>,
 Greg Hudson <ghudson@MIT.EDU>
Message-ID: <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
References: <33c431f5-c36b-c321-de3f-65977d8aa898@samba.org>
 <007c29e8-02b9-4f48-f67e-881cb0985d64@mit.edu>
 <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
In-Reply-To: <20191121223908.GC26241@localhost>

--1nQgGYMk7ondMoMQPMm10l3Re2p7B4t8j
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Nico,

>>> My idea was that Samba would use
>>> gss_set_cred_option(GSS_KRB5_CRED_NO_TRANSIT_CHECK_X) to indicate
>>> the the transited list should not be checked.
>>
>> I implemented GSS_KRB5_CRED_NO_TRANSIT_CHECK_X for
>> MIT, Heimdal (both upstream and Samba) and make use of
>> it in Samba.
>=20
> Hi,
>=20
> The right design for this is to use name attributes, not credential
> options.  Credential options should be banished altogether.
>=20
> To see why consider an acceptor application that wishes to examine the
> transit path (or whatever other attribute) an authenticated initiator
> principal took to reach the acceptor.  What credential should the
> acceptor inspect?  There is none to inspect, not for the initiator (not=

> even if they delegated a credential, since that one might not have
> transited any realms).  The only way to inspect the transit path taken
> by the initiator is to inspect its name, as that's all we have for it.
> This is one reason we added name attributes.
>=20
> Correspondingly and symmetrically, the right way to request some
> behavior on the side where the credential is available, is to associate=

> that request with the desired_name for which the credential is acquired=
=2E

So you mean we need to pass an explicit desired_name to
gss_acquire_cred_from() and use gss_set_name_attribute() calls
(for no_transit_check and iterate_acceptor_keytab) on that desired_name
before?

Then I think we need iterate_acceptor_keytab also for MIT.
As far as I can see GSS_C_NO_NAME is the current trigger for
iterating the keytab. The functionality we need is, try every key
with a matching keytype, but ignore name and kvno.

> Credential options are not standardized, but name attributes are.
> Please use those.
>=20
> Consider this my code review for the Heimdal PR.
>=20
> I understand that this is probably a big change, and that this request
> may seem hostile (email being such a dry medium).  I'm willing to help
> you make this change, both for Heimdal and MIT -- I'll help with the
> code,

Thanks! I'm a bit lost on how to actually implement this, as
Heimdal doesn't seem to have a gsskrb5_gss_set_name_attribute() function
and krb5_gss_set_name_attribute() in MIT uses
krb5_authdata_set_attribute(), which just calls
krb5_authdata_context_module plugins. I'm not sure if authdata is what
we need here.

Are my changes to the lib/krb5 layer ok and we just need to change the
way the gsskrb5 layer triggers them? Or do we also need modifications the=
re?

If you can tell me what attribute names we should use and how
the full call to gss_set_name_attribute() should look like,
I can start to change all the tests. But I need help to
implement the glue between gss_set_name_attribute() and
gsskrb5_acceptor_start() and kg_accept_krb5() respectively.

> and I'd be happy to have a conference call or exchange further
> emails.

I guess email is better for now, as we have everything archived.

Greg, do you agree, with changing to gss_set_name_attribute() instead of
gss_set_cred_option().

Thanks!
metze


--1nQgGYMk7ondMoMQPMm10l3Re2p7B4t8j--

--uB1NnpKCNTTJnpqZJe9TAfToAyI3ReWK4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl3Xt2wACgkQDbX1YShp
vVaVwxAAvsm5rrmLLK0kBQELyJOc6yKMLvJldOAvEDxvYeshr6VM/R3fBHww+n63
D7/cTsyrd0cm1gDgAZS9XR7rBB99k46rzl97oIGWYk735xhBmDMBSevTILS7TuYv
BFerPkqIutK3HYB9AJqT6/z3YP0i5RsAz1XrgrSOS8XJobdw99KyO0rdjmZHmZdk
kmbVeh82kx0nWEsub196gYdHRwePbuLSZw8eo+ZKFUD7XOInjoRiPGD5plBTq1Fk
S5pHvBjVzUW1mVXqFe0hHkGbFqaxu9oSQEIXE7F3NnQZCoh0bjuU8pCm8qcX8mfF
drIL1jr+mYlQo99PkO7rCE7U4Le3Z1QspmXDxf7mX0SFHe9uPCf9Eux0EeUCPSK0
75Tn6RvDwteJmwlBLTWFwvTd63H9s7tPCAgnURXPDy0c9S1kG/jDFHHsg/YJsI+z
FjlXueyt/YWASOKTVu6LH5/bMZwiVuuYJUsZ9lWdZ3yOq84t1VSRintUc/CuGyM4
ZMNb5DEL+3aVNIluShAtBOOBkbTWTORVGi2sQ2YshATk6vMzfO41y5HsSZ2Ra42d
HdNSh213PRqt6J9lFMjXQC5JrqQr1N0fvfijKzU9fqFLyZCb99Z13LW2KGmRuMar
yPmNA+3c26kKxrnMtNAe2nDY8PSRuFrqvfSJxTSkfDQk+TA+IAI=
=tz6A
-----END PGP SIGNATURE-----

--uB1NnpKCNTTJnpqZJe9TAfToAyI3ReWK4--

