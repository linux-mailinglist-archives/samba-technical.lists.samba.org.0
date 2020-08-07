Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF5323F185
	for <lists+samba-technical@lfdr.de>; Fri,  7 Aug 2020 18:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=AaxRU+x5JB/YobCMNde7UteNogJtpipzNBRC6zg9y3U=; b=yvYK4mRUALaEr3mz2thZkBkaof
	rsXQ7gCjHvvqAR3zlPy3t9xifGANt4NTS2dOM5qQOmy4XW94uotuSLffqashaY3dkCjLaD93Y9yE9
	HdEHBOZsRyZIvZhELDUMd7dq2Z+1vhWgOGofR3lPnH5pppNkwM1v7+dnIuNtekaubMpLtOjoGGVoC
	W8sDiO9FOv9UXi5ysQiUrpt/FwCrzBxs5J7nmITjJuKcmVFrTBVAoNH5SoHomWmBn/gzZ4sNBLupA
	XX4HJJoALehNgrStxIynaXjQ5wvXvA9MRUbG98TjqxqXGLuqmuk0XJaNWYwuxr31NL6qwRJ3UbCTB
	YI/MKYTw==;
Received: from localhost ([::1]:63584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k45aV-00Cneh-LX; Fri, 07 Aug 2020 16:51:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40460) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k45aP-00Cnea-C5
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 16:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=AaxRU+x5JB/YobCMNde7UteNogJtpipzNBRC6zg9y3U=; b=btSe38yRQ8q88rN3+J+D6Jdng1
 fs6nAkYWaujb7qraG7Ov94I04DabYrmKvCRXsYrgkcKjey6yFFDnehKkPfC4sYQWdL3WnNBNIoo9C
 J3cDjnaVoFUsB67m1isloq+/Dq6YfOmrLnYya75lQIEIVujvlddHanakzBKfTwA9R1RmKFwPMMBlp
 wbFlG1RjAYNWKMbgo7MDoH6+VSNAa1Mib0ZBVoPCmaEDZb9Hh7PQgy66zrhyAzwiMSWks4+hszZdZ
 +68KTP7J533C5aV9R8L965ZTXCJsuCXyroe4XJjOhFxJZH81TEp7oLjQsiwpBpM7LY5f9r9aQludC
 q1ad7EMg6uIjbFcAXps98zjZcFxVqf+ia5fyHUJsJ9EeOqhPHWogW1Xo9pSkzrDjggwb+g8nEvvlG
 qZ+jDTar/0W3WS/wX2GpNtf09ls8umNJkuSEjAEyfflvH1BW5Ux4NawfSJR3GNv/Emdhbzk/kkHRv
 1Eh7+W9pcsxWV6u4n5hHX6GB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k45aN-0006d0-VZ; Fri, 07 Aug 2020 16:51:16 +0000
Date: Fri, 7 Aug 2020 09:51:10 -0700
To: Ralph Boehme <slow@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: Re: S-1-5-21-Local-SAM-SID-513 -> LOCAL-SAM-NAME\None
Message-ID: <20200807165110.GF6866@jeremy-acer>
References: <83e89636-75d4-547e-c93f-4184da64255b@samba.org>
 <20200807163743.GE6866@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200807163743.GE6866@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 07, 2020 at 09:37:43AM -0700, Jeremy Allison via samba-technical wrote:
> On Fri, Aug 07, 2020 at 06:25:32PM +0200, Ralph Boehme wrote:
> > Howdy!
> > 
> > Can anyone explain this little peace of insanity?
> > 
> > <https://git.samba.org/samba.git/?p=samba.git;a=blob;f=source3/passdb/pdb_interface.c;h=03aa4ff8472198a4600797073cbcc97b5ac93467;hb=HEAD#l1840>
> > 
> > Cheers!
> 
> OK, what it looks like is a call that can *never* fail
> on Windows - e.g. looking up S-1-5-[LOCAL-DOMAIN-PREFIX]-513
> must *always* map to "Domain Users" group.
> 
> To make it not fail in the passb we map it to the name
> "None", so there is a valid name to return.

As in, "make it not fail in passdb if there was no
actual UNIX group mapped to RID-513" for clarity.

