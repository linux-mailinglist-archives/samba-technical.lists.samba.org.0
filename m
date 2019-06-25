Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8BF5565B
	for <lists+samba-technical@lfdr.de>; Tue, 25 Jun 2019 19:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0dnAKPzuDwmsyaHcQ/xcFQ8K+qBHwBrP/AkEbVROiaY=; b=3gC5A57uugMKpyiP81kKZieZaD
	ket+qnMnldR8Az4H4b4s5VcoAHZ/5+tW30qCA3ZWX081cyDLwmSDO9vWBAau2/MJpySJtbdIMP7Yd
	m0JScERYnlBJ/5oKOEsn7cZRSCXvhC0CC5tsVeiRAh/ZfDu7JLQ/u58bSD3hu0WC/yHx4SGBtabm0
	KuRtKKSoLNuufEpNxH0oCi+WHwJXDxRyvYI5/g5HzJ4LOUhNPOyknW+kyGPC/7YTYWU0Id8GaM+im
	deSgUbUTIoLQZQpN1K7AWCDh5klz1yW3V6lz0vOzO06wDVeUE1qVm4Lu8kKaRPLwGsDjNPkOGczgc
	YuOaLmUw==;
Received: from localhost ([::1]:43766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfpdb-001gpo-Or; Tue, 25 Jun 2019 17:53:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20038) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfpdY-001gph-CG
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 17:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=0dnAKPzuDwmsyaHcQ/xcFQ8K+qBHwBrP/AkEbVROiaY=; b=bHMBCCabXKZ/rYOdhsVR1arNqF
 JVWzGeGhz2LeGdFll+Nq5FsTq2BmFdXi9WkpXjCzwd0lgQ+LH0MMciwiA9A4wi1alyr2e8WHj++T5
 DBs2Q3aEXPyc+HifQdPpFd+tsGsazfuWSkLCzcLEkay+BXvO0x9k9cJXPVXymosKafbg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hfpdV-0005ui-TZ; Tue, 25 Jun 2019 17:53:42 +0000
Date: Tue, 25 Jun 2019 10:53:37 -0700
To: Christopher O Cowan <Christopher.O.Cowan@ibm.com>
Subject: Re: SMB2/SMB3 workloads for testing.  (smbtorture?)
Message-ID: <20190625175337.GA13365@samba.org>
References: <OF98773EBD.D1411451-ON86258423.0069EA03-86258423.006E0810@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF98773EBD.D1411451-ON86258423.0069EA03-86258423.006E0810@notes.na.collabserv.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jun 24, 2019 at 03:01:50PM -0500, Christopher O Cowan via samba-technical wrote:

> In recent years, we've set the MIN Protocol to SMB2, in production, but I
> had not been running that way in my lab.
> 
> Since, I have been using smbtorture and bench.nbench to simulate
> workloads, things broke when I made the change to Min Protocol.
> I'm getting "Failed to open connection -
> NT_STATUS_INVALID_NETWORK_RESPONSE".  I'm thinking either I don't know the
> magic combination of switches, or I'm going to have to change the code a
> bit.    Fully expecting right now, that a different loadfile is needed, as
> well.  (Unless I'm mistaken)

bench.nbench uses SMB1, not any of the newer protocol versions.

> I found two conference presentations in with the SambaXP stuff, but not
> sure that I fully grok things, yet.   My understanding is that nbench is
> just replaying packets previously captured using one of the VFS modules.

nbench basically reads a text file (loadfile) which describes the SMB
requests to issue on each connection. Then you specify how many
connections you want.

> I would appreciate any advice for generating a representative SMB2/SMB3
> workload, hopefully smbtorture.

I don't think there is a similar test for SMB2/SMB3 in smbtorture.

> Regards,
> Chris
> 
> PS: I'm also looking at dbench, as well, but I having a little trouble
> compiling it on a RHEL7 desktop.   Wading through that, right now, as well.

I managed to compile dbench with recent Samba versions. There are some
small changes required.

Christof

