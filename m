Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292E3B9E43
	for <lists+samba-technical@lfdr.de>; Fri,  2 Jul 2021 11:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mTikNewGzdw/2ovMvb/g2bm83Z5B5S09rjWMZ/DAguw=; b=SX6G8hdpBa36VkSSqVK662buSr
	NU2YA72BpJy7nNp+nj8ES/XMh2YenyVyTwjyBd2+B8wBTLIyQiccCYuWir/J9lpcyb/2rVKDoE/5U
	FeJNB+uix4Ozy7cpAJo+J81kSnKdNQzjah2k3Yj4ZgRV1lqqjg4aLcqzK5ojpXTxhKer9kvvAzkas
	Rb7+8/+r4c448Cp/1U2IJL3OOVLwHiiFNlW2WHV/mPRLdY4el01CO3N6y7xeavQIiVK9ttcPMhnc8
	UDMqbnAoR3+6ekVqPpS+CU3MGjj+bbzcuH/BcNqPhlVThtt5Dj5srxF7nNT7/UQmISoOyFMMpd+0F
	ZlpRRVHw==;
Received: from ip6-localhost ([::1]:36452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lzFVh-00BpDS-RL; Fri, 02 Jul 2021 09:30:57 +0000
Received: from pluto.hosts.bitme.ch ([178.209.51.11]:36184) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lzFVc-00BpDJ-BX
 for samba-technical@lists.samba.org; Fri, 02 Jul 2021 09:30:54 +0000
Received: from authenticated-user (localhost [127.0.0.1])
 by pluto.hosts.bitme.ch (Postfix) with ESMTPSA id F13C04B2053B;
 Fri,  2 Jul 2021 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=znerol.ch; s=pluto-01;
 t=1625218242; bh=mTikNewGzdw/2ovMvb/g2bm83Z5B5S09rjWMZ/DAguw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ewC/uyRjjz1okmmxJoHoPkKuvyhp8A2Ik9ftjlMhHFXgC6shVNbdLUntzBO6f8fk1
 Wr8ld4MPJ+5R914x5mn2BnFV9O/M3s0RnzPxFpJQOqOitrDGa3En2Pcfu5E6D4lc83
 fQZwuwHcZ4V0DgepcPrd9wpemjloDqert/uPSZr78+Bxr6casE6bFrDZPFAE5FbsjN
 VWVwBwg+UmbHu3/B/q9l0aHy/ljTA11i21w6K1kgzh/fdHxg3x31+8OtRKaSqmq49J
 Rt06WPQJm7ut26gCzFqGz2ak10ACdlqwSNt6uLRPIhlRuvLv/lwNd2mRC7LhP0/suh
 HESWcPOMHFSMw==
Date: Fri, 2 Jul 2021 11:30:40 +0200
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: gensec_krb5_start() fails silently with tlocal_addr /
 tremote_addr is IPv6
Message-ID: <20210702113033.5449db5a@bonemachine>
In-Reply-To: <c99f42b9-4abc-36a1-08da-8f752c558f39@samba.org>
References: <20210701220727.76fa9c60@bonemachine>
 <c99f42b9-4abc-36a1-08da-8f752c558f39@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Lorenz Schori via samba-technical <samba-technical@lists.samba.org>
Reply-To: Lorenz Schori <lo@znerol.ch>
Cc: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Fri, 2 Jul 2021 09:51:27 +0200
Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
wrote:

> Thanks for the report! I think this commit should fix it:
> https://gitlab.com/samba-team/devel/samba/-/commit/9c3aef25b1d92ea94d7400d8e4fab176cdb83187

Correct, that commit fixes the problem. Will still open a bug report
and link to this discussion.

Thanks,
Lorenz

