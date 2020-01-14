Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0813E13B523
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 23:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=67qjBzi6t6nYup8TNz5nQMN9AK1wW7QPfLQ7cNgLwQI=; b=kFzXU3pTX6HctzNVGspNj4TjsK
	WLXrr6RIgWSyN/y+7ZKb7KgXpxvWa8CGldAz0WFffF3D74+sD88qKrGU/uLcavGbmv51yxPHYWFcQ
	lghwvWdziGY3wR1npbhW5KARtgyUfqJvqqiwmlxXsGk3GKs21S8HpgUKDErKRSD7t3ZUW47k1aQTv
	5SW4HdJqOCmp50e4TUQENwFgMC0Sm1und1OQMdssTuuMLLr9VOHrTfh1+OJteDiLy7FFmgl+Nb7ft
	wzc1FAyOnBS1dX8qb86Oqqw363mWtIIuU9D9iOmdZ2WEkdjrFPusJseMlcptlbTTcVVOOGVLU9dly
	xD9MjiYw==;
Received: from localhost ([::1]:22542 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irUR6-003SOx-Oy; Tue, 14 Jan 2020 22:13:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13492) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irUR2-003SOo-6G
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 22:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=67qjBzi6t6nYup8TNz5nQMN9AK1wW7QPfLQ7cNgLwQI=; b=M4YjxqpcmX2ewhpBb4Vw5Upf3G
 r57rh7oseu8hnuDKeFcXWAElEa2ifQG2nJcc0kj0PO5FtJyK7uTR1Ec/LRSF72fWbdh8iPny2rFOE
 A+nBReavpyd92rsTbCeRViST/bjqnTpih4XcSCwMK3pe8uVGoAm3FMCDGrc9fUS7NMbyaoBKsGA3K
 KQi2FVgr9bkllLr1owxYJGyyqOC8UaxYmCExl8uVP5sWj9dMSThbeJu5y0AEa6JWnKkxDenJhssvh
 Wvtws4WiYutsvSZ/6kmDPezNNyn/8jRFEBSBClcFafBwrO6YCYWu85mepJneJRvhbbryQDfIKPwXH
 V/fC97RKBYlXFFYHBxGAhG2qXyizmKLuoOqkc66j9hi750ipBmTQwYZUpJrEV7f0Eoq+NNQI9gJwA
 bYNiEw8YEmeLaxzLI3PVfiGSGe+Bs2UVyCE3xLAX2tcYKuvEODSwwbK6Okyv9LbL8pbf3Z9DRNgVk
 qjy0MyqHmQbIUEJWH2txZbJp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irUR1-00077u-Gn; Tue, 14 Jan 2020 22:13:15 +0000
Date: Tue, 14 Jan 2020 14:13:13 -0800
To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Subject: Re: Re: Port knock of 445 prevents smbd from starting
Message-ID: <20200114221313.GF217935@jra4>
References: <041d851df04040098cd3576cb2b91118@ibm.com>
 <20200114215623.GE217935@jra4>
 <4BB9B865-B819-418C-B3AB-1F7EDEB7CF49@ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4BB9B865-B819-418C-B3AB-1F7EDEB7CF49@ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 14, 2020 at 10:08:27PM +0000, Christopher O Cowan - Christopher.O.Cowan--- via samba-technical wrote:
> Smbd -V says
> Version 4.12.0pre1-GIT-375ee2d8fee
> 
> I did a fetch this morning.     I have one patch from Amitay but that's for ctdb_recovery_helper.
> Which messages?

read_fd_with_timeout: blocking read. EOF from client.

matches,

but:

"receive_smb_raw_talloc failed for client" doesn't.

Should be "read_fd_with_timeout failed for client ".

being called inside receive_smb_raw_talloc_partial_read().

You should probably add some debugs to show the len value
returned from read_smb_length_return_keepalive() and
also the timeout being used.

> ﻿On 1/14/20, 3:56 PM, "Jeremy Allison" <jra@samba.org> wrote:
> 
>     On Tue, Jan 14, 2020 at 09:26:24PM +0000, Christopher O Cowan - Christopher.O.Cowan--- via samba-technical wrote:
>     > In our cluster setup here, we use a load-balancer in front of our ctdb cluster to steer the SMB traffic.
>     > We've been doing this for years.    It does a simple TCP connect on 445 to verify that each node's smbd is still alive.
>     > 
>     > This is all on AIX, and some time, in the past few weeks these knocks started causing smbd to exit.   Here's the output from an smbd -i -d10.
>     > 
>     > First I see this (x.y.z.219 is the address of the LB.  202 is the server).    I changed the addresses
>     > 
>     > -----------------------------------------------------------------------------------------------------------------------------------------
>     > 
>     > Allowed connection from x.y.z.219 (x.y.z.219)
>     > Connection allowed from ipv4:x.y.z.219:49463 to ipv4:x.y.z.202:445
>     > ctdbd_control: Sending ctdb packet reqid=7, vnn=4026531841, opcode=23, srvid=17509995351216488448
>     > ctdbd_control: Sending ctdb packet reqid=8, vnn=4026531841, opcode=44, srvid=0
>     > INFO: Current debug levels:
>     > -----------------------------------------------------------------------------------------------------------------------------------------
>     > Then after the debug settings, I see:
>     > -----------------------------------------------------------------------------------------------------------------------------------------
>     > init_oplocks: initializing messages.
>     > Registering messaging pointer for type 774 - private_data=20141c48
>     > Registering messaging pointer for type 778 - private_data=20141c48
>     > Registering messaging pointer for type 770 - private_data=20141c48
>     > Registering messaging pointer for type 787 - private_data=20141c48
>     > Registering messaging pointer for type 779 - private_data=20141c48
>     > Registering messaging pointer for type 15 - private_data=0
>     > Overriding messaging pointer for type 15 - private_data=0
>     > Deregistering messaging pointer for type 16 - private_data=0
>     > Registering messaging pointer for type 16 - private_data=20141c48
>     > Deregistering messaging pointer for type 33 - private_data=2011cf18
>     > Registering messaging pointer for type 33 - private_data=20141c48
>     > Deregistering messaging pointer for type 790 - private_data=0
>     > Registering messaging pointer for type 790 - private_data=20141c48
>     > Deregistering messaging pointer for type 791 - private_data=0
>     > Deregistering messaging pointer for type 1 - private_data=0
>     > Registering messaging pointer for type 1 - private_data=0
>     > event_add_idle: idle_evt(keepalive) 20203538
>     > event_add_idle: idle_evt(deadtime) 202040b8
>     > event_add_idle: idle_evt(housekeeping) 202041c8
>     > read_fd_with_timeout: blocking read. EOF from client.
>     > receive_smb_raw_talloc failed for client ipv4:x.y.z.219:49463 read error = NT_STATUS_END_OF_FILE.
>     
>     What version of Samba. These debug messages don't
>     quite match current master code.
>     
> 

