Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5756713B4D7
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 22:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2tu4zhg01596Iiop0qle9cRWcjxg+EBahfwd67wX/3g=; b=ps64KHvyTKHIqGtaq857vNM5ur
	/HGQeys+B9wXb+0kyaHX+x0uMIbr5O17dUnqgwTcfHVt9/8gBLhToEtanIOXvytF66cAzHQuTFgEM
	pO2hbTuWJLDBV7rxqgv+m/mGf3lNV5K66B9+NDH3H5q4JkrDEiAMD07aNGdM3icJYo+dpqC4ck8lI
	Eya5UDdfjATnbE1mkc2Jm17ERe9VWnsBpf7kuJ57gxt+Rd2dC2xS5AB/ypL3i4gunNYbw0twfDB6D
	6fxt9d3i4iJymlXVtM+3b58ztcf+2J4by+MB6tEL6dsnUs50aB80JFO0fgfeI/Yj5la5y9ahN0Vi1
	c+YzyyCg==;
Received: from localhost ([::1]:21000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irUAo-003SAZ-TW; Tue, 14 Jan 2020 21:56:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64304) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irUAl-003SAS-6n
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 21:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=2tu4zhg01596Iiop0qle9cRWcjxg+EBahfwd67wX/3g=; b=fqMt3fPaZbvRj42mQkIGcwf5Ft
 8Dug9cC+f+U01UTKbdS6MkdCa2mSiDq0PesmssR1rOBDgbz6bEBUNImUmgBmWiOWaWGnkPvx+VqqS
 tTa9ufYNYHnnQY3Rh+0+athu4/W12LeN/XiPLs7MTahYsenkxGFDXKfX3+hH06/NAVt5pMuP75qkH
 Z8VJGcTB+7ixwgrb7YFqEBs9SitfJqCbevtkeKOf/Z2stjguuUIm4D26JTmZPNeD3mrBzAM73K4LY
 rbePyjdUbiwxeDuXnKwSCx74reioiOOzfE0V3+MkqTAKZsSXTcsC0aoCV8AYeejoIoMenaxTpgoib
 mnyMZt5ySbe7nXxD4t4VlZkXfV82U7teN9rFPxdJ99LdGu87iTdynzc3DwxyFAYyuYpVic1i0BtfU
 gxHICOoS0qIWSrARvaKg4nu+DKphkm19RtmyGCtDZTKlywe2DyLG+cXRO+3DLMUXSAbv/2uT4EAwY
 UiucBmA3q5R85kn4DjWfWL9Z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irUAk-0006wK-GR; Tue, 14 Jan 2020 21:56:26 +0000
Date: Tue, 14 Jan 2020 13:56:23 -0800
To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Subject: Re: Port knock of 445 prevents smbd from starting
Message-ID: <20200114215623.GE217935@jra4>
References: <041d851df04040098cd3576cb2b91118@ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <041d851df04040098cd3576cb2b91118@ibm.com>
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

On Tue, Jan 14, 2020 at 09:26:24PM +0000, Christopher O Cowan - Christopher.O.Cowan--- via samba-technical wrote:
> In our cluster setup here, we use a load-balancer in front of our ctdb cluster to steer the SMB traffic.
> We've been doing this for years.    It does a simple TCP connect on 445 to verify that each node's smbd is still alive.
> 
> This is all on AIX, and some time, in the past few weeks these knocks started causing smbd to exit.   Here's the output from an smbd -i -d10.
> 
> First I see this (x.y.z.219 is the address of the LB.  202 is the server).    I changed the addresses
> 
> -----------------------------------------------------------------------------------------------------------------------------------------
> 
> Allowed connection from x.y.z.219 (x.y.z.219)
> Connection allowed from ipv4:x.y.z.219:49463 to ipv4:x.y.z.202:445
> ctdbd_control: Sending ctdb packet reqid=7, vnn=4026531841, opcode=23, srvid=17509995351216488448
> ctdbd_control: Sending ctdb packet reqid=8, vnn=4026531841, opcode=44, srvid=0
> INFO: Current debug levels:
> -----------------------------------------------------------------------------------------------------------------------------------------
> Then after the debug settings, I see:
> -----------------------------------------------------------------------------------------------------------------------------------------
> init_oplocks: initializing messages.
> Registering messaging pointer for type 774 - private_data=20141c48
> Registering messaging pointer for type 778 - private_data=20141c48
> Registering messaging pointer for type 770 - private_data=20141c48
> Registering messaging pointer for type 787 - private_data=20141c48
> Registering messaging pointer for type 779 - private_data=20141c48
> Registering messaging pointer for type 15 - private_data=0
> Overriding messaging pointer for type 15 - private_data=0
> Deregistering messaging pointer for type 16 - private_data=0
> Registering messaging pointer for type 16 - private_data=20141c48
> Deregistering messaging pointer for type 33 - private_data=2011cf18
> Registering messaging pointer for type 33 - private_data=20141c48
> Deregistering messaging pointer for type 790 - private_data=0
> Registering messaging pointer for type 790 - private_data=20141c48
> Deregistering messaging pointer for type 791 - private_data=0
> Deregistering messaging pointer for type 1 - private_data=0
> Registering messaging pointer for type 1 - private_data=0
> event_add_idle: idle_evt(keepalive) 20203538
> event_add_idle: idle_evt(deadtime) 202040b8
> event_add_idle: idle_evt(housekeeping) 202041c8
> read_fd_with_timeout: blocking read. EOF from client.
> receive_smb_raw_talloc failed for client ipv4:x.y.z.219:49463 read error = NT_STATUS_END_OF_FILE.

What version of Samba. These debug messages don't
quite match current master code.

