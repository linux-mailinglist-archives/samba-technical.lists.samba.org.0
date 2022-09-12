Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF735B61FE
	for <lists+samba-technical@lfdr.de>; Mon, 12 Sep 2022 22:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4dCSbxz2MYRuiknH5WO2y3t8N4zK2Ic4M4j2tQIM+9Q=; b=FKqB0vn2Urck2+L0fUXBxiyc0R
	9ZM3Obj8HkMCFjmMbiRFtxTi33YdXDGfHwdlw0wWzxZOKX3DrB1Vdn65fjw4gf2HttDeaVeZoGXpg
	YOWDkJIhRt1jm8dWOSqAxzaOIffqQiOaa1oGoDs51mugl3PBRm1fKe/sMnWMxCMnW3GTQ9Mcei1mn
	wr/ryRPVVeTIRSDIVaaz+nGI7IgzMdWLCcH7UQ4oIrSNfj5Ian1M1aFxy2PRZDx8Z8zMgmd3utDRM
	pp3io2ibOp3K8DwenGaKPPo35YIcNcVTknt21eA6ERGmin7ZTey0ZfEahVvAencLtMKXQrCaNcqTn
	1TPasu6g==;
Received: from ip6-localhost ([::1]:38302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oXpdk-000D5a-2O; Mon, 12 Sep 2022 20:02:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36688) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oXpde-000D5Q-TJ
 for samba-technical@lists.samba.org; Mon, 12 Sep 2022 20:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=4dCSbxz2MYRuiknH5WO2y3t8N4zK2Ic4M4j2tQIM+9Q=; b=ELpmWLnJUDkmHBNMvTXBEfR8ec
 GtxWIxaRnVuIXql7ZtvS+05OZQQzBFbF8wRf+5Zl7no9I+7sRVZ1RzzEGlLyj2rFjwaqT2Xrii/z1
 TRV+lern5NinVjUOG0asZaFatNKCGe5b1cfLfvcGxdjA1Qetfbeforl2Ekwkc2gETbwnIAbXyLVv1
 GXJkyhIxCDHumscyNT3Ia9laEtlDj6qiJY+kkvKLB7UlJfsSKRDKYNKOwJkJI2pL7qmXLETHwE8Om
 U/+UG0TT7SBHk+5TpNN2oqnc0A1Rf66lk8JTiYezTKNrmW6RqU1OjjvYRfNz1jjjl6e4ZXYKy4GcS
 471GwdU3lXMysnG4bQBiJK3kF7I3YoNIJaWNG2lmZAz+wKpM00r0z1obZV4RUspnUaFQ2ibO/bREq
 NfM3VYiJGHaSKP5bAzOqJnIasHgz9dRAXs4FhWTlpfV4fwwOPiq3DNdTGQfZS4s8dmro9jj8lgJ+Z
 m35H+2BBRCFX13FEF8p0Bi3W;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oXpdd-0006rd-Ft; Mon, 12 Sep 2022 20:02:38 +0000
Message-ID: <cd32ea24c187b846e67a3142eae638b24615b9df.camel@samba.org>
Subject: Re: samba-tool dsacl management
To: Christian Merten <christian@merten.dev>, samba-technical@lists.samba.org
Date: Tue, 13 Sep 2022 08:02:34 +1200
In-Reply-To: <df7d1e4e-e5ba-4a70-9b5a-b5a1cf138cb7@merten.dev>
References: <df7d1e4e-e5ba-4a70-9b5a-b5a1cf138cb7@merten.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2022-09-12 at 20:27 +0200, Christian Merten via samba-technical
wrote:
> Hello,
>=20
> as far as I know, the capabilities of samba-tool for managing DSACLs are=
=20
> quite restricted (only getting the whole security descriptor and adding=
=20
> new ACEs is possible). Is there any development going on on this topic=
=20
> currently? I could not find anything in the roadmap.
>=20
> Since I am currently writing a tool for linux based on ldbsearch and=20
> ldbmodify to configure DSACLs, I wondered if contributions on this topic=
=20
> to samba-tool are welcome.
>=20
> Best regards
> Christian

Tested contributions are most welcome.=20

https://gitlab.com/samba-team/samba/-/merge_requests/285

https://gitlab.com/samba-team/samba/-/merge_requests/284

https://gitlab.com/samba-team/samba/-/merge_requests/283

Was the last attempt in this area, but it was not tested so didn't
land.

So again, contributions are welcome, but we really do need them to have
tests.

Andrew Bartlett

--=20
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


