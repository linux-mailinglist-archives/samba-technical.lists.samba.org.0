Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4BEAC61D9
	for <lists+samba-technical@lfdr.de>; Wed, 28 May 2025 08:25:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=p3vwUmCtZbkreg5o/cS2i5gfM4nkx2HMTwqXpMUTWt4=; b=nJyCvIoHoWRM472HYOQrqESyyW
	b/ppUZSheFLlhTIzqDw0UJkZfGLciz8TwlevTxHDjfcnhiWgxr+2XDyZOKeRre7jyePeico0oifLm
	n/WCDNWrNjE3B/AoBL2pXiSwhTQRn5Ps2+b99H2/6aXSfiUbsprpVi+2Ly+mrYATv8cya2ZRStwG2
	V++kR4ycRpInzqj/rntHn98pW74a6oCZ2qzk3ST4cumtwFYQhFTXD5qJJVKCn3J4GMmJRdn2emB8t
	jr/6wvhSzYlRpEE5Zeg5bfk7pFU5ppcAryiR+vgqcBpS5n3CGzXQA4Q71YmYGd+Q/hQNgKsOC7jTv
	2mlNOymg==;
Received: from ip6-localhost ([::1]:35338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKADz-004Jyg-1v; Wed, 28 May 2025 06:25:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27930) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKADs-004JyZ-AN
 for samba-technical@lists.samba.org; Wed, 28 May 2025 06:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=p3vwUmCtZbkreg5o/cS2i5gfM4nkx2HMTwqXpMUTWt4=; b=UVW9S3MSpSZIGbQ/CpoMEcr0X8
 sdLsR1zzQWRUimQ23tXTEtz6pp+Zzl1e6XW9VqmCNrXLBWGHDjhFYWhDmg14sLNMtXHuaQXOV3z9x
 IAyI0bfs0hK/Fur55p3mknfdO71TcWoMduAanePcXB6MBVjIiZ0+Jf0qxtSiFHvaCP9ugUGM0XOXk
 GwjQI0MsZZXpe6kQyHtHR08YHe3Tf7sr41CKkpPME8DDJ1XRdBHrYtejjXbc8cYOmjXpdCJevvNfC
 ai+mBkMU7pVao0WiiyXXos8Xm/Oruk7gI1VHM5esdEUX1UZwh2c6eynTV6bx+S/J91+Yq3pu67bIb
 9gYUS6YziVLjUUUvw8OYlUMnLhJqZY6K5MMMrYjMWAOwpXt48KHCyNVBcdTz+CefcCzmwXHNCX+SK
 qELTedu1jficH18+PFl/Zlp+8zwEXV1p8dgKO3NfMKjT1uBvDGb9+2bh5Et//1j70i2luhDgiWWDy
 9S54B/aXYqw85NqzPAs15tcN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKADq-007bGi-30; Wed, 28 May 2025 06:25:07 +0000
Date: Wed, 28 May 2025 09:24:10 +0300
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: Samba KDC support for key-based trusts and strong and weak
 mappings (+ further kerberos hardening)
Message-ID: <aDasCuaFfBWV7RES@toolbx>
References: <90d57927-1b1d-49bb-8f76-d3b6c04f4414@catalyst.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90d57927-1b1d-49bb-8f76-d3b6c04f4414@catalyst.net.nz>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Срд, 28 мая 2025, Douglas Bagnall via samba-technical wrote:
> hi all,
> 
> We at Catalyst are likely to be working on features that allow tight
> mappings between AD users and certificates. This is getting towards
> "Windows Hello for Business" support, which essentially uses your laptop
> as a hardware security token.
> 
> The msDS-KeyCredentialLink attribute in the AD database indicates
> eligible certificates, while a "SID extension" in a certificate
> indicates the user the certificate expects. We are going to work on those.

Sounds good, thank you for starting this work!

> Another thing we are going to implement are the strong and weak mappings
> using altSecurityIdentities to address the "Certifried" exploit. This
> will matter a lot more for Samba once people start using certificates.
> 
> Also we want to add options to tighten up Kerberos security beyond that
> of Microsoft AD. These are ideas that arose from the CVE cluster known
> as "Andrew's Kerberos Concerns". We want to be able to force the PAC to
> be sent to the target service, and to check the canonicalised usernames
> against cnames. Optionally forcing the PAC will require upstream
> Kerberos changes, so we'll need to see about that.

This is something I have been looking at recently as well. One thing is
that traditionally in the Kerberos protocol these decisions were
deferred to the application servers instead of KDC. It is possible to
achieve this by the application server making a choice to look up a
presence of the PAC buffers and at least for GSSAPI it is made
relatively easy. However, we come more and more to the point where these
kind of decisions are better to be enforced centrally.

I've discussed this with MIT Kerberos maintainers recently and I think
we can start by making it possible to force KDC to reject non-PAC
requests completely.

-- 
/ Alexander Bokovoy

