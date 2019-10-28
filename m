Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 267BBE6CC7
	for <lists+samba-technical@lfdr.de>; Mon, 28 Oct 2019 08:14:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3ii4IGsS7JPUCo9+LrxwzkNCTrxll+VqrkvYiFR0GTc=; b=DXC1q6lODrM0dWrtaMs1Qz2bDE
	HrGmpyFE37wlQaLWcUbZDtTijTryCBOYjlpIGFOd02qqKvSLPWLRsE1iXgWeVU7HGSpbro4k9RR4X
	2qavZM9GRjFZyQ6IU72SvJd88GCVkn8B4+3bnTlCMxcJ9ACN+mcTstE6fa+eZTOShXIbkefRvfT29
	E62DMysRRU7stUzbh3i08Lv2kJDTNZikzHefhyWA/CfNT1Pju4Fa7+dJqGWEjnxjwX3iBxuO2g1if
	kovr2CSSuwKPCFDvsSgr8+UD82EX56adfkA8wKJ23hXbQH8VTT+5/0oapM9u6IVytf5XOjX/2uIyk
	rl946bLQ==;
Received: from localhost ([::1]:39838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iOzEZ-002vqQ-IV; Mon, 28 Oct 2019 07:14:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iOzEU-002vq3-1G
 for samba-technical@lists.samba.org; Mon, 28 Oct 2019 07:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=3ii4IGsS7JPUCo9+LrxwzkNCTrxll+VqrkvYiFR0GTc=; b=FTJcchFz65qragwgfRgd87fc5G
 bISFdiWWH5Gq8RHneJOedP/woXZZXDY99RZKR3Mm4iM4KDU/arcassvZ93B1OHAdXxbGcUEHBLXEW
 uSi0TNnx51zKBiX3UyRfNR8KZbuPR5Q0JgZCD41M6gzX24tlFOZeD2SLAHgEWzTzBrNM67vyHKdJ7
 cozhgnQb+y3iMsmjPhBVJsOR0TfQ5LCRPfWfle4rBUHx/Sh0EVZ/dRQpw9YB564+4TidtJ6H5rDfD
 KKsncuGmh0KXTwDkT23IJTL/67x5S/STK87dzsImPpedUqxbGz3JLR5uNQs6Ux4rwjy+dZIWN66QC
 4E7k1PsFAPzuOy6eO4XpVtRclNFKXytxf1vIWi8ZA1NYIo9ZljqfByL/cEll/kkuKu5TUUb+iP8da
 rEcBvUisKURroeiLf3Nw3rlgCWktlLYrKbT+XRwFwtsfm6qM9Wh8D8ESzgRYQlCaqy68c24dbMKr2
 WwZBfMihAvRKhF5tLRcd5ADc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iOzET-0002mK-LS; Mon, 28 Oct 2019 07:14:29 +0000
To: samba-technical@lists.samba.org, Carson Reinke <carson@reinke.co>
Subject: Re: [PATCH] Add RR TXT to resolv_wrapper
Date: Mon, 28 Oct 2019 08:14:29 +0100
Message-ID: <2303630.oTt7KeoaRQ@magrathea>
In-Reply-To: <CADmTV85u56g1qCtjGLuoDjGyMPveG+BksekRxSQ-yo9ypLe9dw@mail.gmail.com>
References: <CADmTV87B2HCcj537=k9SC=LL9cu3BFypXmdVyM+po_0mA6OvFA@mail.gmail.com>
 <7261541.Vyxcxg3dJj@magrathea.fritz.box>
 <CADmTV85u56g1qCtjGLuoDjGyMPveG+BksekRxSQ-yo9ypLe9dw@mail.gmail.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sunday, 2 June 2019 00:32:18 CET Carson Reinke via samba-technical wrote:
> *Andreas*, looks like I had this wrong.  The TXT record handling was
> missing an important part after some testing.  Here is the original and
> adjust patch.  Let me know if you want a squashed version.

Carson,

thanks for your contribution. I've finally set up CI for resolv_wrapper. Could 
you please check the upstream sources?

I will do a release soon.


Thanks!


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



