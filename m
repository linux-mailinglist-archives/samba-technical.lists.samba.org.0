Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE432E862E
	for <lists+samba-technical@lfdr.de>; Sat,  2 Jan 2021 04:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4c25Q+zoEhOR8/5Mi2GhPgHjLAZPv3vIXNRMlLvirgM=; b=UHVeS/zh1efoT/CsM0zLYfPaCU
	jR0vaf3fsGKWRWb7kwe4G7RSwEeSCZHuTZn04uSjrpAOUev73Mtt/MzWbktFJdrAY+pWRksRl+LMN
	XJYOAh1z6YaMRPNIYFOxqk0QFLreE/CzWZyrKnzfUsneZssAoeHfty7/hgvSMTU4HbOAgCWzdNoZE
	I2FLzuGzXBSxDBv/lxkP/Sp9cHYAdk3GThN9rF/U8phshEM5qY7y1TWixv3Y2s8203rQ6A/KgZDvm
	zFuF52fXGnwHuIIyJyqHyQ7ua6tXwHBwEMrM01MgXBUxQjEJyl6pOtkBKfcfh2c1vJDzeWwml5K75
	guhprsDQ==;
Received: from ip6-localhost ([::1]:40130 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvX8D-004UzX-5m; Sat, 02 Jan 2021 02:59:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10346) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvX83-004UzQ-T7
 for samba-technical@lists.samba.org; Sat, 02 Jan 2021 02:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=4c25Q+zoEhOR8/5Mi2GhPgHjLAZPv3vIXNRMlLvirgM=; b=3bJuW9Gqo98le4vHiwWt83ZGG3
 MTCEmkaTKbcG3QjXzInEKWKbako0Umw97QV2XeyAhztl9TAtE2mRHSu01bMjajbV7K36PvP67xSut
 0i09XW4lJjdXhFfjzC1IfWo/xLedH8FWeH9ENO0axa58sicA8SX7xsdAmK9cbN4DsDUI9Ax+EOdQL
 FwP7aNsSGQF3UFTBGMZw/CZk7vIaeJ0D39E0QoPQfSIaDmLnpenz81+7spem85Tf9liVVuqY4gCbc
 7DsfTtDpTG6wDAbSYifxnODtKVMX4KyrkR8kfdDm5P8eTqClEtDidRXakkT6jmCZWLkF/eXCmGvon
 XSj8lL1U117E0vx30Dsyt72wz2bIsvPAcY/TGCpUiwO759OBy0XsWjVOAi4S5peF1qAUDB1zn4Qh+
 QK3mZKatRdtW6gL090e6UoMu+44vUDCeDomJfl6XtfY0sANIVLFAvgVm5rPoukRD6p03G7RGIRFMV
 VV9u/JcrgaPZ7ml30+b8ciql;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvX7o-0006t8-Qs; Sat, 02 Jan 2021 02:58:41 +0000
Date: Fri, 1 Jan 2021 18:58:37 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
Message-ID: <20210102025837.GA61433@jeremy-acer>
References: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
 <20210101060050.GA1892237@jeremy-acer>
 <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
 <20210101195821.GA41555@jeremy-acer>
 <CAH2r5mvt_cHDbT0xaeLNQn=5cQ0T2-wPgpMkYEGQNdtDZ3kP=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5mvt_cHDbT0xaeLNQn=5cQ0T2-wPgpMkYEGQNdtDZ3kP=A@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 01, 2021 at 05:57:08PM -0500, Steve French wrote:
>4.12.4 Ubuntu
>
>On Fri, Jan 1, 2021, 14:58 Jeremy Allison <jra@samba.org> wrote:
>> >is_bad_finfo_name: bad finfo->name
>> >NT_STATUS_INVALID_NETWORK_RESPONSE listing \*
>> >smb: \> SMBecho failed (NT_STATUS_CONNECTION_DISCONNECTED). The
>> >connection is disconnected now
>>
>> Can you log a bug please and give full setup instructions
>> to reproduce. This isn't enough to show me what the bug is.
>> I need a directory listing from the Server side to show
>> me what files are in the root of the share.
>>
>> Also, you neglect to tell me what Samba version you are
>> using (which is a pre-requisite for a bug report Steve,
>> you know this :-).

To channel Rowland, this isn't a bug report, this is an
anecdote :-).

Here's what I did to show this doesn't happen.

$ mkdir /tmp/chartest
$ touch /tmp/chartest/fil\\e.dat
$ ls -l /tmp/chartest/
total 0
-rw-rw-r-- 1 user user 0 Jan  1 18:52 'fil\e.dat'

Edit /usr/local/samba/etc/smb.conf, add:

[chartest]
	path = /tmp/chartest
	guest ok = yes
	read only = no

Restart smbd. Run:

$ /usr/local/samba/bin/smbclient //127.0.0.1/chartest -Uuser%password -mSMB3
smb: \> ls
   .                                   D        0  Fri Jan  1 18:52:10 2021
   ..                                  D        0  Fri Jan  1 18:51:38 2021
   FI7KDO~J.DAT                        N        0  Fri Jan  1 18:52:10 2021

IF YOU WANT ME TO INVESTIGATE THIS IS NEED A SIMILAR
LEVEL OF DETAIL (sigh). But I *know* you *know*
this...

