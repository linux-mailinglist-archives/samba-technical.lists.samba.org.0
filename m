Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0008918913E
	for <lists+samba-technical@lfdr.de>; Tue, 17 Mar 2020 23:20:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fD4yxBD0iS5RnVmrgZY0D5itOnWQdQAiUAhGukiU8ec=; b=mn/PztsEaQ3OGt8rgOQAxPHzij
	IHPrW5YyEnbRJCiXSMqI5qOQ3kOEXblSgvn253lKCbuDUAqXX35lF63uu9eY4IiTISgHcfuPV65E7
	YI9jp2jz9vp6ymGz8LxEtStXltB3u5cAiA6LEVfjmbcv/1K8Uts7h3m89BihLr7QIrlp7GUioEHWC
	GPRP7zuBpG9WR0ESrR/jC1cyDZ0+B2lE/gIo44eRYP6aHQiGyfi7/OyUntHi6p/9a3m8LkROvTjst
	Qr4m6I5RYGzIg9afZUMzu4+er9Usr8Sg2IzT7HMkfXRqIGaRMsAPNPHP9g5QLbHsTaCzn3dBDlQRH
	p/5RzMmQ==;
Received: from localhost ([::1]:25786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jEKYh-000GJv-7G; Tue, 17 Mar 2020 22:19:35 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59477) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jEKYb-000GJm-Am
 for samba-technical@lists.samba.org; Tue, 17 Mar 2020 22:19:32 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 964BC5C024B;
 Tue, 17 Mar 2020 18:19:23 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute4.internal (MEProxy); Tue, 17 Mar 2020 18:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=artmg.org; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=fD4yxBD0iS5RnVmrgZY0D5itOnWQdQA
 iUAhGukiU8ec=; b=hVXPIe2bmP6a9hGDhOZAvq9s5lNoD3cslHFttIw9pE9JWAJ
 XrB1NnI8lCflbVzF0LCvSSAIgVlprC2p/lZ0nJ9+J4i93ABNkAi0iJ7EGB5G+CRt
 KVCGCROiqueM91NMT2djsS74Fz6xN3nZN4VUYFppxEtCiFk+W9+PlXoPUhgmeNmL
 HiHAWAtTXtBg7uYO5rDEXjITjGkwMY22FkO9Eidnui4SSwV5rfSqynBoYv4OsAb6
 mUUKqyvOdRgVgyr75AYVJJ1cxJNfC/Dw5TuZJW8TlzyUvXB2rBUvW6NvOWS+MM+3
 BEuf6xqszcKClVIDRPrQmeacs9d2lMiGYtOZxgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fD4yxB
 D0iS5RnVmrgZY0D5itOnWQdQAiUAhGukiU8ec=; b=ctCoy6s11bz3GcM6cFgLjR
 mNeYNA9SH7XMyoa81dJraE1i7TTkE1RIwaHTl7+NJNA8zJT+Xhl0ljh1QFnnWiN3
 MIcJxGEV2tqzJ7VeU4MxAMAMbbxC1vtNoI9b32JBtSrLiEq4oV1pmjOS3xtVHAGi
 yxZzhx5DLTUHSf166OjbkWYInbC34ShtaDxsorXV22PEpsyVKDPvn3VdoF4hKzIM
 0c+08ev5+SXrns6AUKPsVpuBDxclBAOIr4s1qlkVNQzHshUBayGjEn8CAKRx3UBk
 2MuYHdIx0PTarT3BA8p/d6nA/oOHUIUkbH7E/Tw+I+OIaFsai/u19NfrE90Cdv9Q
 ==
X-ME-Sender: <xms:60xxXqluEjBAFtr2mSClhLtKFW94HE5CDRZ7AGRbUb4I_ftAZSWBGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefhedgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpeetrhht
 offiuceoshhmsghlohgtkhesrghrthhmghdrohhrgheqnecuffhomhgrihhnpehsrghmsg
 grrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepshhmsghlohgtkhesrghrthhmghdrohhrgh
X-ME-Proxy: <xmx:60xxXmHpNTpOx6DQP1yrI6zUCXBbrmwBoGzN46ImIn9wxixFbLoYoQ>
 <xmx:60xxXjpxuD0RvtJPVojen6khpWF0wk8BOe9qv2FmccZ1XzZ1VmQCzg>
 <xmx:60xxXi5bubnwgnJoj2azKkV2JmtVsgr_ccK3Ljt-mndp7RPLJQMU0A>
 <xmx:60xxXpxYLXwZpoPBa6p9-UIlCf5KFbxOLpZfoxzkqIospvzOccdsmg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 06208C200A3; Tue, 17 Mar 2020 18:19:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-991-g5a577d3-fmstable-20200305v3
Mime-Version: 1.0
Message-Id: <c64556c8-9b10-4d9c-8536-c087d5481036@www.fastmail.com>
In-Reply-To: <af43e77b-49ac-63d0-b959-63603fe1c718@gmx.ch>
References: <0a4f01d4e99b$791af700$6b50e500$@laurenz.ws>
 <vmime.5ca5f235.56c2.3109a1736f468505@ms249-lin-003.rotterdam.bazuin.nl>
 <0feb01d4eb7a$cffa4590$6feed0b0$@laurenz.ws>
 <af43e77b-49ac-63d0-b959-63603fe1c718@gmx.ch>
Date: Tue, 17 Mar 2020 22:18:58 +0000
To: "Art MG via samba-technical" <samba-technical@lists.samba.org>
Subject: Re: [Samba] Make/Build Error on armhf
Content-Type: text/plain
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
From: ArtMG via samba-technical <samba-technical@lists.samba.org>
Reply-To: ArtMG <smblock@artmg.org>
Cc: dariuszb@me.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Great news! I had this issue with 4.11.5 last month, and I have just retried the build with 4.12.0 which passed just fine, with little more than a smattering of deprecation warnings. Well done, to whoever :) Naturally I will let dariuszb be the judge for his bug.

Re AB's comment on bugzilla, I can confirm that I have made NO updates to the toolchain on the device used since building, I merely cloned from the --single-branch --branch=v4-12-stable and rebuilt. So the fix WAS in the code and I am happy to run compile tests if someone wants to direct me to potential bisection point branches.
Cheers
ArtMG

On Tuesday, March 17, 2020 at 9:28, Norbert Hanke said
> The problem has disappeared with Samba 4.12.0 .
> @dariuszb@me.com : can you confirm?
> I think that https://bugzilla.samba.org/show_bug.cgi?id=13754 can be closed.

