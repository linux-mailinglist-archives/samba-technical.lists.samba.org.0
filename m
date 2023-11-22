Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A97F44B3
	for <lists+samba-technical@lfdr.de>; Wed, 22 Nov 2023 12:08:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=w+0DKsTHhj5w4zSct0LQHcC8CZVFJrwDJjhukUC6fCA=; b=PsEEHcqrUN4R/Elapgb+dgf+iJ
	V5Siv44LeXiEm5SRDJhhKY5zs+aO+eAW3Ovj4nq/PAXZNWZjA+75Xhc/2CYCLtTKPqCu4sresVOcq
	igtQIdn3mohQRo12rKAEb8d6v0H6gCdT2Is2QUdLFMK44q0OBgjXoVYYRI5sxIgjPmEcYVU9HJrw+
	i7VyVF/CoAjqnMRtxvOjur2df4SxSEczhM/xGIUYdIdX5mFhBuONUzcxJazTSP63gLbX1M0w1rJGd
	tDmUyxJzAJwhVJJlL/ajqOw2qYzDxhk1gBVHutK/+Ef5kuZOEb510eu/VrwhxsRGonkKpkGEMDimU
	GTEZ5DcA==;
Received: from ip6-localhost ([::1]:64436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r5l5R-009UDr-7n; Wed, 22 Nov 2023 11:08:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25598) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r5l5L-009UDi-56
 for samba-technical@lists.samba.org; Wed, 22 Nov 2023 11:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=w+0DKsTHhj5w4zSct0LQHcC8CZVFJrwDJjhukUC6fCA=; b=Mqzk5QPvk4yFKSiwzQgnDnjYNi
 1H8hGSqvynsjjkGqnepe+DVXBPQMM2ANb+yPlfoE8UvcgnL4fl5fxDXvPfi3psJ86mpSrP0X9LCQY
 iJ18wFswYX04Aj6zW2xxGmw3sqfiGvXg9PG9tdNYgx81umHosA0l5RQZeelUHlNuFZqbyUh/hWzQU
 RxrOTpxgK3CnvsV0wrHF9NGHdOSrbwha2CbifpZLA5SlxesuCgL6ThoXmb/ZFIKqwfdvGo4Mj/oXk
 j6B1AHdCUkujkDTtifOXa4cyZ7ZD8TovEYRMX2yZXYpotOCWjDnkATbYR1GPoqlQNtIlVwSfb6N/v
 65ohLWz2K3GIRIFoNw1YwpilXA8oDc8w0Fik4UZ28mIg3HjU3VlZr+Vz4fXVRTmIRY13w/0cfNlcF
 rA+lJYegEoiPsw5GW0p2cWN/Cyam+ToEYxAKfJuWekMRROLc+lCWPe3cRQBncBqox8A2MybY/hyyH
 gkYqf1TeZPAb8XSUVvuRc5LZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r5l5G-007ZiH-2E; Wed, 22 Nov 2023 11:07:54 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: Suggested crypto libs for Diffie-Hellman and Eliptic Curve
 Diffie-Hellman
Date: Wed, 22 Nov 2023 12:07:54 +0100
Message-ID: <2320390.ElGaqSPkdT@magrathea>
In-Reply-To: <81c7b2c93303aa93bc3b6747c7935e040afff238.camel@samba.org>
References: <81c7b2c93303aa93bc3b6747c7935e040afff238.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 16 November 2023 07:08:59 CET Andrew Bartlett via samba-technical 
wrote:
> For Group Managed service accounts, which we are working on, for
> reasons around RODCs and a few other things, Microsoft has decided to
> internally use a key-agreement between a 'root key' and a 'service
> key', both held in AD.
> 
> The password comes, as I understand it, from the key agreement derived
> out of a Diffie-Hellman or Eliptic Curve Diffie-Hellman exchanges.
> 
> This is all in MS-GKDI, referenced from
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/9cd2fc
> 5e-7305-4fb8-b233-2a60bc3eec68
> 
> I just wanted to check if there are particularly cryptographic
> libraries we should consider for this work.
> 
> In the past we have looked to libnettle when gnutls didn't provide the
> functions we wanted, but that was backed out fairly fast as another
> method was found (https://bugzilla.samba.org/show_bug.cgi?id=13276 0784
> 4a9a13506b4ca9181cfde05d9e4170208f88).
> 
> Even so, for this case is libnettle still the best first place to look?

If something is missing in GnuTLS you need, open tickets at GnuTLS. They are 
fairly quick implementing the stuff we need.

They implemented all the features we needed for Samba so far. Example:

https://gitlab.com/gnutls/gnutls/-/merge_requests/1611/

Also AES-GMAC, AES-CCM, AES-CBF8 ...

They also fixed performance issues we discovered ...


Best regards


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



