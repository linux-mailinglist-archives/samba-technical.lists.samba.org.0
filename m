Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44261EE89
	for <lists+samba-technical@lfdr.de>; Wed, 15 May 2019 13:22:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=nqQ5Rl9lbTdiHtOa6iVbw/EbnfMNJcs4QQmKNuXtEjo=; b=jj20S5iF8UuPGKZyJDGhqfPVbG
	wz6/f1Ct0/14mjhbkYHmd2YO/sqMbEZ4vtbav2s6aqxAf/zYZmMuoBXFmeeBtwHxty+unggeqrLzB
	kTzCyHcPza5sezX73zAnKNcVpcGoJWLnIY3kicloqcMUz9CbSnKCKvArwPeGGhOLqqbsph6vLFNEI
	W/ZrEIvklsK0KGq7MNXpO0bgTztQzNRDHrnEYzkCyi6PLaGyZfJ3P5pQKEaUyNgFNzjoWQmgYkNvk
	E/5f9ii/qZ09mF8FoNMcoB4J4YdvZoJQkSg6/elqTjbIF+gc6berNcHoYV7PfN/hb/imSQlPJV5p9
	WADoN+2Q==;
Received: from localhost ([::1]:26600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQryt-003jff-32; Wed, 15 May 2019 11:21:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:41392) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQryp-003jfY-4P
 for samba-technical@lists.samba.org; Wed, 15 May 2019 11:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=nqQ5Rl9lbTdiHtOa6iVbw/EbnfMNJcs4QQmKNuXtEjo=; b=uY60thV4rqBflMudWL1wcDWJ9C
 J83XQi5sUtLyGBVrtH4uNkEhHkL+CJ2n7uM+krqyjoYD3AD3fuJwvSdWnXdVNig95fi+3wEwjuDKS
 lkROMYn3ZEsqN6YZ9uhQIkkEtn/N6fO5jfzFJ2cYUi18INMVwcFaeHeM87RlBBWlzJTE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hQrym-0008Hr-Lg
 for samba-technical@lists.samba.org; Wed, 15 May 2019 11:21:48 +0000
Subject: Re: [Release Planning 4.10] Samba 4.10.4
To: samba-technical@lists.samba.org
References: <0ec7bf54-af83-120c-dc35-2f7f79029bc7@samba.org>
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <e2e11576-41ac-7ea2-bf1a-ea4ec2b5a080@samba.org>
Date: Wed, 15 May 2019 13:21:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0ec7bf54-af83-120c-dc35-2f7f79029bc7@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Am 03.04.19 um 12:23 schrieb Karolin Seeger via samba-technical:
> Samba 4.10.2 (now: 4.10.4) is scheduled for Wednesday, May 15 2019.
> 
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.10
> has been updated accordingly.

Samba 4.10.4 will be delayed. New planned release date: Wednesday, May 22.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

