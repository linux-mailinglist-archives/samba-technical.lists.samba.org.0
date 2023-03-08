Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B36B1333
	for <lists+samba-technical@lfdr.de>; Wed,  8 Mar 2023 21:37:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=1Gujo82yzrtAq5YFM4hCDipPe3dVH9Rk9OW4qNz0y7I=; b=wB0QjSHOJCIFloJ9AdP/mf8a1s
	zlWXkzmcW9fiJtrvwFxyw/Yl3EsZdyUZb2jhFC+9qVZzm3Rw7EEFOOz3SSZuVht6UJt0bVFSyxxRP
	F3G2Jb79ZuK2WAxiEEDimaZie2cWyRXKIsfwRTl+toOGUoZh8SM1h78eLDeyeuuWwin7xXw3wbdVO
	N5VGTuC6e4hYEhCgkxZ248DVEKaO2JlzNSTvcLkUwFdUkHladlzhA+TL2iUMUIObNN2NWts2gRA1n
	FC5djEdTJbVkTutfFg3ArsxzBit00jKLNWxpSCg5H82NxL1tvZ1MCyC2fy/VQ4jMsdKyH/vVPuv6j
	ClWluW/A==;
Received: from ip6-localhost ([::1]:43602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pa0X7-000UU2-LP; Wed, 08 Mar 2023 20:37:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57060) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pa0X2-000UTt-PY
 for samba-technical@lists.samba.org; Wed, 08 Mar 2023 20:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=1Gujo82yzrtAq5YFM4hCDipPe3dVH9Rk9OW4qNz0y7I=; b=l3QuVfPk//CpZqXVUFbctuzy04
 OyiX4BLUDi5mfTynikGP6yxNCym3WrqvJJYEZI2Ogixj/c5/yR5kwiyaiFtYSbk6yHcPi1Rsw1t4Q
 WB0612/aYDv8OCHhHMGpzYBwgc2EKuzHkJlM9o8FQovAlu9Sg72A7GcQ7LUQHmOIVHPhQr55lZFc2
 jN/l8LwsR+HqtC4/azyQ8Dc2kF9J1Xd7qgnIBayFm8fd+LYvTO9amt+fulPHM3mV7LpJbeSFhCok4
 bEU6TUkoR9MHQqjVzgZKAjr3VqsUCy05WwuHlwswQ5PspVCJwTTnspU8DLEfWdJILwngcb46o0jSh
 EdiXcahBaVXIPxxhfws3+EVCYNreXxzMd6hnXAGpgsRBCFxpDFjE9HCCGw2URnXyE6UTNyuKDjwAt
 tTuc71uf7c+czA4NSZjSPCJu0P1HGWDawgeRfVfVUB7VDuq52mSVtMM8I6wx2BcGmL8yDUZVpKqr8
 fpc/6VILkbfprscini4l6YBM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pa0X1-001Z7u-Pu; Wed, 08 Mar 2023 20:37:03 +0000
Date: Wed, 8 Mar 2023 21:38:30 +0100
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Ceph RADOS linearizable?
Message-ID: <20230308213830.4a349610@echidna.fritz.box>
In-Reply-To: <2aac41be-f84b-9595-231a-6c3536e4cbf5@samba.org>
References: <7bc0c282-e9e6-ab70-6dca-227bb9802ef3@samba.org>
 <20230308184741.4e9f2b2b@echidna.fritz.box>
 <2aac41be-f84b-9595-231a-6c3536e4cbf5@samba.org>
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 8 Mar 2023 19:18:54 +0100, Ralph Boehme via samba-technical wrote:

> Hi David,
> 
> On 3/8/23 18:47, David Disseldorp wrote:
> > This a question better suited to the Ceph development list, but I'll do
> > my best to try to answer...  
> 
> you're right. Sorry for being lazy and trying to shortcut... :)))

Well, just keep in mind you'll get a much more informed answer there :)

> >> Can you confirm whether RADOS is indeed Linearizabile? I'm pretty sure
> >> it is, but would like to be sure. :)  
> > 
> > RADOS is a very broad interface when considering linearizability, but
> > if you choose to focus on key/value storage accessed via the Ceph omap
> > interface, then yes, my understanding is that OSD requests for a single
> > object are processed in a way that provides atomic consistency from a
> > RADOS client perspective.  
> 
> well, atomicity is one point related to the single operations or 
> transactions, consistency is a broader concept dealing with the ordering 
> and relation between different operations.
> 
> With linearizable consistency, which is the strongest consistency you 
> can get with single-key operations, you're guaranteed that operations 
> appear in an order consistent with the real-time ordering of those 
> operations. Which as another way to say that for
> 
> Time 1: Client 1: set A to X
> Time 2: Client 2: get A -> ?
> 
> with linearizable consistency it's guaranteed that client 2 reads "X". 
> Which is not the case with weaker consistency levels where the client is 
> allowed to see the old value (whatever that was).

I think it's easier to express this as a protocol sequence diagram. As I
understand things, Ceph omap will provide such guarantees for OSD
acknowledged requests, assuming perfect time synchronisation between
client clocks e.g.

t  Client         Client               primary             replica
.    1               2                   OSD                OSDs
.    |               |                    |                  |
1    |>set_omap(A=X)----->--------------->|                  |
.    |               |                    |   set_omap(A=X)  |
.    |               |                    |>-------->------->|
.    |               |                    |                  |
.    |               |                    |<---ack--<-------<|
.    |               |                    |                  |
.    |<---ack------------<---------------<|                  |
.    |               |                    |                  |
2    |               |>get_omap(A)------->|                  |
.    |               |                    |                  |
.    |               |<-ack(A=X)---------<|                  |
.    |               |                    |                  |

IIUC, if Client 2 above were to send its request before Client 1
received the set_omap acknowledgement, then the get_omap response would
either be A=X *or* the earlier value of A, although nothing in between.

Cheers, David

