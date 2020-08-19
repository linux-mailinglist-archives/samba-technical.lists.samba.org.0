Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D00D824A8E0
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 00:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=duiw15gytYy2QCYetLKqq2QCnQPpED/Oioghw55OcEI=; b=FlIT/+dg2YscEflD7kzpavuKFj
	ByrE8i76Y384sp8YCGCHZLPdE+DwOLJ0lpyrnwkYH3ddLuSbuVVwA2KO7iQaUtxnEOG4xRN/kBKL0
	1XLeZsA1QOLfx+uB7JDEY/dHk/QNn4tRbzVDOl6RoNJC7uoDDSYJWFJK7ydJ6ZyD6zgtvV9K77yQC
	6aqMfQUPxQCxYD0ONEdOZZbOyNLkJzg+k51jKALgmiaTmHAd0FTKE8jeUmq/m3gW5J+XcOgkI8PfY
	2tK0ima5NfXB+ZqYiOlsjBBUrl6lBNvm2hNf60hTfwV5mCI8tXKE1pbGsVWPfeE1oUDopnQ66jqGx
	GeQ9XavA==;
Received: from localhost ([::1]:53322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8WEq-00ELvj-1R; Wed, 19 Aug 2020 22:07:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27524) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8WEi-00ELvc-Ok
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 22:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=duiw15gytYy2QCYetLKqq2QCnQPpED/Oioghw55OcEI=; b=O6iE2LWosAm6FDPyfFer3rsaXD
 ciU7Q7icpUWh5Mrlyr4FvJOSHssYO9OGIioB1sFrTddFF+ZMelCJYPrH/wozecEa6w9xzPojyU2hJ
 u3mkBEv7jyVF1W12SP4k/8ocpL4SQQgzivZ/cRZzRMBJhTqxjdqTdVF9Q00GXFh+tjaA6QVpOezSq
 OglFPFh8yiPJabMU/XJKmdJVL4Ozca3z45thoofTdb82HL2MKlbB7+/6S3YFX4Jkolf2iLiOJiyJQ
 l4d460CnT6D4FnBaZcnRb5U3EcOopmiERKcQK6qjxJCr+zaCHq+FMzwEveH5Tm0efWiJR2y6QG87Z
 pwj80zwW2B4gDAS94o4dKRbPLi7lgEOmoAG9mW+O8Ly30FfjcbD9iO1OHBAy8pozl3D6BOtofc+eN
 lNk6VWdBLW+3mrXBt4NZsGzRvQ/zlSOzuwZReEK1TRsuZ2C7UQbVtMnmjGQZjYkSwVwb/l6EuiQas
 Z2WHp0Z3Nouo3qoF+mw7dOGv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8WEg-0005ZX-Pd; Wed, 19 Aug 2020 22:07:11 +0000
Message-ID: <ee82d2949cad0fcbf5979a377344f10f5db09644.camel@samba.org>
Subject: Re: WIP: Samba's client command line UI
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Thu, 20 Aug 2020 10:07:05 +1200
In-Reply-To: <3749194.YmznvRLumo@magrathea>
References: <3749194.YmznvRLumo@magrathea>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-08-19 at 10:02 +0200, Andreas Schneider via samba-
technical wrote:
> Hi,
> 
> I'm working to cleaning up the mess we have with our client cmdline
> UI [1].

Thank you so much for taking this on.  I really do appreciate it.

> Currently we have a source3 and a source4 parsing implementation. I
> have 
> rewritten the command line parsing code. The only real difference
> between the 
> two is only how the config file is loaded. So I created a s3 and s4
> config 
> loader and that's it.

Awesome.  I've been trying (and sadly failing) to do something similar
in the python code, generally using the s3 config loader and just
wrapping it into an s4/python object.  It almost worked, but got stuck
on some odd cases in the upgrade tools that relies on smb.conf
behaviour too much.

> The big change is that we need new options to fix a lot of issues
> face: The 
> biggest change is probably about Kerberos:
> 
> 	--use-kerberos=yes|auto|no
> 
> New is that we have options to correctly request signing and
> encryption:
> 
>       --gensec-client-protection=plain|sign|seal
> 
>       --smb-signing=off|if_required|desired|required
>       --smb-ipc-signing=off|if_required|desired|required
>       --smb-encryption=off|if_required|desired|required
> 
> You can find the code at [2].
> 
> 
> 	NOTE that this is still work in progress and no all the stuff
> is
> 	wired correctly yet!
> 
> 
> But I wanted to show you what I'm working on and you can comment. 

I really appreciate this.  It is awesome seeing planned work being
discussed here recently and I celebrate this and similar efforts.

> Feedback is welcome :-)

From the example above, I did just wonder if we are still presenting
too much nerdview.  That is, why should a user need to know what GENSEC
or SMB-IPC is?

What do you think about a single option of --connection-protection?

Thanks for all the hard work!

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




