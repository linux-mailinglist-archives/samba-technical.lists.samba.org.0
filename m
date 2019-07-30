Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5097AEC8
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 19:00:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=EuboqjbOWhmhSo9rxMn1k/h4JIeKboojgobUrWS3kEA=; b=gesms8h/rcdCiC3H3JHynLIP1B
	bqWEM0/9tTe9S5t5/ca2iONfwr0d2TVdeNv+E7Sb4Eniow+Jw93CVPZ+Kqy55xoaZ6JQPBzWV1taC
	30zflYT9rWxOVf2odPUyKPxojaN81Z1ZL6Bz2+jSa+iYv3mPjG7TSGOigUSEYhTeS8xIuOf7Wik+H
	TMyVtGMVxqzcBg2/cg5nNBALCcgIaEoNbyCe7sPTMSNWwHw4guiWdoK7W/mq8/uZT7smvLdhggnoz
	53NMuk0wQltITHNGwa+33Jsu70E3CibP2Xn0dgqQTUuwLZsQdMb1mMKfEwBUSLyi/pT/+wAv3N6Gw
	USYj6IgA==;
Received: from localhost ([::1]:32964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsVTk-0012W8-Tb; Tue, 30 Jul 2019 17:00:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43910) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsVTh-0012W1-FR
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 16:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=EuboqjbOWhmhSo9rxMn1k/h4JIeKboojgobUrWS3kEA=; b=umabrHXuRpTcbELF24wHfnwXEU
 +GyGZ7hLhJ48M+DnoipkSddwZqFZOAmHK9qh548+xzT0E0uXX4cKptPjNR0N7C72e7g2dYJHO8GUd
 R4oeMMlBeG0gKtScXj/GcpzAr7SA63z72+6S1FYcdLsFmzB1oBoWYQwUYQzy0SmH/iJU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsVTg-0004vo-E9; Tue, 30 Jul 2019 16:59:56 +0000
Date: Tue, 30 Jul 2019 09:59:54 -0700
To: Sonic <sonicsmith@gmail.com>
Subject: Re: Turning off SMB1 make slashdot and theregister !
Message-ID: <20190730165954.GE128128@jra4>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
 <CAP5+4qdrwPjgb6TLa2nXJ8HBibR2t0T=of17_pXrwUjAyM2+ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP5+4qdrwPjgb6TLa2nXJ8HBibR2t0T=of17_pXrwUjAyM2+ow@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jul 25, 2019 at 03:55:30PM -0400, Sonic via samba-technical wrote:
> I'm pretty sure my Oppo 105 Blu-Ray player, which I stream video to via
> Samba, can only use SMBv1. There may be other such devices with this
> limitation as well.

There are - all my SONOS devices for example.

But the effort required to keep supporting them
is killing the fileserver codebase (IMHO).

I'll run an old version of Samba on a modern
Linux box and proxy SMB1 exported from Samba
to SMB2 via an SMB2 share mounted by Steve's
CIFSFS Linux kernel code - that will allow
my systems to keep working.

There are existing solutions for old SMB1
devices that don't involve keeping this
complexity in our fileserver code forever.

Jeremy.

