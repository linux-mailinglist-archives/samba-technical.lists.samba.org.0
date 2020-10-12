Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C247928B0E8
	for <lists+samba-technical@lfdr.de>; Mon, 12 Oct 2020 10:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=HkVI/aD2NHVvjxM4S1uk26NwzQaJzRx8qEiZYjy/TFk=; b=VSW5daO71umfV4Qt453gkpN3//
	PMN6IrlGztCll4rmTWQmNQcoetog5CaNmxwlyGA121s7lKCEluafbqon6zshnvmJqYlBTsqshL+my
	401mQOG68ohjbUgHiXCjtTmueOX6DkOq/IPWkcqypF4FjU/mEyNTWBcnoSiUel8bTo5ws3AeZubx2
	Lb0BNN1xuJYCpzT2dAAJ7m8t5PpkUMum3lo19vnf9/5FBCAXp9GHnT9SXXNh2D6g3xuJeiqaI5jAv
	q0PIcOMz2AuPvW+sa9Ugkv7mJzAP+VCK6906dk7jwjmyLIZlR1Q9FMKPjyfu23X1OuIRtkmVwZblb
	9U1kLMPA==;
Received: from ip6-localhost ([::1]:29950 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kRtcD-00Bi4Y-8Y; Mon, 12 Oct 2020 08:55:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38140) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kRtc8-00Bi4R-13
 for samba-technical@lists.samba.org; Mon, 12 Oct 2020 08:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=HkVI/aD2NHVvjxM4S1uk26NwzQaJzRx8qEiZYjy/TFk=; b=VK4RgHKuS1f7rp6zeQILHyrzi+
 sXzF2gqvycwF0/IIGkMI60vOWjJ/D+61mtj4ZTMo3rxUOqe1IVXEbM7vAd3yfAaj5v91hEX5MSjtj
 stVEVSc2CrnMua4r2JKFbSV3notC5g7JFsGUk2kcsJEHP3mlRbpB0G9QSRYjhgwkAmX64WBapvmKt
 zGDqXg0aRNhOq6uBEmWhZQdANCS0JzwxPXV0KftfUNqFCPXyKf66f2klbOBXVsXCZ4HDfI03VjI3w
 z4EHQqjBAAGYKMLvxaSFgoXVjiqGmmVCFRo4fKNRhRioqNJGDmqPPE0R9I5Kqx74NwYky2O9dR80t
 I7tW7ITsmee7AxmhNtMvHjh5CyOWGLqWrwDU/GcGDjKhsvlkSRm7AM962Dajxnjr4g2JdAVIz70Ur
 kGy0s39E//TFS8QljPc4wSLFeWuAs7eR1nolwaV7pnMMw8Gze2g1Z9pRN426XxxIUqszUztG+077o
 vyH8p8u/mzJ/eQGGvLGWy7V/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kRtc7-0006tb-6S; Mon, 12 Oct 2020 08:55:27 +0000
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
Message-ID: <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org>
Date: Mon, 12 Oct 2020 10:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="1xBAiiFv4DriJOiAGt5FJMgUxDsBsEZxX"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1xBAiiFv4DriJOiAGt5FJMgUxDsBsEZxX
Content-Type: multipart/mixed; boundary="z5JE0Fm1tD64P5CwRcjvRmez41pccxajy";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org>
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
In-Reply-To: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>

--z5JE0Fm1tD64P5CwRcjvRmez41pccxajy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 11.10.20 um 03:25 schrieb Steve French via samba-technical:
> Add defines for the three supported signing algorithms
>=20
> Signed-off-by: Steve French <stfrench@microsoft.com>
> ---
>  fs/cifs/smb2pdu.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/fs/cifs/smb2pdu.h b/fs/cifs/smb2pdu.h
> index 4dfb51dd7065..5932fc0dc62c 100644
> --- a/fs/cifs/smb2pdu.h
> +++ b/fs/cifs/smb2pdu.h
> @@ -323,6 +323,7 @@ struct smb2_negotiate_req {
>  #define SMB2_NETNAME_NEGOTIATE_CONTEXT_ID cpu_to_le16(5)
>  #define SMB2_TRANSPORT_CAPABILITIES cpu_to_le16(6)
>  #define SMB2_RDMA_TRANSFORM_CAPABILITIES cpu_to_le16(7)
> +#define SMB2_SIGNING_CAPABILITIES cpu_to_le16(8)
>  #define SMB2_POSIX_EXTENSIONS_AVAILABLE cpu_to_le16(0x100)
>=20
>  struct smb2_neg_context {
> @@ -416,6 +417,19 @@ struct smb2_rdma_transform_capabilities_context {
>   __le16 RDMATransformIds[1];
>  } __packed;
>=20
> +/* Signing algorithms */
> +#define SIGNING_ALG_HMAC_SHA256 0
> +#define SIGNING_ALG_AES_CMAC 1
> +#define SIGNING_ALG_AES_GMAC 2

This isn't in MS-SMB2 yet.

Is this AES_128?

metze



--z5JE0Fm1tD64P5CwRcjvRmez41pccxajy--

--1xBAiiFv4DriJOiAGt5FJMgUxDsBsEZxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl+EGfYACgkQDbX1YShp
vVaG2w//brwEcCcuIry1uN5XcR2/xd/Z9lwDEgS7EVMx1rsxi8d6RU1B8/hP5enD
rhZgGN3GpKTsRiw2Xv2MrNKE+QckuQeRIfISjFXxpA4X1XOfHOqCrsgZlBIxxlV5
2aK0rFOSA9GZbmXZh3LoawvM740MI4p1iVkPVhKwEScgpKbqqT6d+kAgO4vWM5L2
jT8hsvFPn6qOS5800Ggke32trj9Jh/vM2a85Ip/kR5jYfPgTIZYHUhKoAOMaW1Aw
5OGRaYQOB5Ro8hlcgJnSpwEiUNFhfCGylr+tD7+dKBEKzC0OlmVFNx2a6MR8s814
sfGNX5kmF6dGmgD8rgKZHAAkqNxgXPzdZD/eyVpIBdfz9z/lgdQ4j4xDQBS+KeRI
wKyhDAn6w2tDF7LzMxuWiIbylc2lfvtj1rwzzt5gw3fw0KfGVchiewZmrmcxpF+1
kvxcLVkGCFiCZubhBoitTUtyIK3X1BhYXGfreQOsjgnND6yCeo/lOwKWqCErCa4h
bt9dTiZXgZJFnQhc5ETR0plJcechOgwersjqboztIkHjpM2yJ3YRIMEjE4yU4p9+
RoBsbms6Bprl78k2hGR6THQRzDKPW1D43r8Neh7YTL7GG/HmjszU4Ga4P5fZcrqJ
i/GlFVzMeHcBkvoNZ3fAnK8s6SvMX+vcnJpGlbwJXE7Fw6iFynQ=
=eYvQ
-----END PGP SIGNATURE-----

--1xBAiiFv4DriJOiAGt5FJMgUxDsBsEZxX--

