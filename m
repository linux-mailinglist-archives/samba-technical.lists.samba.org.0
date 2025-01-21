Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD38A17946
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2025 09:30:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=bDxiUpooTdmTGruBAfaoZogAJQGM0Egaju8234TYOeU=; b=0xMQnByKru6IF2p4G90ZFwsnNK
	i0OYRWrmC1la5c3/+imY5Zx/ssDpHmX2BaOb7E+VqfdeNg8jK3Np86MsVddK9lVXPD2RRO1YmL5yF
	qfTwewKw+CE8vriRtqo8TTBFVOiJBnKj66omvZpRZ/X0hEffVjQbeE8XTUbIHdJylikVJcBp9ETd0
	98Mn9cUDDFoNfRT2vZ5XafQi85x3flM4a2M9iIYGyT1buEWmQGlgf6mkOgwiF+ZvkLHbwzBlAo0wz
	RS4LVzgP75MkY+DSV/1w8brfGEBytPvyTCg7ADKaqJpzvd2+YdwrrxIUMAvfld4f5SAvqFUrItf6+
	7O6g4JlQ==;
Received: from ip6-localhost ([::1]:43790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ta9eS-008tdI-SF; Tue, 21 Jan 2025 08:30:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35036) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ta9eM-008tdB-8r
 for samba-technical@lists.samba.org; Tue, 21 Jan 2025 08:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=bDxiUpooTdmTGruBAfaoZogAJQGM0Egaju8234TYOeU=; b=H9O9/GnSMAhzQw6uHSgHEna78r
 tLdJ9DvJFGbrrk0rmQ+3S+7YWzrxjvNmqwnNpi0CcWo8BBDp1jSjN7xrK0Wm0v+cDiVTQ3Cms6s+T
 JTtmKX8cPw7hB5avzPvGA44wx8fdCJHX/SxECb1uZK8A04xnMM2As1uwpToCI0Y6t56STJgAtSeaR
 J+9kYU2m4JPYdH7g5B36xRGPM2Mod3V7tQY7SB2dlJI5YxawDQly1PuAloDmqCWTbU+5vbxZzYan1
 c3wlbZz28tu2RH/dCKHByw1mF4tMc2TjntPUUqXDTu7anEwcsKFWNtOPfCbua7FLWBXmlMvWJwvZA
 Tz/cDLNxNUGVgDMC440ovjmzxLI9BZY0UaqoRm3MGZcPuAgdeSzxoyKx7r9gx3h07BYfNaoQVbuFL
 zfyVGW5BPRvyYcooNMPYRHApX0j1OZlG47N7MvEoEMPCUv+b/jU5UlxXxpOfb8LRSsIRhZywFF5Jg
 luVhTGFrBLY0lnp7dwPBmdSS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ta9eJ-001D7g-1m; Tue, 21 Jan 2025 08:30:15 +0000
To: Steve French <smfrench@gmail.com>
Subject: Re: Local KDC and Samba
Date: Tue, 21 Jan 2025 09:30:14 +0100
Message-ID: <19764530.fSG56mABFh@magrathea>
In-Reply-To: <CAH2r5mts9UoESoG-NMf8jWobVtd+ym+ujoHpxpVFf0CT2vwGWA@mail.gmail.com>
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
 <4942506.OV4Wx5bFTl@magrathea>
 <CAH2r5mts9UoESoG-NMf8jWobVtd+ym+ujoHpxpVFf0CT2vwGWA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Alexander Bokovoy <ab@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 21 January 2025 06:59:25 CET Steve French wrote:
> Do you have a sample wireshark trace of SMB3.1.1 connection to Samba
> with the new peer-to-peer Kerbeors and/or IAKERB?

Yes, I do. You can find it here:

https://xor.cryptomilk.org/samba/iakerb/

However that wont help you. See Alexander his reply. You need to use GSSAPI 
instead of raw Kerberos in cifs utils. You should try to do IAKerb first and 
fall back to KRB5 mech otherwise.

What I haven't implemented yet. If we get a krbtgt via IAKerb we should allow 
to store that in a user specified ccache or the default one.


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



