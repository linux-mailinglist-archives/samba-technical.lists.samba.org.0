Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D3C139BC4
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jan 2020 22:41:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=UQrPofLRsBF1yrNeA/SlyiJBKVEzXmcUJmyhTzRaskQ=; b=XyfSc2vHIkfN2rfd11lRx/6Ar3
	4GKM8bIQNOYHnkZ+2PFuGMCQlu65S85SQXf+kAnrnGtr1Kowoz7IcCpHlXTxPBhCdh792QjKGFBA6
	0XswFRQRXx2YBbBV0ZqVE+qt6oyxfiwLlN82ZW3GRYyDuAB3cTiwMMWHrtxISSWtL5xJxQQuybrJz
	qw38Nbdlv1GJJvNGDCgEF82XysS7A43pv85zjl+Tw+PNr3A1UiocPssXin7HnIDyW+esvN5FIeagU
	Exjoq/OdPaQIJFu8A7sgZegCWyq3p0vv0sYQxi73PBvBZmyBwibsFW8nG7MmP6sLaO+IY6ors7DVd
	TjTuhN4w==;
Received: from localhost ([::1]:58782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ir7SH-003IPm-E3; Mon, 13 Jan 2020 21:41:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54488) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ir7SD-003IPf-J1
 for samba-technical@lists.samba.org; Mon, 13 Jan 2020 21:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=UQrPofLRsBF1yrNeA/SlyiJBKVEzXmcUJmyhTzRaskQ=; b=cE7yH51P7U2Bh/wvmLpd36wqF1
 0/2aFebQotVnidWrhCetqwexRvJ8K0qdcpzBiZolVBqyy/osOJ15KROsbhpOSqsDr0TcR+BMlRCvc
 9iEQVUjr6hxmj8tdmGvOs+n7yT7rytg5T31HkYcZgEz15r3aeG4Uo1pEGzBsId+WvA3sh0ZJ/dagT
 0U3fTueYnhH22PrUY/612y3P2pt49y7+ngqe5u/nsbx9eJl41aj2vFkDNG2LUjUllbjIkxEKlpEO/
 QoOGufJQWBV/IikE81+qi31Di/B+3perM8yLbJ7/yGB9+NomoPkB/6Pon/zA5EIisbXRP4yjoK9rT
 +rSnLbr0YV0A8dSo4Da+4mmEb7sb81Fq4GbAnkgjGgdi4B8bGl/q57AzGQSW3X85Bk6wUofM74uZT
 btbKKuqVL0olLNwIX4ioOY1LPy02mxNLbLG0weSDeM2dwY2cXmtD0eGfmtr/rX6aee8DXzqpCWIwk
 TK9BaZRZVcZRhhXZpTkyXmqz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ir7SC-0002xA-4c; Mon, 13 Jan 2020 21:40:56 +0000
Message-ID: <8cf4710ffc58cc8fa3f389f520b02a2387b9136c.camel@samba.org>
Subject: smbd: RIP user_struct
To: samba-technical@lists.samba.org, slow@samba.org, Jeremy Allison
 <jra@samba.org>
Date: Tue, 14 Jan 2020 07:40:53 +1000
In-Reply-To: <20200113211009.DFC251402DC@sn.samba.org>
References: <20200113211009.DFC251402DC@sn.samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2020-01-13 at 21:10 +0000, Jeremy Allison wrote:
> The branch, master has been updated
>        via  a18ffe26b3b smbd: RIP user_struct
> 
> - Log -----------------------------------------------------------------
> commit a18ffe26b3be13e45622172c4ade258cfc8fa783
> Author: Ralph Boehme <slow@samba.org>
> Date:   Mon Jan 6 10:14:11 2020 +0100
> 
>     smbd: RIP user_struct
>     
>     At last, the nail in the coffin. :)
>     
>     Signed-off-by: Ralph Boehme <slow@samba.org>
>     Reviewed-by: Jeremy Allison <jra@samba.org>
>     
>     Autobuild-User(master): Jeremy Allison <jra@samba.org>
>     Autobuild-Date(master): Mon Jan 13 21:09:01 UTC 2020 on sn-devel-184

I'm just a little disappointed not to find an ASCII art coffin or
tombstone!  ;-)

More seriously however I want to say a big thank-you to all those
working to modernise the internals of smbd and particularly our
authentication and authorization flow.

Thanks all!

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



