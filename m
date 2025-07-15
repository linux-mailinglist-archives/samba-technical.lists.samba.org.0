Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4867B050D0
	for <lists+samba-technical@lfdr.de>; Tue, 15 Jul 2025 07:19:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PbP2GN4qJMHbZFPap5fEa9/a3tNi7tUkHera2I51/TU=; b=tJM1BlHk0OVvPogBw2rD1cZs6l
	JjWaQVebf3peGRgq18w+wZBDvQvYNnKkygIhsepoUDcwAlXYQlVsuIsPBRPgmSgFk1MQGpOd7dqlM
	EGSwH96lT5HbHR85V3xTT9iReTc/pl22OfcnSHhwJEXfXVEr7DbGkJ+uNUyhMeKgV7104p9RLQyv7
	jdXfv1uLIi2nv4Pkt160abuwYJ3TgpXpIjR/64G9NNzHje8ycqEw5xkeGhne0QPAl4QlHFMuUOt4m
	Oi9drZ5Ynz9NOaUf+I6bJ371oOb7qALm3z6NSCiD5Tjoka1gx79RQ+A51yRvdf0dnsz/BEMimYxCj
	BBm1sidw==;
Received: from ip6-localhost ([::1]:28420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubY3p-00BEnB-4u; Tue, 15 Jul 2025 05:18:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31188) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubY3k-00BEn4-Fe
 for samba-technical@lists.samba.org; Tue, 15 Jul 2025 05:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=PbP2GN4qJMHbZFPap5fEa9/a3tNi7tUkHera2I51/TU=; b=Gk1TkwrUxPZCjWzBppW2fmDzcO
 1Km9bmR89Eigx8zfj8abXsWpmJ3yFarSX/sw/ndK9jx2q/cCOsI3zROsGpRCb7DywA5qU75yawMfY
 jPECQnN1caIlVU4JuHI7YMy3glOe0BvnvKfx21wLdpNTSO5a8DU444/U1p38DmmqXaWMlJbo/NniT
 I7YEiR/Wy31VKSk+38/EMJV8+o5gEqZ7IV2XvQrSUQPMhQhiycvZsc3DA3l6iQJ2X+sgPirsjDdF4
 4G79TAGFv5hfQ7QA3KfdEo1zMCX8dhSdKKzprQ9KpfJtjAAIlVeBAaoe415nbJnw4OeuCSvzExlsS
 +wZE6Tff28iaeD/quxjTpf5qBpznvZEPtFqj0oaj5n2pp+l1285iEbEZNPIIGfgkIO5IULeCdeJMn
 vr+UTjga6oXIrvG72hnTEqPzX2o6oJ5xdLk/Nakft+G8uwIuCtGoJ7hV0LCxrTNG1KCq0W8y31sFY
 Ss0lywN1I23AZg5NmZ5wfZ3e;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubY3j-00FOzm-1y; Tue, 15 Jul 2025 05:18:31 +0000
Message-ID: <f0fa321e-921f-40f5-b202-9cc751f2268f@samba.org>
Date: Tue, 15 Jul 2025 07:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][SMB3 client] Fix SMB311 posix special file creation to
 servers which do not advertise reparse support
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5mvA3NQp8BDj_v-k3YRUR9Xe7u5XmaM_XQBP4xJts0R6bA@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5mvA3NQp8BDj_v-k3YRUR9Xe7u5XmaM_XQBP4xJts0R6bA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8fp6l08Q2ug7TRK0IgoZDlQi"
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Paulo Alcantara <pc@manguebit.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8fp6l08Q2ug7TRK0IgoZDlQi
Content-Type: multipart/mixed; boundary="------------sLdlVrOgOPr2QQRPYaiE2r40";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Paulo Alcantara <pc@manguebit.org>
Message-ID: <f0fa321e-921f-40f5-b202-9cc751f2268f@samba.org>
Subject: Re: [PATCH][SMB3 client] Fix SMB311 posix special file creation to
 servers which do not advertise reparse support
References: <CAH2r5mvA3NQp8BDj_v-k3YRUR9Xe7u5XmaM_XQBP4xJts0R6bA@mail.gmail.com>
In-Reply-To: <CAH2r5mvA3NQp8BDj_v-k3YRUR9Xe7u5XmaM_XQBP4xJts0R6bA@mail.gmail.com>

--------------sLdlVrOgOPr2QQRPYaiE2r40
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNy8xNS8yNSA1OjMxIEFNLCBTdGV2ZSBGcmVuY2ggd3JvdGU6DQo+IFNlZSBhdHRhY2hl
ZCBwYXRjaA0KDQphY2tlZCBieSBtZS4NCg0KVGhhbmtzIQ0KLXNsb3cNCg==

--------------sLdlVrOgOPr2QQRPYaiE2r40--

--------------8fp6l08Q2ug7TRK0IgoZDlQi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmh15KYFAwAAAAAACgkQqh6bcSY5nka+
rBAAm3DEnr/Lwi9bPx08E0+adlnisXoEzBGnUzREzpy0AggC3ZlhgKAz+/16uUUmyv5DjphG0bHY
Z8zIyfsUTTNm0SQre2eofydzxYNZG2/fNlGRq1LmOD3COcGvjUI3Qiy9ZhfOuqmEYcmny70G+yob
UJ5WycPLbTxN3Vpx0RgEOmTy8ePR6RaKfLhSqVlTMXcpebU3XRRCb145cP/2JInhu/VpBFPYbOtt
idCz+Xxe6hNRKQfCqsCkgDXuLMEwNO07cvwFVbqS61QEroUFhCT9RuEMvPD1cnOVZjQasJx/c5t6
r6fSaXAoIfFjRBRnmyLOdJBuEjQYeaOvdOR09cC3q9n75rRnuWQ7tF8jRXvKiEaNhb5be54vssbE
hsjJYIs+DqtRobw4+zZlqKQxuDWSVaCcb7d2T9aSYvcIJS94vb2ozBApInAPcIQAGkvxbEey59pg
2uRIMBpP7aKtpc1Tt7T+xykOGS5nLCJ7utcNrLed4rIl+8M0CktdhBQf1lTDnvwCi9L5jn5sQWf0
7FQj4VB7tjaXqzPttkGJC8i1uKlNOAfr0dTI05SfevUbIz7hgR+yLLpBeZonFzJfYSO+iS6kT0td
iIn/lkG92iTSUo+fKfjkLFxTmFMcGfsbu7Q0IqWVq8a3H4jq6teXDegVmz4TJk3zo760iHVx+GCH
Nrg=
=RjSN
-----END PGP SIGNATURE-----

--------------8fp6l08Q2ug7TRK0IgoZDlQi--

