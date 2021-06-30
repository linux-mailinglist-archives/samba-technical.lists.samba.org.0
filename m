Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A19333B8108
	for <lists+samba-technical@lfdr.de>; Wed, 30 Jun 2021 13:02:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MVwqp6FOR+hCiozYEE3rt+PQXAHdrRLLAW22WpS2G0g=; b=v8FxRC41Lp884o4N1cTPFhG+iS
	yQBjjdowj3r2JKgAzZxbpHdNg7+LZpg+JtPX56dLM+k+d89iegZ3/yeHeNzhnKWZ9Y5WUqEbWwVry
	ET5pkLUeriSAnmD0gb4QZzT1A6liH8Icw6V2qr4BZc3WqMDpYC1CONTTcO69fXd4DgO5ry/TvqLrT
	LBNYpiP6YBjmIBT0efSW8gZW9tg+MyQ+ehnIcw5/IeD71Vuvkm4y0poDaeGY4Z1IDdcXT91ORKsbS
	OTQn8KGE1JR+niX3OgrKou8y+Swn0zdb2g7JrjThh00duPki9eS2E2fDbdnTqmAx6OIEN8SNpWjMy
	CnLI63BQ==;
Received: from ip6-localhost ([::1]:45132 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lyXxi-009KIU-7P; Wed, 30 Jun 2021 11:00:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20304) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lyXxc-009KIL-4Q
 for samba-technical@lists.samba.org; Wed, 30 Jun 2021 11:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=MVwqp6FOR+hCiozYEE3rt+PQXAHdrRLLAW22WpS2G0g=; b=W+eUrAHOxaI9/xXGTIsf4qs+ex
 FCfolwlPDqv3rq3EweOq5Bmy3U1CEXJwP7Mq4YCIFaJekN7+KHJ2fvJ5DhLVJan6p0YXZYC7duFFE
 II/Wts9QHQf39Nr+qA3PqrSefrx8z7YGWWkzhWg5o1HsqqpRL7MOVOW4bySJeNPsn5bV4m7vvIuyB
 CspYdRBEJYb3FuKqojf5tYPraaIicchLRn2Lc59mbjOPIdfVNPN9FbRHzJZ4eM87fuGDPbGyfjYj4
 xgiU8nyLgZNCH+DwmCYo0nTWPxZkKnY4kXrGXDxTgcHXG9y2zUFG9iXiiLgIB11DjXPBlJuBTHyuK
 +ri4NB7pd6AFEoVySugo7ex0NrXObYrHVDlvWfTHWn0pEvWwTGuvWDC2RhVsCaM8ZQdwoHs3US39l
 ZdyEsVNqRLeoNaNHMFXmHscKWlyp614Ph/GHY5+hFta+lM72OivpHWU+TazfQovgM+jCvsPVe+Srf
 BBkfj8GtDQRF1Ze7Cq6uQp5l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lyXxa-0002ne-1l; Wed, 30 Jun 2021 11:00:50 +0000
To: Pavel Filipensky <pfilipen@redhat.com>
References: <CAEcb10uXPGgAmZSqZ71PRSEbo+ZiNkem-CmH4afBPemnmXAdZQ@mail.gmail.com>
Subject: Re: key version number in fill_mem_keytab_from_secrets()
Message-ID: <f4023375-0dcb-f817-7429-43b5bb78c3fa@samba.org>
Date: Wed, 30 Jun 2021 13:00:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEcb10uXPGgAmZSqZ71PRSEbo+ZiNkem-CmH4afBPemnmXAdZQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zAgw1ChWGjnODhGXb9MkMEAtwG46WbiHe"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zAgw1ChWGjnODhGXb9MkMEAtwG46WbiHe
Content-Type: multipart/mixed; boundary="KHvhLWOnNhlEjRRDhfUjRBMMMTfEPMsy6";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Pavel Filipensky <pfilipen@redhat.com>
Cc: samba-technical@lists.samba.org
Message-ID: <f4023375-0dcb-f817-7429-43b5bb78c3fa@samba.org>
Subject: Re: key version number in fill_mem_keytab_from_secrets()
References: <CAEcb10uXPGgAmZSqZ71PRSEbo+ZiNkem-CmH4afBPemnmXAdZQ@mail.gmail.com>
In-Reply-To: <CAEcb10uXPGgAmZSqZ71PRSEbo+ZiNkem-CmH4afBPemnmXAdZQ@mail.gmail.com>

--KHvhLWOnNhlEjRRDhfUjRBMMMTfEPMsy6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Hi Pavel,

> can you please help me and answer my questions related to feature
> 'Implement 'update keytab' for winbind and tools' (
> https://gitlab.com/samba-team/samba/-/merge_requests/1999).
>=20
> You commented in MR 1999:
> *I also fail to see where we add the keys for the old(er) passwords.
> Shouldn't we just dump the keys from in memory keytab (which is filled =
from
> the precalculated hashed of secrets.tdb) into the file keytab.*
> --------------------------------------------------
> A) fill_mem_keytab_from_secrets()
> --------------------------------------------------
> I have checked the code in fill_mem_keytab_from_secrets() and what it d=
oes
> is (code is simplified):
>=20
> krb5_kvno kvno =3D 0; /* FIXME: fetch current vno from KDC ? */
> fill_keytab_from_password(krbctx, *keytab, princ, kvno, info->password)=
;
> fill_keytab_from_password(krbctx, *keytab, princ, kvno - 1,
> info->old_password);
> fill_keytab_from_password(krbctx, *keytab, princ, kvno - 2,
> info->older_password);
> fill_keytab_from_password(krbctx, *keytab, princ, kvno - 3,
> info->next_change->password);
>
> I see two issues here:
> 1) kvno is incorrectly initialized and keys are added with unreal value=
s:
> vno=3D0
> vno=3D4294967295  (-1)
> vno=3D4294967294  (-2)
> vno=3D4294967293  (-3)   ###  btw. the semantics of next_change is more=
 (kvno
> + 1) than (kvno - 3)

This is intended, we could also use 0 for all of them,
the key is that we should not care about the kvno, as there is
no reliable way to get the kvno.

We the acceptor should just iterate overall keys (for the given
encryption type) in the whole keytab and try to decrypt the ticket.

If I remember correctly that's what MIT krb5 does and for
Heimdal it's a bit random if it iterates the keytab, I think
it iterates as long as the kvno didn't match, so it's better to use
numbers which are very unlikely to be used by the KDC and for AD
the kvno starts with 1 for the first password.
I also created a GSS_KRB5_CRED_ITERATE_ACCEPTOR_KEYTAB_X for heimdal
to ensure that it iterates the whole keytab, but it's not yet upstream,
see https://github.com/heimdal/heimdal/pull/656

Also note that Samba asks gss_accept_sec_context() to ignore the
SPN values in the keytab, as it's also not possible to know all
possible names, which are available on the DC.

> 2) info->next_change->password should not be passed to
> fill_keytab_from_password().
> next_change, if exists, refers to a password change in progress, and sh=
ould
> not be used before it is accepted and finalized, then it will become
> info->password and only then it will be added to keytab.

No, info->next_change->password might be in progress for 4 reasons:
1. An error that happens before the password change reached the dc
2. The DC rejected the password change
3. The DC changed the password, but the success response didn't reach us
4. We we're not able to store the success (e.g. a ctdb failure in the clu=
ster)

But we can't really know/should not care about the difference between the=
se
reasons. And for 1. and 3. it's not possible to find the difference.
So we must be prepared to accept tickets encrypted with the in progress
password. Naturally we also need to accept all tickets with all other pas=
swords
we know about, as ticket lifetimes are typically 10h and we have to deal =
with
replication latency.

> Q: How is it possible that it works with wrong vnos?

The acceptor should ignore the kvno, I'm not how
gss_accept_sec_context works in other applications,
but for samba's usage I guess the iteration works
(apart from heimdal without GSS_KRB5_CRED_ITERATE_ACCEPTOR_KEYTAB_X).

> --------------------------------------------------
> B) ads_keytab_create_default()
> --------------------------------------------------
> this is the code I use to implement keytab update. It does:
>=20
> * ads_get_service_principal_names() and adds keys for all SPNs via
> ads_keytab_add_entry()
> * adds keys for sam_account_name and UPN via ads_keytab_add_entry()
> * It stores SPNs from keys with (kt_entry.vno !=3D kvno) into array
> oldEntries and for whole array ads_keytab_add_entry(ads, res,
> oldEntries[i], false) is called
>=20
> Every call of ads_keytab_add_entry() also calls
> smb_krb5_kt_seek_and_delete_old_entries(), which deletes all keys with =
vno
> < vno -1 (i.e. vno -2, vno -3, ....) for given principal.
> So it should also ensure that old (but not older password and it's keys=
)
> are in keytab.

I guess '< kvno -1' comes from times before we stored secrets_domain_info=
B
in secrets.tdb. Today would be '< kvno -3'...

> Q: Do we also need the older password and why? If needed, isn't it bett=
er
> just to avoid its removal from keytab, instead of filling it from
> secrets.tdb (or from in memory keytab)?

I think we want the kvno values to stay below 1 in order to have
heimdal keep iterating the keytab.

I'd do this (with kvno =3D 0):
- remove all old values with kvno - 3
- add all new values (if any) for kvno - 3
- remove all old values with kvno - 2
- add all new values (if any) for kvno - 2
- remove all old values for kvno - 1
- add all new values for kvno - 1
- remove all old values for kvno
- add all new values for kvno

The worst thing that can happen is that some keys are stored under two kv=
no values,
but we're sure at any given time the old values of kvno, kvno-1 and kvno-=
2 are still
in the keytab and we're ready to decrypt incoming tickets.


I think 'net ads keytab create' asks a DC about the msDS-KeyVersionNumber=
, which
is typically (but not reliable and always) the kvno. We may asks a DC tha=
t doesn't have
the current password yet, or it already has the in progress password alre=
ady or the DC always returns 1,
see [MS-ADTS] 3.1.1.4.5.16 msDS-KeyVersionNumber:
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/cb85=
ccdf-6469-42d5-a61c-ebae09b72e9d

Maybe we need an option to specify if the kvno should be fetched from the=
 DC
for 'net ads keytab ' commands.

The kvno (as well as SPNs) might be important for some applications so
we better keep the default behavior for the 'net ads keytab' commands.

For legacy reasons this is all really complex in order to be compatible
with all sorts of situations and setups.

I hope I had some useful comments for you...

metze


--KHvhLWOnNhlEjRRDhfUjRBMMMTfEPMsy6--

--zAgw1ChWGjnODhGXb9MkMEAtwG46WbiHe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmDcTtwACgkQDbX1YShp
vVZKeA//TGnXrV2FSpMLGKvIbGbe8/PyZT0f+kA1c1lroe3oMQBVkTOHc/4v/vD2
dgje8mdwCenoUy8Pz9KSaSqIkLhJkXVJ9JLV71VHgqMWxOfOrp1+e/2aVG6/uVwO
usuwx1FXQoIz0eWpN2tHOu6UlmOkutj6gt3mx6lsXP+uW0K+YeGiQhS0ZgFnqAuh
ZDAuoUICY2J3MQRjUsGkjj9uQ5wFiNTZTiLV8pw4rWRXSuOdXNbLuhCTygacBju2
Zh3yOQqZHI6bGzUwTVRCalw89EhATXYaz9LpdST0KtJjqwn9pcDlxAwYvM5cfkpm
OSflPhu78Lin9Nrj0MfGq0gee80FYGFKs+iFbyPnuKEHC08J9rfynlXpk9D/MoqB
G15IsOcgjYDSi5Ssl08zgRh4Vq3a7psZiwJtMFYOxRmAcL66nLiua897Y79S1eJ3
8EA6wl4uPx9xCWPyA3TJE4h8f99DNqtxXSK+frlDs4CVyouA+gGrY7iUlwxHWPDx
KiahrJcK2ntuqzF9Znl9TCvQ6SmBthMkLSP263FKTQLoABO7QZFvceCUQkFGqNhY
B6fmNukXBHcOuDf4gsNN7am/mTcX5nCfaahlM6FtXF0kacsNSnhtrjwik5f2W4Sf
kVKWK8b6+EVXpZDpmsGo1LRNVXmTEWhPVVBs5GvARIy7DX1LzfA=
=Afg6
-----END PGP SIGNATURE-----

--zAgw1ChWGjnODhGXb9MkMEAtwG46WbiHe--

