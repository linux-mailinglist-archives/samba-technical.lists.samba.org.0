Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF81533EFE6
	for <lists+samba-technical@lfdr.de>; Wed, 17 Mar 2021 12:59:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=LLLDPb9XppzeDnjNo/d26LpW2ewt6/BUaI1QqZft0tw=; b=WUMK1SfVylP50mQM2U+qUcHxgX
	bY0DUArLyL2R6P30CuwBCWe67XDBTxYcba0rbH7HTWCA2Mf66Co/8F3xuIlJyfd7VG01kc7Ye05OB
	OmaNVh2g2ccP+pGjc3aDSiofds58xz8dWrMTuK/cVc2zCX6TmOhX5B7fUSg9kjpBwmgbhyk8fqWHR
	tOk4kN97veK01iJ40B3ZnDuVBBf07IVxc/onW4clx/SCLK6kjr4dMqexN+YiHvbWDlhmWj0yLkRsj
	2Re28/QQ+B2Hhakn4U69/Rg+sspXbJKuIP9MrVB34+RSGm8rYQHtl+L31hBmJomY4gMUCudUBQD7o
	1neV+V6A==;
Received: from ip6-localhost ([::1]:49566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lMUoq-005nCO-ID; Wed, 17 Mar 2021 11:58:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46570) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lMUoh-005nBv-P5; Wed, 17 Mar 2021 11:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=LLLDPb9XppzeDnjNo/d26LpW2ewt6/BUaI1QqZft0tw=; b=N0ozWrgtrJouKecW1L28ceHEor
 3eSWxRsX7co/G2+3kbA23Vq/3sNEMiFsBOJ4+8+T70nI5KELMIUqKYirPqHUxIspqj47vVq7eXjPb
 FDvlmdNhA+EMl0uEEBnwa6xxwaoK0kwDn1YGwL96q3WzQ3vuDO0ZW//OSNX/sn1fx8U6MAClF/lvw
 4ECcLj/tln4WZdwtbJaqdRxcuqIjbpIRoHR6rQiUFQz4ZQchZXHhRqyuui0qs068ai21fjhaDkbcc
 y+A93ByimORya+rI1z3/0zvPsYMGSqdD64LaPzN0/cZKXcJFcKFHo7ZT5SNWUYqUwIyFQMzY9BsV/
 ZVzu6daoBa1Ax/fT9gJ1pc6PcaMwz/gsTYXSLto/yhaZhP59MnSsRuUOZ2JaeJ+GQrnXKT5Heg2zo
 QZB5W/J1D5Lzf3G/i/SVrhBwV3ZW8XCwmL1xW+mSeoTdJyONf/OOYVRZr3zqbEvkXTFWllukWwdts
 4AIcqtfF3amm8/+FhCUNvREe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lMUoh-0004Ij-59; Wed, 17 Mar 2021 11:58:23 +0000
Subject: Re: Heads-up: Security Releases ahead!
To: samba-technical@lists.samba.org, samba@lists.samba.org,
 samba-announce@lists.samba.org
References: <5b349e1c-b2b3-fe03-0698-bf4291f1aea1@samba.org>
Organization: Samba Team
Message-ID: <b8506d91-fab0-f4f1-3758-45aa165fa2d1@samba.org>
Date: Wed, 17 Mar 2021 12:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5b349e1c-b2b3-fe03-0698-bf4291f1aea1@samba.org>
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

Am 17.03.21 um 11:57 schrieb Karolin Seeger via samba-announce:
> this is a heads-up that there will be Samba security updates
> on Wednesday, May 24th. Please make sure that your Samba AD DCs
> will be updated immediately after the release!

Wednesday, March 24th 2021, of course, sorry!

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

