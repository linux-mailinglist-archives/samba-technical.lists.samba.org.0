Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0DD158C12
	for <lists+samba-technical@lfdr.de>; Tue, 11 Feb 2020 10:48:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Bx69/Ixd9G8TPUNoMtmv7xeqx+y9qvGhHS3J7+DB+nU=; b=Ocx6hDV4VWIj5Rvxp6xFLb0tnM
	Q28fcuXZLLD+dLZRPXFkir/M2pgtZcZ+5Wh4SUxH+iHBY+W3vCSo0MUcWivniajcyl7+7vWBGTelF
	4Fjf2fFa8ve3UjQhpoFBWH6zhrTyiC+8KaHALb2OD+miR5sPvwqRgyi7KnrZaufQKEA2R3kCxlisS
	EpcQvo0WeTwacqyPPcWkjIRKi6V99jxmFonVTvTy9Fy4DPrf+GIlFnxyNjOuD6XVJ+E2BZNwGz10U
	4WMzfOpWY5Ky82QZ9P4q0PUTgLROMp5Ni2JWBQftDM9IeRCUIGE+L8sfwHUX+9zySxbtg7H5E00os
	3rdjCC1A==;
Received: from localhost ([::1]:45850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j1S9L-009KaD-2U; Tue, 11 Feb 2020 09:48:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22166) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j1S9E-009KZo-U6; Tue, 11 Feb 2020 09:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Bx69/Ixd9G8TPUNoMtmv7xeqx+y9qvGhHS3J7+DB+nU=; b=d577ZYsJsDRR0jXAnYFzOVYYzX
 wsJdPnlYRxcjWUrK7wiuxf/L7bPaDFvbY5xbiJOItg0zMGEE5UVnnh9YuyunzGFzN0F6yqykxgPol
 EMG00Kcxjulvh7+ZP2dpw0JdPSZ/sXK3fNX+M7ScNkRIKAYO8is4B5fT/ArlXmAmIucrj6MM9Cc2D
 PAN7KnH3z9FDFMf60Y7AQ8ZEAgSob39EBu2lLthfGHfLr53tvanhyGzg7WpkrUDge+/VQt/JimzFj
 6cvbgndKpmPQh7cYPh7bECD6iQOg7Lo+yD6Lah3MD8q2oFNEkIUMtT5K0UqD8XW2AdrC1C23M6Vb+
 p6HlRunuhV0+D4wOrlxTVXEwrN98dwpJy7MGnZVWOi1itczn3N9qIhgcUNPXJzd4GagWaaa7f2ofl
 lctHi03z0cN1JhI6NzsT9iC95kfO0ACYSPAX2HWWv5BBM+Ta0ulwD+pRVJIksf9WRD2JZH/knDFmO
 NfGhJtaDYdgvY/WYhPRWTSBT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j1S9E-0003FR-Jl; Tue, 11 Feb 2020 09:48:04 +0000
To: samba-technical <samba-technical@lists.samba.org>, samba@lists.samba.org
Subject: sambaXP 2020
Organization: Samba Team
Message-ID: <1dde7241-b6a9-73f6-23ec-4ac854b2c8b5@samba.org>
Date: Tue, 11 Feb 2020 10:48:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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

The 19th International User and Developer Conference sambaXP
(https://sambaxp.org/) will take place from 26th - 28th of May 2020 in
Göttingen, Germany.

If you would like to give a presentation, you can submit your
paper here:

https://sambaxp.org/#c11

Call for paper ends on February 29th.

New for this year's event: the Microsoft SMB3 Interoperability Lab (IO
Lab) from May 24th-29th, 2020, co-located with SambaXP!
The purpose of the IO Lab is for vendor is to bring their
implementations of SMB3 to test, identify, and fix bugs in a
collaborative setting with the goal of providing a forum in which
companies can develop interoperable products.

Looking forward to meet you there! :-)

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

