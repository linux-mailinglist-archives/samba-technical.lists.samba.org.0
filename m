Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F651822C
	for <lists+samba-technical@lfdr.de>; Tue,  3 May 2022 12:20:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=V6Hv+PZrxIkieDUP7ZZ5+gZ63a7jsrLHLcf1BugHAF4=; b=FYtuebzXXCxsJireCAcM9AekZA
	qCvLjHj/zCF9BgDSzTcUCVekGlKcqAlp8rE+qhrzO3LsXL1ejKah53zaAHZW9U1ro5PviMvpmVJjc
	pN+aoBOzIfVcrwCNv8xV94jSz4BxZUGF5n0YXqb04X9i2xsPEfaRhz6aKUt0sgWVOgIZXNCZeZGAm
	GxecD1Hv/9T0th4Axzzxb77o6XdGSRM/oH7x7no3NarJbO/n4lPEio79MP8Nyx9B8OrFox/LSBTvp
	ZrMghZiVo+DdWq7Uggwb1Nw5N9f7FAGOzuW3AL831oBqL+lCCdyVXFumTMyJyQY4peCbFBMYoK7X+
	Gp2yHZag==;
Received: from ip6-localhost ([::1]:47586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nlpd7-005iEG-KS; Tue, 03 May 2022 10:19:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42568) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nlpd3-005iE7-6v
 for samba-technical@lists.samba.org; Tue, 03 May 2022 10:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=V6Hv+PZrxIkieDUP7ZZ5+gZ63a7jsrLHLcf1BugHAF4=; b=cwykwDiwq2ibkNAP1rgS6+jm4O
 VH2uTzQqxHCgQwO03byJyUEUexFEPr/0FlYK4l5CfDp1SOkxpFtcwt7agP+N8u4ABUrZswX9wbl0F
 H/BOzdfL6zhQGrA+IwV5ul+ZwSr2ywJPhMEhQUUdtpt3uVojw4tcWcW465JtonAZwhozWeVZ8YDDD
 ZS4n/FNfRdCMSgtqL2YvqDJnUxyHZjzlfZveMz5l9b0CSCPVoJfYszDnpUI2Ngh79YIIirA6eC1uR
 qbQ6ojSkSkuyJqWpyqJfndnA0F3VXAKbXNFjWH8TO4CNS1GTLp0ekz5Fw+ZUATfiyhDz3WbXy7X89
 ILzbm48ZuckcOJRyaBG0du6iNzljVUrtu8P6ravptUCH37C4No7170c2H5ciKh9jXIU6AW1dkOywI
 TG70TAIQvuzYttWWPunaGos0dRVpJUzBX+8blecrkHfSUhrzZHn1JOlc6qSojYVz1toDH7xAiXzb3
 T+qIX31M7EDSKnzY61LBxcgR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nlpd2-003pPS-AO
 for samba-technical@lists.samba.org; Tue, 03 May 2022 10:19:36 +0000
Message-ID: <366aef89-1594-6d8b-561c-6f138717cddd@samba.org>
Date: Tue, 3 May 2022 12:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Samba CI mins now totalled: ~145,000 per month: Help needed
To: samba-technical@lists.samba.org
References: <172238861939f1348299509fbc3bd897e2526e91.camel@samba.org>
 <445534d75c399bef4429d72d9ae17abbaf6b0b09.camel@samba.org>
 <08dee2ea-8f43-1be1-4fcc-f2e0ded56716@samba.org>
In-Reply-To: <08dee2ea-8f43-1be1-4fcc-f2e0ded56716@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Am 02.05.2022 um 11:35 schrieb Stefan Metzmacher via samba-technical:
> We could also rent a machine (or two) like our hrx0.samba.org
> (which hosts our autobuilds) and let them run runners for us.
> That would just be ~94 USD for each of them.
> Or a version with 32 instead of 16 cores, for just ~125 USD.
>
> And our autobuild runs much quicker than a pipeline, so it's likely
> that one machine would be enough for our workload.

IMHO that's a great idea, thanks Metze! Flip side might be that Samba 
Team would have to maintain it, but the costs will be predictable and 
limited.

Karo


