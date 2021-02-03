Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27C30D976
	for <lists+samba-technical@lfdr.de>; Wed,  3 Feb 2021 13:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Wf9pBQHEldQN97FtUaweazw3zvwUqIgxrWx3mWdxF3o=; b=4tKEI0qbCyhtGtPJhiMr+Yb22c
	LK90f5WsgJylKSnlK9LtISNWFUMwLidrr3ZodDkA/ggEdFnFi+jLBIO0tFcxGDQS7E45hAFjPCkB2
	zsCJgDcsrJRyEJy88MJZD7JxBXnMWcj4hya2NkDNTIhHUcyBrm1hkbCDQdEI6ggh3LJUurV5Lha8I
	Kvz9aJsXHUFY1JRpz/p2/JlI4n5wKRbWHQbZj71YscAePYoF9GMklDcF3IQCU1QgoZjXx39aG7A2e
	qjrTPYYqPKRUK5riOyp1QBkIRqgTB+44kcwA5wV6BkblzITGjq0PFT/Qm+wq9inXLyFTllgckuJrB
	/dueneQw==;
Received: from ip6-localhost ([::1]:48808 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l7Gtv-00AVNQ-7T; Wed, 03 Feb 2021 12:04:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64230) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l7Gtp-00AVNI-Um
 for samba-technical@lists.samba.org; Wed, 03 Feb 2021 12:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Wf9pBQHEldQN97FtUaweazw3zvwUqIgxrWx3mWdxF3o=; b=0V3cbtxXcAmXM8p8iKfpAZfUTS
 HWwxGWiZtfmScowLjQkrwn01OV0ZHvR7cmF/o5n+xzFn/Uvv9ck04iSZqa6/V3/XZVjCN1nYy/JLQ
 E+lxalt2YT8JERL+y0Czek2vNaPVpCqA6A6ZKFBiW39qv7Gzr+YoqZCx3EZeck/DlV2Uuima1p0OD
 Obc33wiShHzMCLYTtPUAawDAdMEO6a8CJadtlLjmtrPEBWeh+WGjcqnRXtrfB1whbs7ubwqmycB1S
 /q6WiX83Er5JLosPerYdQWpcrz4ItGXxHxzLldOytDeNWtZHVAt+d7FeAuTZjNCVZBPtEvXMy+OnR
 jMYKV0MH9m6o0jvGLrGmsC+1GiXcancc1VY/sVMIa3+hHoRP60T+UQoUz6TSroqhhi9UEyoRinr8X
 y+akDfSCMG/tkPrkamXO4kBMAp32WttTL+TZINj6BQGsgt4/loB0Rel1PkdFBUI/Rzv7ikkqX0j0G
 1qthkm6PWW14iXWU4X9SO+AB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l7Gtp-0005M4-Ax
 for samba-technical@lists.samba.org; Wed, 03 Feb 2021 12:04:45 +0000
Subject: Re: [Release Planning 4.14] Samba 4.14.0rc2
To: samba-technical@lists.samba.org
References: <a34d500e-e976-9cbf-08ce-83f1a32623da@samba.org>
Organization: Samba Team
Message-ID: <16640afb-9456-4d37-3529-7e33eaef709b@samba.org>
Date: Wed, 3 Feb 2021 13:04:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a34d500e-e976-9cbf-08ce-83f1a32623da@samba.org>
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

Am 22.01.21 um 10:50 schrieb Karolin Seeger via samba-technical:
> Hi,
> 
> Samba 4.14.0rc2 is scheduled for Thursday, February 18 2021.
> 
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
> has been updated accordingly.

Samba 4.14.0rc2 is now scheduled for tomorrow and rc3 for Thursday,
February 18 2021 (if needed).

Samba 4.14.0 is scheduled for March 1.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

