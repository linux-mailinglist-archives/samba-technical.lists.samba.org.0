Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC4AA00B1
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2019 13:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Oxk5d/CE3ezlpHCgtgefsm7s156nbBobR18ZU49VCUY=; b=PN2GScOF5QNuFtLKEBStdRCxZs
	8bsp6oAhmGskSL14YdT9hgTEtOrf8lcbnjWDt3jXJ47IxL7qNWcAiKNPH6pFPwdWVzkd9FqS8HM2r
	58aVHJNa3xum1XGJYX3Mbv2EGMt791uYSQx5QXh6mt6i5BXG83I/6nOWQKdMLYoziGllwNXH+ud7u
	mhEJDgo4cAftCWrpHv3UcrZzuvFUFn7mbDhuvq/HiAcO7+pkxhT1tnDI8NYx0SaorDBG2+z4o+af9
	lSUGqu7P84afTe4F+FATYJ8Lon63H+vDE60M1BzdN8TOLXu1bAJ5FzEAAgxjUX8EYZsVVTHFdogMH
	GZJsjjDg==;
Received: from localhost ([::1]:43770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2w62-008ypa-A0; Wed, 28 Aug 2019 11:26:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52392) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2w5w-008ypH-SE; Wed, 28 Aug 2019 11:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:Cc:To:From;
 bh=Oxk5d/CE3ezlpHCgtgefsm7s156nbBobR18ZU49VCUY=; b=qKpI9D8caBlVwtC68b1VFgtOMY
 RpRiaNaSaCzcG+vNS/dbsHfKsJenbnBk8G5E55XUVkw0nY8eyOd1VEhxE7f0OaI8C8UqTkfA2jfA5
 g2mvTmRPqRkFRBJQYs9AZfrQmaYBZM5w/bC3CW0HM8Tr6s48h89SORflzqfw4vI2a29c=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2w5w-000585-6h; Wed, 28 Aug 2019 11:26:32 +0000
To: noel.power@suse.com
References: <20190724225102.6A7EC1401D9@sn.samba.org>
 <430d65f0-cfd4-798d-a2de-8ddb8e7f8b78@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: ctdb_pkt_recv_recv regression (Re: [SCM] Samba Shared Repository -
 branch master updated)
Message-ID: <dfa5d76e-90ae-b066-76bf-cd36e703783b@samba.org>
Date: Wed, 28 Aug 2019 13:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <430d65f0-cfd4-798d-a2de-8ddb8e7f8b78@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="7Crxg5RI8YQLKp5oxzX4835JmD5G4zm07"
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
Cc: Amitay Isaacs <amitay@samba.org>, samba-technical@lists.samba.org,
 samba-cvs@lists.samba.org, Gary Lockyer <gary@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7Crxg5RI8YQLKp5oxzX4835JmD5G4zm07
Content-Type: multipart/mixed; boundary="2C1oJQWzPl1uBTwY0D7ezYPtaEWNatpK6";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: noel.power@suse.com
Cc: samba-technical@lists.samba.org, samba-cvs@lists.samba.org,
 Gary Lockyer <gary@samba.org>, Amitay Isaacs <amitay@samba.org>,
 Martin Schwenke <martin@meltin.net>
Message-ID: <dfa5d76e-90ae-b066-76bf-cd36e703783b@samba.org>
Subject: ctdb_pkt_recv_recv regression (Re: [SCM] Samba Shared Repository -
 branch master updated)
References: <20190724225102.6A7EC1401D9@sn.samba.org>
 <430d65f0-cfd4-798d-a2de-8ddb8e7f8b78@samba.org>
In-Reply-To: <430d65f0-cfd4-798d-a2de-8ddb8e7f8b78@samba.org>

--2C1oJQWzPl1uBTwY0D7ezYPtaEWNatpK6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Noel,

can you please have a look at the mail I wrote a month ago,
I think we need to fix that up.

Thanks!
metze

Am 26.07.19 um 21:31 schrieb Stefan Metzmacher:
> Hi Noel,
>=20
> thanks for fixing clang warnings, but
> I fear the following changes are wrong.
>=20
> Can we have SMB_ASSERT(hdr !=3D NULL); after the if statements with a
> comment explaining why it's there.
>=20
>> diff --git a/source3/lib/ctdbd_conn.c b/source3/lib/ctdbd_conn.c
>> index d5fac572d3c..8a8fbec4552 100644
>> --- a/source3/lib/ctdbd_conn.c
>> +++ b/source3/lib/ctdbd_conn.c
>> @@ -398,15 +398,16 @@ static int ctdb_read_packet(int fd, int timeout,=
 TALLOC_CTX *mem_ctx,
>>  static int ctdb_read_req(struct ctdbd_connection *conn, uint32_t reqi=
d,
>>  			 TALLOC_CTX *mem_ctx, struct ctdb_req_header **result)
>>  {
>> -	struct ctdb_req_header *hdr;
>> +	struct ctdb_req_header *hdr =3D NULL;
>>  	int ret;
>> =20
>>   next_pkt:
>> =20
>>  	ret =3D ctdb_read_packet(conn->fd, conn->timeout, mem_ctx, &hdr);
>> -	if (ret !=3D 0) {
>> +	if (hdr =3D=3D NULL || ret !=3D 0) {
>>  		DBG_ERR("ctdb_read_packet failed: %s\n", strerror(ret));
>>  		cluster_fatal("failed to read data from ctdbd\n");
>> +		return -1;
>>  	}
>=20
> This is not strictly a bug, but it's makes the code really unclear.
>=20
>>  	DEBUG(11, ("Received ctdb packet\n"));
>> @@ -1038,7 +1039,7 @@ int ctdbd_traverse(struct ctdbd_connection *conn=
, uint32_t db_id,
>>  	int ret;
>>  	TDB_DATA key, data;
>>  	struct ctdb_traverse_start t;
>> -	int32_t cstatus;
>> +	int32_t cstatus =3D 0;
>> =20
>>  	if (ctdbd_conn_has_async_reqs(conn)) {
>>  		/*
>> @@ -1945,7 +1946,7 @@ static void ctdbd_parse_done(struct tevent_req *=
subreq)
>> =20
>>  	ret =3D ctdb_pkt_recv_recv(subreq, state, &hdr);
>>  	TALLOC_FREE(subreq);
>> -	if (tevent_req_error(req, ret)) {
>> +	if ((hdr =3D=3D NULL) || tevent_req_error(req, ret)) {
>>  		DBG_ERR("ctdb_pkt_recv_recv returned %s\n", strerror(ret));
>>  		return;
>>  	}
>=20
> This is actually really a bug, in case  ctdb_pkt_recv_recv fails
> we'll never run tevent_req_error() and the callers callback function,
> so it will just hang as hdr is always NULL if ret is not 0.
>=20
> Can you revert this and add SMB_ASSERT().
>=20
> Thanks!
> metze
>=20



--2C1oJQWzPl1uBTwY0D7ezYPtaEWNatpK6--

--7Crxg5RI8YQLKp5oxzX4835JmD5G4zm07
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl1mZOMACgkQDbX1YShp
vVacbw/9FWdE6DS7eswb5V08KIbrrQXOPHv6KDdZMy49u8qE18LXsN7nOBb5oDv1
HZbt7R1Xm131lZIhZoaOJH/N7iFnVpPId4+pMWFlGdy6Nf+a7XNwQFpRlxq/ZZZ7
MYaUX3cgpElFkBgPpBkivFofqpRmh5Sl2hDbwoDzDC+f0PmPXI4yyY8XNPvKRrkV
RGKKWIN3YrH68kR5vHF9qcrhfey9VnBDYtAo225fnqi48qefuEdOg0YdwAJEzush
Xwcw1X+G06I/7uXMAn7c+pSSJt07T/m/PrzAezlxfUymxrdUVF65e/QCCTX6RMSU
5ZbqeTy7t07PW1KBRXdaULmlNEIx7m2Om1S2jmj88fZ6M2BWL+Pr1ofmAzzfGFpf
OtT4F1rG8eci7xz9uYqypsCo7B/bWsA/fJU4Uy0ERR6Dwr/FoVA4Lo6BpBPLiAEl
b6nUpClwPgLzAi6QtRid4utKwVltlcIizYCj/DelVx3vHKAK6GVBF6/deU17Wsdf
T1M8Wm9kDLZ5JLeT1GXtvj1GGCfR4XKJPtues0+qWO/2y6t+nh6excuJUI+EqR6z
6q3TXk2qFm7+EQnkhJJrYiIweGDKQR0hqgDVQVq479IThwcgI8tzUqjapk+vd06m
+xioryBcekJS2KEhlVLE2raiSDl6v28QA+Q9iVWrkRfwwHCYCxw=
=hDqT
-----END PGP SIGNATURE-----

--7Crxg5RI8YQLKp5oxzX4835JmD5G4zm07--

