Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE15D1CBD1
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2019 17:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=9OCdNz3T5PSLW9PTyLOaFsZlFgzh+0BlgpcjYPHCKDo=; b=w+rY7x/+nTiRYL0gYnmbVLEKf0
	0c58u6o1n0LVX08p3D2Fwu010+9MRWt+Be6FiTJ00rnTPZf3xbDSlFk9UwdiQt6FfnRThtBg3fZfF
	u+ANxlqxvwWPdm4UZJ9t5zt2SSdL8w5qEGttdaHf8ePN+7e8X0EjLpxmoEBVMA9mzhXp8Wqb/hr7s
	d4LEYHqGQYIhEcIcBFKsXipOBeS4fFIKoMI54Hxp0wqWspla4pWoNnTg+UdHktBNttbtRiMPAEWaD
	Ua8saDg8uQOlHMEKzcp3sjp1R1t2v3bMCXvnlfO5W6McBLUA9VuxyVADx4bJH62T/xFF/+5b+pcRq
	rTqsQ+Yg==;
Received: from localhost ([::1]:38822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQZJb-003cSa-Kk; Tue, 14 May 2019 15:26:03 +0000
Received: from smtp2.provo.novell.com ([137.65.250.81]:44818) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQZJX-003cST-8Z
 for samba-technical@lists.samba.org; Tue, 14 May 2019 15:26:01 +0000
Received: from [192.168.1.10] (prva10-snat226-2.provo.novell.com
 [137.65.226.36])
 by smtp2.provo.novell.com with ESMTP (TLS encrypted);
 Tue, 14 May 2019 09:25:52 -0600
Subject: Re: [PATCH] Add missing OOM check to quota code
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <2147255.6v8QEAuP3E@magrathea.fritz.box>
Message-ID: <3a24f3b7-03cf-efb5-a82b-f5aef8ba8734@suse.com>
Date: Tue, 14 May 2019 16:25:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2147255.6v8QEAuP3E@magrathea.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Noel Power via samba-technical <samba-technical@lists.samba.org>
Reply-To: noel.power@suse.com
Cc: Noel Power <nopower@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 14/05/2019 16:14, Andreas Schneider via samba-technical wrote:
> Hi,
>
> just a small cleanup patch.
>
>
> Review much appreciated.
>
>
> Thanks,
>
>
> 	Andreas
>
oops yes, LGTM

rb+

Noel


