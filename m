Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333D4AFF26
	for <lists+samba-technical@lfdr.de>; Wed,  9 Feb 2022 22:22:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=tNf1f9YEnyo/o5N+U0meJWdeadDKFrGGlcpZOCboO2Y=; b=lebqKH6ZC05DbByO/78cQUEb2q
	oW4CdsuSdYIcR6hdU9GM8mKnJy0yTIPo9NviSneMQVflBgi5em7DFQE2a6hRlVNhyC9VfynfWM2eW
	8wJRJHLvwSZoo0XlknI0JxHCElyT5pjKZtpF38CtE7GAoAfXLYGv56UYxLnhISZlASgtSs+Hjs3iB
	8FWIysRhc0Cu13osoXkE8zHnozYRl0A9tPDRC0GXNBR9yjwRZaFS3XCQ36wUTr2B/SEK1UI5U0meY
	CNDu1k2x8h/1YjrNXEymMVPmO4tWMGV7lywA581XJqoyTsMD06vwJRA5c7FfRQZpfF8qEVyymvGpu
	4OpNkcFQ==;
Received: from ip6-localhost ([::1]:19812 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nHuPG-0061cu-9n; Wed, 09 Feb 2022 21:21:42 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:39205) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nHuPA-0061ck-Bs
 for samba-technical@lists.samba.org; Wed, 09 Feb 2022 21:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tNf1f9YEnyo/o5N+U0meJWdeadDKFrGGlcpZOCboO2Y=; b=lVI2iUofcAY+9XWyJqf1WXN7ec
 trtss9fXNTMGzat1GRfokR9IXe+HIeJfBYiqkB3RGm04jxvGzw3GKtdZWkU57cfiJbtLP+P+k9sOu
 a4SM2pwLSgZrgOHdCAHHIMHehCSfd0lIJYA6PulY2szxVbITLBmgLFdM/FIUtnCmjqcjebAVvk7IS
 fZlag3npjM/m669mrI6YJY0i3iseSi12V+czuluxIgfeonGrIlUTxgASdFbBdBwgekmyIExNvDMJH
 QRFndX6M3KWS3SIvpOV7VJPzmAvCfejpyQlJhImV3dJ87UYoPs2M59HnV8U5olR3EZvTRYVb47Pb2
 ANAui4QA==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tNf1f9YEnyo/o5N+U0meJWdeadDKFrGGlcpZOCboO2Y=; b=WwULsKLVzD5VoTdld+bcLOYTp
 xQqo7WZ+YEqjrma6MV6T4Z0tBYHg5Cb94PZ0lLlrcoovvFM94A/L4LsEtGRAg==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1nHuP7-0005jm-5C; Wed, 09 Feb 2022 22:21:33 +0100
Received: by intern.sernet.de
 id 1nHuP7-0002DW-2l; Wed, 09 Feb 2022 22:21:33 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1nHuP6-005TLb-59; Wed, 09 Feb 2022 22:21:32 +0100
Date: Wed, 9 Feb 2022 22:21:32 +0100
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
Message-ID: <20220209212132.GA1302635@sernet.de>
Mail-Followup-To: Andrew Bartlett <abartlet@samba.org>,
 Jeremy Allison <jra@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
 <4406c0a37ed78d50bef9d10198fb6e565e633588.camel@samba.org>
 <YgH8F7/VoCe0pUyv@jeremy-acer>
 <9366e519039acf37002ab5f99c9038d378550e4b.camel@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <9366e519039acf37002ab5f99c9038d378550e4b.camel@samba.org>
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
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andrew,

On 2022-02-09 at 11:14 +1300 Andrew Bartlett via samba-technical sent off:
> Bj=F6rn, after reading the discussion here is your position still that we
> need to retain LanMan authentication for DOS, OS/2, Win3.11 and Win9X?
>=20
> I would like to take a crack at the patch but it makes more sense to
> know your position up-front to avoid misdirected effort.

I don't think that "guest auth" is a really good option, but if it causes
trouble not to remove the code, then I really don't want to argue against i=
t.

Cheers
Bj=F6rn
--=20
SerNet GmbH, Bahnhofsallee 1b, 37081 G=F6ttingen
phone: 0551-370000-0, mail: kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen & Reinhild Jung
AG G=F6ttingen: HR-B 2816 - https://samba.plus/

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCYgQwWQAKCRAxQwafzsNC
P+l4APsHj2aFxEI/a56wMrYvtlOOCGAlVzalh8Hbx3aOHP4itwEA6o3cTC1TywZ7
JPh+rEsmKHVRiHnhzaRfYrvg/ddGGwk=
=5ffZ
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--

