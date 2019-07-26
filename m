Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174077231
	for <lists+samba-technical@lfdr.de>; Fri, 26 Jul 2019 21:32:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YRuWsVRiUua73Q6LCQl1n8qhRaB4tKUsMaLt8bflMds=; b=Z8R4G+4mlPyOmX+0+UF6oHxnpe
	EzMtAfsdh/oAw5BGSGQnLgh7KfXfG16lquQyn+vPR0QE5IIZhJ11W7NJa4KOsl66rQKL38JB9K0PM
	50jvb//dYYaG7zbSf1DIXMfeAB9O/GQsu5ycWbnN1lZ4LMM0WlZGyLP5RX4zpqFjn1ZCD6ch+QiW/
	+WBUVGUG+jw8a3FogGdY9CC/qi0q8qTYiOeV0jLD0vu0dNvTp04V/SsQnTm93pOdVqpFKcW7OKt6n
	ADngpfRlzvCiJrLpZ6f+xTCEzp11vU0BgCXubtptJcof57Pg0z0Lw8p38xFKKqJJ12Qi8MpwZ51Mr
	IrTrBebw==;
Received: from localhost ([::1]:46554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hr5wC-000Wqt-T7; Fri, 26 Jul 2019 19:31:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48920) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hr5w6-000WqY-A7; Fri, 26 Jul 2019 19:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=YRuWsVRiUua73Q6LCQl1n8qhRaB4tKUsMaLt8bflMds=; b=cd1X39yFbDP4bWngqQ1DFg1ohT
 MHv7gN4geXZIXGViWspiiJULkVAp2yhQflV9VoC3IyQfOHdNUxSTZacx7mreLoaGrdGW6nkzBxqFN
 wOFLMgFiQ+RNEo4mLSPAAI1LIB7+podVPFuFrtqUlGf9kElJyg4BnIAKhuLY3lVQvfNU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hr5w4-00074L-JM; Fri, 26 Jul 2019 19:31:24 +0000
To: noel.power@suse.com
References: <20190724225102.6A7EC1401D9@sn.samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Message-ID: <430d65f0-cfd4-798d-a2de-8ddb8e7f8b78@samba.org>
Date: Fri, 26 Jul 2019 21:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724225102.6A7EC1401D9@sn.samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="l2O8J7iHS4ASCP2pRZmjctsmCE2dmDe3H"
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
Cc: samba-technical@lists.samba.org, samba-cvs@lists.samba.org,
 Gary Lockyer <gary@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--l2O8J7iHS4ASCP2pRZmjctsmCE2dmDe3H
Content-Type: multipart/mixed; boundary="R9JKRPFscAgqhL9hos1iaKz2983C1TUJ4";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: noel.power@suse.com
Cc: samba-technical@lists.samba.org, samba-cvs@lists.samba.org,
 Gary Lockyer <gary@samba.org>
Message-ID: <430d65f0-cfd4-798d-a2de-8ddb8e7f8b78@samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
References: <20190724225102.6A7EC1401D9@sn.samba.org>
In-Reply-To: <20190724225102.6A7EC1401D9@sn.samba.org>

--R9JKRPFscAgqhL9hos1iaKz2983C1TUJ4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Noel,

thanks for fixing clang warnings, but
I fear the following changes are wrong.

Can we have SMB_ASSERT(hdr !=3D NULL); after the if statements with a
comment explaining why it's there.

> diff --git a/source3/lib/ctdbd_conn.c b/source3/lib/ctdbd_conn.c
> index d5fac572d3c..8a8fbec4552 100644
> --- a/source3/lib/ctdbd_conn.c
> +++ b/source3/lib/ctdbd_conn.c
> @@ -398,15 +398,16 @@ static int ctdb_read_packet(int fd, int timeout, =
TALLOC_CTX *mem_ctx,
>  static int ctdb_read_req(struct ctdbd_connection *conn, uint32_t reqid=
,
>  			 TALLOC_CTX *mem_ctx, struct ctdb_req_header **result)
>  {
> -	struct ctdb_req_header *hdr;
> +	struct ctdb_req_header *hdr =3D NULL;
>  	int ret;
> =20
>   next_pkt:
> =20
>  	ret =3D ctdb_read_packet(conn->fd, conn->timeout, mem_ctx, &hdr);
> -	if (ret !=3D 0) {
> +	if (hdr =3D=3D NULL || ret !=3D 0) {
>  		DBG_ERR("ctdb_read_packet failed: %s\n", strerror(ret));
>  		cluster_fatal("failed to read data from ctdbd\n");
> +		return -1;
>  	}

This is not strictly a bug, but it's makes the code really unclear.

>  	DEBUG(11, ("Received ctdb packet\n"));
> @@ -1038,7 +1039,7 @@ int ctdbd_traverse(struct ctdbd_connection *conn,=
 uint32_t db_id,
>  	int ret;
>  	TDB_DATA key, data;
>  	struct ctdb_traverse_start t;
> -	int32_t cstatus;
> +	int32_t cstatus =3D 0;
> =20
>  	if (ctdbd_conn_has_async_reqs(conn)) {
>  		/*
> @@ -1945,7 +1946,7 @@ static void ctdbd_parse_done(struct tevent_req *s=
ubreq)
> =20
>  	ret =3D ctdb_pkt_recv_recv(subreq, state, &hdr);
>  	TALLOC_FREE(subreq);
> -	if (tevent_req_error(req, ret)) {
> +	if ((hdr =3D=3D NULL) || tevent_req_error(req, ret)) {
>  		DBG_ERR("ctdb_pkt_recv_recv returned %s\n", strerror(ret));
>  		return;
>  	}

This is actually really a bug, in case  ctdb_pkt_recv_recv fails
we'll never run tevent_req_error() and the callers callback function,
so it will just hang as hdr is always NULL if ret is not 0.

Can you revert this and add SMB_ASSERT().

Thanks!
metze


--R9JKRPFscAgqhL9hos1iaKz2983C1TUJ4--

--l2O8J7iHS4ASCP2pRZmjctsmCE2dmDe3H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl07VQgACgkQDbX1YShp
vVYNERAAiR3W75DMDkqfHb6lgTl2aY/Ls/wfCy234vILlBoY/SusSJLqY4+ERKWz
lZDon1SYHWbAmUiDlca9FEfTSHJj6WiFLsRyXCGYEj1avS//blyU5R76FnujVgz/
jM1X4ucGgzKxwM6lc6/VdNzaS7yqU4HXsHm1MWBI8wFN125h4SPREYd55h6tLq9G
FbWrwCWO9Zg0gNwk7M+PGR0B4jJeNkwuo5NbbIVaWt77Lr17qE2LN9uyhoXa/7PJ
fl22nz/mR/cKdLULg58BgBsvLy/9a0GzcyQyLY7eWQtakLnIrqNI0F+DG+zgav3/
zG9Pz7em0W84DHqIkT+kBQtQKUJ1bVdtxcQgfgjcWicl+skyeaXLBGb1k/RCJvzN
mWl6e5tIOnXSg6jiv3uKl34HFhVHJ9LRYYshdhjI7xB5Ydj9j8eN2+onQhgAJSrs
DHioMHheqkFbfjPPbS44Ga375ImLiQ4CvwBCq5HnWr5DDYh7VGihV7pjisk3rlx4
2q9g0oGDLaV1tD3ahSevwXLaUt/tnJcCifRpJPQk6UY4zjBmTQeT2GwyWa6EmtPQ
PDgsqdFP1fWEvE+kFkfMfwK8YDgYjaZS2GnqNFaLncACKCzC9/nQMlpIRm1TunNI
Ab7LH5TyTebxfmAr7J8AF8y5yh0UpRhfJH3nG1WJraMbuWYa2do=
=Vr/p
-----END PGP SIGNATURE-----

--l2O8J7iHS4ASCP2pRZmjctsmCE2dmDe3H--

