Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD747D0F8D8
	for <lists+samba-technical@lfdr.de>; Sun, 11 Jan 2026 19:17:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=vZSjFMm/Wp5z10kB7GXwvg/1nh4GigItDf4dCDx4/uA=; b=klaSAGEW+Lc40uvl+E3aE95z1m
	jEPBYASyL2PxP8MzIY4z5ZRtaFWAyx1avFZ/T0g6heKTXOD8TEFvyJlzay/XGp+xmdRTWojo632Qb
	WnZFyEkxO2tKjv52Qi82i3s4NdedHlDPI7IKvietfrRYgwJC3LcUe/bTj5zrkD1wtawJOgoOnoTqv
	2hejStEwBxJ3NVeugaJ72Z6eXL10yfINX6+0NcPPFFVI+sY7e4uqn6EthVk+aG43MRNnXSGOIl9FW
	2yXRoNjdTNFAG7aC27zBvnsR5Nos7iOp3lgJRJqY3Uj7RrPqYLGdWmnSNHaSo2kugW8zz80sEqKx7
	fHvZPF8w==;
Received: from ip6-localhost ([::1]:47946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vezzp-001uPu-8e; Sun, 11 Jan 2026 18:17:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38892) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vezzi-001uP1-HU
 for samba-technical@lists.samba.org; Sun, 11 Jan 2026 18:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=vZSjFMm/Wp5z10kB7GXwvg/1nh4GigItDf4dCDx4/uA=; b=B7RuxOc8WBmJP9Khuk4W7OjnSP
 V6BJByHvlg2e2qSzLzSspwsSMmxROZXrOv71ZLPQvPKBSk6xQYvSt7c2c0CkBPOB3K5xAm0l7laaM
 78zQTph8nfwAsTWpxOEoDj6exhlfz/ax6PIpSO+2O7Hiug3G+vB6JKeuu2zWFOYhJrxuLJ/58+3yo
 XrGIPuldLUZLdqd5d+aVnAQbPz98B2PldjACoE+d2SNNIlPr46z6KFZY/M+FV9ph/U8NZaHTPYXot
 h4qblI0yCZxQpFeh88al5VICixLjh/UzKtNbUI3oQAkH4tWSqybTrryqD6jL9ZIpXUuWlcRTWheps
 H8olFIyMJwkcUoXeuEFK2/gtcm3mTMaHD2OEPC1wYFKAnOLqVM2fcF5rXHhXXHxKPUM6uU5RcxUu0
 3ddDGqX/2KDM23konFVmliEGth3lGZqB3ezzD9bB6frfnPPHAUwunxxg2aWTnNL60EzgEnDUDxTSx
 SGCJ51EqTm50UJsQTdujrubz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1veDCS-003dXA-2J for samba-technical@lists.samba.org;
 Fri, 09 Jan 2026 14:10:48 +0000
Received: from bjacke by pell.int.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>) id 1veDCS-001y8Y-3P
 for samba-technical@lists.samba.org; Fri, 09 Jan 2026 15:10:48 +0100
Date: Fri, 9 Jan 2026 15:10:48 +0100
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.24] Samba 4.24.0rc1
Message-ID: <20260109141048.GA465143@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Samba 4.24.0rc1 is scheduled for 2026-01-20.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.24
has been updated accordingly.

Bj=F6rn

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCaWEMZAAKCRAxQwafzsNC
P6qLAQDo1ZhdIOgjDarSEErA947n3eas/rRRLZtNWARgiuYmgAEA0MLwJjuXMGv8
jIfwQK2odutECOreFRJhX3LjSL67YA4=
=3oQR
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

