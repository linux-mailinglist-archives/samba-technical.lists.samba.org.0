Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE273BD7DF
	for <lists+samba-technical@lfdr.de>; Tue,  6 Jul 2021 15:37:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=hVJfJzhhg7dgG229nLFk3h+JYQ+EuZp5E0/mu7Cu9h0=; b=JDoAQHwC7d4qbpdbqgwvsUwdrB
	oR43sleN4SE/UuI2sQE3Of7IKr13zhgCV9OpuTV2JxEktzL1kHRzZ1IHinvr+papsj2WqIKVHTmGB
	SvhDiIKnom2RpGWziskyap626bvFZoEPluJijOFTN9O4PzYlpG4jkMXvdeJqt+DCbLqwt5yzC5ON9
	g0mJ44zonlMDRKABcWmoralgUWQR02NrHNwR71TA4GL5/0ymDtCBYfP8+cYLPhVXub+Jm68xWnDfG
	+q6dlgeuRWlYp157JVLMkEU+r7HC0nRzff8iBky4vIa4HrzLi6gwZxN+nctNEplnrHu2N8dNxlM2t
	LBif6u2A==;
Received: from ip6-localhost ([::1]:59850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m0lFj-00CVjU-Ib; Tue, 06 Jul 2021 13:36:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0lFe-00CVjL-G8
 for samba-technical@lists.samba.org; Tue, 06 Jul 2021 13:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=hVJfJzhhg7dgG229nLFk3h+JYQ+EuZp5E0/mu7Cu9h0=; b=WD1on9uJxou48DCziHN0cLnCwo
 GWQCdZsgBEkNprjcj7kiFF4U7tIT+xgtHBk0Y0UmxEOLox2o0F6RDYnoVMATLdMEg2xHQ6PqQfNIq
 AD/OPwgAwjXi9VrU0J8Fku5Wxg0VoAeRT+9ItpL/R9f9rWFHXpUj3urSeRFVZWg5zZOenKKdUSu6f
 HzQ7U94ZkDk7KijQv/bo5b9gd57Dm/peSmSlVJZ33B1s1A5jVjHZVsy8QnZD8gNlgLg231scb1Fjn
 J2QJqsWEUYyVBw52x+RvK0hgHvxKAbBqgtMHy+RTvwF3rJ7OEFjfE/Hyc23Z2+V/iM3ULUjIL/7DC
 eGghAWu3vMblid9yMplZ5vfqVrr0mEY8/Uway19CstM1MzFF7Ix+c6DpGx2bVKJFX0kczPktStISi
 nt+/OO4BCOGbYLMRCt1h5t1EldDkFpstGvRBTrF1syHzlp2wguO3cJf+gdrgi7X5FdDBGtDjmSE/H
 HneTO2QG5ipF2vblXz49QPKT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0lFd-00088t-Vc
 for samba-technical@lists.samba.org; Tue, 06 Jul 2021 13:36:38 +0000
Subject: Re: [Release Planning 4.13] Samba 4.13.10
To: samba-technical@lists.samba.org
References: <3c8a74cd-f738-3a5d-ce95-08c22a557cf4@samba.org>
Organization: Samba Team
Message-ID: <d3b0b0a1-4f02-8490-d378-1d8eea877c2f@samba.org>
Date: Tue, 6 Jul 2021 15:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3c8a74cd-f738-3a5d-ce95-08c22a557cf4@samba.org>
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

Am 11.05.21 um 12:36 schrieb Karolin Seeger via samba-technical:
> Hi,
> 
> Samba 4.13.10 is scheduled for Tuesday, July 6 2021.
> 
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
> has been updated accordingly.

Samba 4.13.10 will be delayed (+1 week, I think).

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

