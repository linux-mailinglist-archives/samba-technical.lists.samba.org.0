Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E8138D86C
	for <lists+samba-technical@lfdr.de>; Sun, 23 May 2021 05:12:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=52K0w36JaQm2sxt0AoAanCAG34FlpP9WU39ddIjhfSY=; b=fmsikpcFFjoVtZcF9a8CKaUzIk
	qgTr74QjO41v8IZ54fRS6NLGOhZwZ8rNNRxWec8kMKTpICZDtaKAZ+YVibBEhb4O7oOPwyzB48Krr
	JVBDsQl6lUrYTVItYgcyEWdXv8451IIN3eaobCIRR9l83ifolKec2zCSWXR9BfrZfKeC7+WPGom94
	xLFyFjVkbBoQ8NBWLVyOXTmWWMG7pAaYO6rY3r302+slbA3lLhZj311SEibClEd1n0ADICd0NfZHH
	q8vpkEwFQJaTnIumtejV57nv3OLHU6e9/pYW5LnfGhGQYGsfM7FAYVnJwh0I6lk5+hSLTOAeggavx
	2qs0x6Zg==;
Received: from ip6-localhost ([::1]:49396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lkeXW-0037fJ-73; Sun, 23 May 2021 03:12:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21784) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lkeXQ-0037fA-Ks
 for samba-technical@lists.samba.org; Sun, 23 May 2021 03:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=52K0w36JaQm2sxt0AoAanCAG34FlpP9WU39ddIjhfSY=; b=HkgOuw0jkW3y/IitmE+7YsuxtM
 F3yFivljhScW34E9FpyRU501qGTFIy4h3sIeXjIZO6JHCEIY0Fu+BZi/n0VcAREYccpnTEXgCX2A7
 K2u1GpiEzmLrboBaYZQhFyePvUpGqo3XhjftX0YI2/26+ZhdmehM/FpZNSXaupmCv88Wwkj0D5186
 9/asxqeG2S2R66hOgBeXD/4DGWkambA0KV1pPGOzfRXWrtirftypOcWKCohga19DskrAI/3h0kK6C
 xoHXZqjAlSTdYI/9pJiToZwbDFDlfHWKRi0pvfMRlPKshz0LQ2Cn/FMBpfF4npIeALC7/Yepfa5W8
 X4XaL8ve+wpcxLZIEoUhCAEHhw29/hMAVXgMkKLDbJpz5vnVAk0f6hVSaFptr3ZJHdL+r6hynG7fe
 58CM/H/tM3RGq6Qynr5MIi1Tja7SKI8UbBpJwATsEi/gpMSszH4/KcsDFMvqYQv2W3PfEVjNuN0SI
 0ICQ6HzpsELvRudBeRVOU9D1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lkeXO-00076b-Pp; Sun, 23 May 2021 03:12:23 +0000
Message-ID: <f36563a24207c37e15177eadd6a1dbeff53ce55d.camel@samba.org>
Subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: "Dr." =?ISO-8859-1?Q?Hansj=F6rg?= Maurer <hansjoerg.maurer@itsd.de>, 
 "samba-technical@lists.samba.org (samba-technical@lists.samba.org)"
 <samba-technical@lists.samba.org>
Date: Sun, 23 May 2021 15:12:17 +1200
In-Reply-To: <0df4f538-c7d9-675b-5b08-27b7c94bc2a3@itsd.de>
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
 <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
 <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
 <c4713dc0b0d746c834ec66c1ec793572c725b2d2.camel@samba.org>
 <2da32b9f-8ba0-c1ab-1748-831eeb727f0f@itsd.de>
 <1911c4eeee7df0fcf1f13d612da214094a9198c0.camel@samba.org>
 <b6fb9ef1-3cbf-e970-eb2e-9e6e395c65ae@itsd.de>
 <b83d52e7a5b846fd429811616f3b3c21d2f55480.camel@samba.org>
 <56d3287c51dc769806d8a4966b54e2a6e672d8b0.camel@samba.org>
 <fd178861288df9613902ecec24e52f6a2786cea9.camel@samba.org>
 <644dd37c-1260-ccd4-f1ff-0bc32c7b3a64@itsd.de>
 <97b1240df9a3ec4b465a3e335037591dd803c029.camel@samba.org>
 <7225391f8125266c5ac85e2a28572e9942c440a5.camel@samba.org>
 <0df4f538-c7d9-675b-5b08-27b7c94bc2a3@itsd.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Sat, 2021-05-22 at 23:26 +0200, Dr. Hansjörg Maurer wrote:
> Am 22.05.21 um 00:19 schrieb Andrew Bartlett via samba-technical:
> > I've pushed an updated patch that should work for other things as
> > well.
> > 
> > Andrew Bartlett
> > 
> 
> Hi Andrew
> 
> this one works too.
> Thank you very much!
> Very impressive how you manged it to fix a problem in such a
> complicated 
> code area in such short time!
> 

Thanks!  Yes this was quite a tough nut to crack: quite the mission
really! 

The final iteration here:

https://gitlab.com/samba-team/samba/-/merge_requests/1972

https://gitlab.com/samba-team/samba/-/merge_requests/1972.patch

Finally passes the full CI:

https://gitlab.com/samba-team/devel/samba/-/pipelines/307912677

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


