Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 496F2316F13
	for <lists+samba-technical@lfdr.de>; Wed, 10 Feb 2021 19:46:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SUqh5ahqTU1yb6KHE783R/oRjQCwNQiHMQiezopj8W8=; b=fPQLBS9JVDyW8I+evshqsEoZT4
	YX3j5ODLZnx7nxp+OnWLn4K/SKDP4cGU81egwkTuM8dE0TZXFYlic80G8N+xSqSENk/4AG5CYWq8P
	5xk0Yr93t06hqc2f39EXFy7qxjzthubgeUsEuAFnSPaRChgYBh0iPCoxnw8UwyWqhDHGa6Laxc0ky
	EpxSoiqvSVCWmh2JUumXDg+jz4c1XMLJXuLys60sJ5rpOVinJ9BHJaQGgR9p8orGI4CS3jxwLSjP9
	DPJdGt3eZckMJkqACT7nfm1e/yL9lDvZaxDOHciTWlo8yCOpjA9gBaFScWaDORN02rxxCrFHVWCPr
	sOnk4vxg==;
Received: from ip6-localhost ([::1]:46050 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l9uV2-00C1hy-FR; Wed, 10 Feb 2021 18:46:04 +0000
Received: from [200.1.116.7] (port=57736 helo=mail.afip.gob.ar) 
 by hr1.samba.org with esmtp (Exim) id 1l9uUw-00C1hr-Iq
 for samba-technical@lists.samba.org; Wed, 10 Feb 2021 18:46:01 +0000
Received: from mta11.afip.gob.ar (mta11.afip.gob.ar [10.20.152.148])
 by mta4.afip.gob.ar (Postfix) with ESMTP id 9475BA15E0
 for <samba-technical@lists.samba.org>; Wed, 10 Feb 2021 15:27:36 -0300 (ART)
Received: from mailbox12.afip.gob.ar (mailbox12.afip.gob.ar [10.20.152.107])
 by mta11.afip.gob.ar (Postfix) with ESMTPS id 49C95E1796
 for <samba-technical@lists.samba.org>; Wed, 10 Feb 2021 15:27:36 -0300 (ART)
Received: from mailbox12.afip.gob.ar (unknown [10.20.152.107]) by
 antispam04.afip.gov.ar with smtp
 id 5fcb_21c0_97302994_08af_4895_af08_993fd17905d4;
 Wed, 10 Feb 2021 15:27:35 -0300
Date: Wed, 10 Feb 2021 15:27:36 -0300 (ART)
To: samba-technical@lists.samba.org
Message-ID: <1297730883.815245.1612981656028.JavaMail.root@afip.gob.ar>
In-Reply-To: <1650418801.814981.1612981622567.JavaMail.root@afip.gob.ar>
Subject: Synchronization between Master and replicas
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.20.152.102]
X-Mailer: Zimbra 7.2.7_GA_2942 (ZimbraWebClient - GC80 (Linux)/7.2.7_GA_2942)
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
From: "Negrini,
 Marcos Ariel via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Negrini, Marcos Ariel" <mnegrini@afip.gob.ar>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello:
we are implementing a Samba4 Domain Controller, and I'm looking for info about the synchronization times between the master node and the replicas... I was looking at the KCC commands to check and force synchronization, but what I can't find is if you can set the interval since a change is applied on the master and impacts on the replicas. Where do you configure the replication/synchronization options between servers (obviously the options that are not stored in sysvol, I know that is synchronized with rsync).
Greetings
Marcos Ariel Negrini

