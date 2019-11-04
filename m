Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63922EDB59
	for <lists+samba-technical@lfdr.de>; Mon,  4 Nov 2019 10:13:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zBn8EhlwdCNXvtauvMJCgc6Eb7G6myJTh5JkwqJXBwI=; b=FiMmHRUAg86JMm9378r4g120w1
	JhPk4axPMDuHczXRnkacxJNgJZA0UPsjQBZyqo3L4/2fCAAF3qfAqI3aZahPCDJKmjmsWxJvYT8/I
	UeATvEppQg+DTVh+wM6SCMRfhIDpK1d6QXj9VRvLzLUrOCDoMWPS2RD9bFXTEgKRcurxJFtiwCxWm
	vlVhdt5MQWeklixigT3rpbajDwqKv5cm6ULW98+ndQUE2WHNLzbMLWvL2hBYUBcce1ChI7Stjdv+R
	srq/YVrsE4GLH4sVcFUxVwFLbDkkVyOByWb4LPu9QO5UjjuoH5SWyuww1Vk/ptlbDgBnauoFsEpAo
	WCK+SW6Q==;
Received: from localhost ([::1]:63962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iRYQ6-006SNa-9I; Mon, 04 Nov 2019 09:13:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41344) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRYQ1-006SNT-IF
 for samba-technical@lists.samba.org; Mon, 04 Nov 2019 09:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=zBn8EhlwdCNXvtauvMJCgc6Eb7G6myJTh5JkwqJXBwI=; b=dfn4fVen1WRqvvgzGuoS68msUU
 Yk9MjxodHgsUbmvsVSY3EQ8sytUGNmaUX+U/6y7LmQ9nFP9zVYT1Y5S9FIwNdS+T6CBiFnqlmnio6
 zI9aJGptBDN+MOx+qdo5SticCREH+aP2nRiN1iYT+Byab01sc3uNhVfO+dcJpPR8cLU6LAC8Hd2Uq
 QPprWJYbYjJEwe2PQez5WGLL1kBdgfSS91e21BQEAisMrHWZDq0HjgPVSVrkRgxFrvRrhAdf6LGfg
 Wwr4fdDrPWIw60MfaaJAbXCwdlAZuegpwWM+0T7rVJgK9mGKhUtfXoQvNHUiOhPbGDHrFQ73t7Lov
 BR0BvdvkgkBbo8EhWl1K392xnhJtF3MXizAl94vFl0K23lfQhzhIYMGjr1fjYji2dkRRkxrTOVHxs
 Sja9ashyYuLtb0peesJogqM/XeH75ELHxXfLWDcC4vV7YXSi3AreUCkXhlib28V/K+Wk4sAnXlR0o
 ixdMad9GU/M/KcuCk27wzOnZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRYQ1-0006br-2I; Mon, 04 Nov 2019 09:13:01 +0000
Date: Mon, 4 Nov 2019 10:12:59 +0100
To: Ralph Boehme <slow@samba.org>
Subject: Re: [PATCH] s3:libads: Fix mem leak in ads_create_machine_acct
Message-ID: <20191104091259.g4jdmb3cdhjlqhgx@aneto>
References: <CAEUGjKjmFJFmz+Wts1UMZaHXKEEpeuY7UmB52H_aiQU=HS11sA@mail.gmail.com>
 <937a7927-14e4-be29-a1df-37d19f5999c4@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <937a7927-14e4-be29-a1df-37d19f5999c4@samba.org>
User-Agent: NeoMutt/20180716
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
From: Samuel Cabrero via samba-technical <samba-technical@lists.samba.org>
Reply-To: Samuel Cabrero <scabrero@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On Mon, Nov 04, 2019 at 09:47:53AM +0100, Ralph Boehme via samba-technical wrote:
> 
> lgtm. Can I get a second team review please?
> 

+1, LGTM too.

-- 
Samuel Cabrero                       scabrero@samba.org
Samba Team                                www.samba.org
GPG:  D7D6 E259 F91C F0B3 2E61 1239 3655 6EC9 7051 0856

