Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F818AE94C
	for <lists+samba-technical@lfdr.de>; Tue, 23 Apr 2024 16:19:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BIPe2rR/omcIne1FVOs9HBK8yvh/o/vmO1NBetcUIuk=; b=GPyVCFRbosQHtLin70EDBEEieC
	LTXm5PEYiXuJzoPtWVlIqk1J8nGM8WALygQGAif1xPagkEjWDlcto9qWaKeiCkpSubTi5fAMe3d//
	Ndg3cCYyRK1oRZCpUnSCz02YKrz8b1W2QM3TmRUUucT2o3KjpjzIUl4NzTmbvwCOSWPhveLQPFdCf
	PmscmQMMGkhEBQOfWf2Pkz825z3aVvVLM4LWuP43Fr7YtKvb2iUALre68yi29zLYfRr1/43deJHG0
	+TCECA0uXiS6kK97ZaRNeJIVxxnUZ6w5chIwuX83iTo1TirvMq6zTOlLeQ1oPAc/EsyWohYFy6qcN
	Lhx8LJzA==;
Received: from ip6-localhost ([::1]:23976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzGzV-005SJ1-U5; Tue, 23 Apr 2024 14:19:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38882) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzGzR-005SIs-Rv
 for samba-technical@lists.samba.org; Tue, 23 Apr 2024 14:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=BIPe2rR/omcIne1FVOs9HBK8yvh/o/vmO1NBetcUIuk=; b=GmG8i7/5+OmkqEcWrbyg9LDrHA
 7b7vjVjwCDLwtn2gRpeX2vlVJk3yDFQCFwtM+Aawovh4TjRyJVYmARNpEslZteuLZ6dqD5NXzUP4g
 GF+zTNMMUy0sG2FhFP108lt+ojttrkogY3AAiF7Ao723smMbdL39z2b4nBRgD4ZYPK2K7oQD+cn66
 0FVDJVBkx0Uv9d0rj4C7hkq/jv6PeE08wa6dt8LoU4AUtyEnV8gkqFDYz+9yFXEJImb5mO+/ASFKH
 DI6VTTB9XYTgtPezQVEuiWY9payf22kf3F6QfEDa5lcS2y8srzchcOKLIHe5KfknljNJFzfbm2qvR
 QO059ERtDY2gitDCLmSoOIJKE1qpej8jPAE/f6E4N+owtIC+hH5IdhknFrPFKo2kbxhJiEBAEYLsl
 +URSe3dRT4vUk3q3Ai7W+7Yvz2x7Pz/5GeH5azAEFS9Z+5RQRLlbefy9jHG/s/iI+0kuWR4PQTj3w
 yG1bOq2doAiVIABMM+myUWZf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzGzP-007tYQ-1w for samba-technical@lists.samba.org;
 Tue, 23 Apr 2024 14:19:19 +0000
Date: Tue, 23 Apr 2024 15:19:17 +0100
To: samba-technical@lists.samba.org
Subject: Re: samba shares across different os's
Message-ID: <20240423151917.40726f90@devstation.samdom.example.com>
In-Reply-To: <015301da9581$80865ce0$819316a0$@aol.com>
References: <015301da9581$80865ce0$819316a0$.ref@aol.com>
 <015301da9581$80865ce0$819316a0$@aol.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 23 Apr 2024 09:23:58 -0400
George via samba-technical <samba-technical@lists.samba.org> wrote:

> It has been a while since I've posted to this forum.  I hope I'm
> posting to the correct forum. 

Sorry, but you really should have posted to the samba mailing list, but
you are here now.

> Here is my problem.
> 
> I have a DLink DNS323 which uses smb1. This device is currently
> mapped as T: and U; on my windows 10 Pro pc and laptop. I also have a
> WD My Cloud gen1 single disk using smb3 I think. 

You sure about that, from my understanding, the OS on that thing is
based on Debian Wheezy and that OS came with Samba 3.6.x and hence no
SMBv3

> I also have a PC
> running Debian Linux 12.5. I want to copy all of the files from the
> DLink device to the WD device. 

I wouldn't, I think you are jumping out of the frying pan into the
fire, both the Dlink and WD device are both elderly, you would probably
(if you can afforrd it) be better off getting a new device.

> After copying all of the files. I
> unmapped the T: and U; shares of the DLink device and mapped T: and
> U: from the WD device. After the mapping I checked some of the
> folders and found that only the top level files and folders were
> visible. Every folder was empty. After a log of fiddling I got most
> of the folders to show files. Not sure what I finally did to get this
> almost working. So I tried to mount the WD device to the Linux PC and
> got the same problem of the folders being empty. My question is what
> do I need to do the be able to mount the WD device on the windows PC
> and the Linux PC with all files available. I want to use the Linux PC
> as backup for the WD device and use the WD device as backup for some
> files from the Linux PC.
> 

How did you copy the files ?
Have you checked that your Win10 machines have SMBv1 turned on.

Rowland
 


