Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBA05E352
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jul 2019 13:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=VquHTdUwSOwM5Oy+Nhq3b+X+WbZihctxtVIyt4Ndqvw=; b=4iQ8SnjmO5amzinN0gh/oKuPQo
	OJMLGtpjf8UIkZhB+FLtfAGqoiqslfLLCunAFKtUCD5oSnL3Ubn4GYTYosztIrtVmEKGSIq+rdjCn
	P04V7ckKadpKvy+i/fnl+01sz55d4fwoqLuZ9y3TiIcDJexG438jYqCTfOC4hCBx1Dz+P/sT5BCTV
	MieGO9mKugogdElGVjHVh+elcxptXbqsi1OnnyU/ZzEG4LdhCPEwgddnwfwJi+R6Q7DmmyY+Y89vJ
	lpYE2BgnU4t6qT2V20IX1m0FNJRNFAPp6EFeMxHmxpbxHJ+mejsbyVm0n699H8vgyPLouumCnrJZM
	QwdHTCqw==;
Received: from localhost ([::1]:58230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hidt9-004rrR-N9; Wed, 03 Jul 2019 11:57:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41562) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hidt4-004rqQ-Vs
 for samba-technical@lists.samba.org; Wed, 03 Jul 2019 11:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=VquHTdUwSOwM5Oy+Nhq3b+X+WbZihctxtVIyt4Ndqvw=; b=E1vvCgysD94MwOfjIGCxSNzFxz
 DEXoPP6JKsnSW3jruCmio2qrwoxNeeX2TGCGNlU785BRQtLWm8FHLIIj3iRBote61UxTwmNIo0kbf
 WBR5mUAgKMh8wYLJxPBni0QHNGnIBfz9+2VK2pOnHwBOIlBxgtjrpGArlm4pRr4ShVX8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hidt4-0005Qp-Ls
 for samba-technical@lists.samba.org; Wed, 03 Jul 2019 11:57:22 +0000
Subject: Re: [Release Planning 4.9] Samba 4.9.11
To: samba-technical@lists.samba.org
References: <4c4661df-047e-4cfc-fac4-20299967ab3d@samba.org>
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <416cae65-bcbe-f35a-c4be-f8d30b7c85ec@samba.org>
Date: Wed, 3 Jul 2019 13:57:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <4c4661df-047e-4cfc-fac4-20299967ab3d@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Am 02.07.19 um 12:18 schrieb Karolin Seeger via samba-technical:
> Samba 4.9.11 is scheduled for Tuesday, August 27.
> 
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.9
> has been updated accordingly.

well, time goes by... ;-)

Samba 4.9.12 is scheduled for Tuesday, August 27.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

